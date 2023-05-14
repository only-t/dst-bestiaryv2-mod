--------------------------------------------------------------------------
--[[ SupriseFishSpawner class definition ]]
--------------------------------------------------------------------------

return Class(function(self, inst)

assert(TheWorld.ismastersim, "SupriseFishSpawner should not exist on client")

--------------------------------------------------------------------------
--[[ Member variables ]]
--------------------------------------------------------------------------

--Public
self.inst = inst

--Private
local _scheduledtasks = {  }
local _fishesprefabs = {
    "fish_shadow1"
}

--------------------------------------------------------------------------
--[[ Private member functions ]]
--------------------------------------------------------------------------

local function IsValidOceanTiles(pt)
    return TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z) == WORLD_TILES.OCEAN_HAZARDOUS or
           TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z) == WORLD_TILES.OCEAN_ROUGH
end

local function IsCloseToImpassable(pt, radius)
    local x, y = TheWorld.Map:GetTileCoordsAtPoint(pt:Get())

    for i = -radius, radius, 1 do
        if TileGroupManager:IsImpassableTile(TheWorld.Map:GetTile(x - radius, y + i)) or TileGroupManager:IsImpassableTile(TheWorld.Map:GetTile(x + radius, y + i)) then
            return true
        end
    end

    for i = -(radius - 1), radius - 1, 1 do
        if TileGroupManager:IsImpassableTile(TheWorld.Map:GetTile(x + i, y - radius)) or TileGroupManager:IsImpassableTile(TheWorld.Map:GetTile(x + i, y + radius)) then
            return true
        end
    end

    return false
end

local function GetValidSpawnPoint(pt)
    local function TestSpawnPoint(offset)
        local x, y, z = (pt + offset):Get()
        return TheWorld.Map:IsOceanAtPoint(x, y, z) and IsValidOceanTiles(pt + offset) and not IsCloseToImpassable(pt + offset, 6)
    end

    local theta = math.random()*2*PI
    local resultoffset = FindValidPositionByFan(theta, 24 + math.random()*2, 8, TestSpawnPoint)
                        or FindValidPositionByFan(theta, 22 + math.random()*2, 12, TestSpawnPoint)
                        or FindValidPositionByFan(theta, 20 + math.random()*2, 16, TestSpawnPoint)
                        or nil

    if resultoffset then
        return pt + resultoffset
    end
end

local function ShouldSpawnFishForPlayer(player)
    local pt = player:GetPosition()
    local percent_ocean = TheWorld.Map:CalcPercentOceanTilesAtPoint(pt.x, pt.y, pt.z, 25)
    local raining_bonus = TheWorld.state.israining and 1.3 or 1
    local night_bonus = not TheWorld.state.isday and 1.3 or 1

    return percent_ocean > TUNING.SCHOOL_SPAWNER_FISH_OCEAN_PERCENT and
            TheWorld.state.cycles > TUNING.SUPRISE_FISH_WORLD_AGE_DELAY and
            math.random() <= TUNING.SUPRISE_FISH_SPAWN_CHANCE*raining_bonus*night_bonus
end

local function TrySpawning(player, reschedule)
    if ShouldSpawnFishForPlayer(player) then
        local spawnpoint = GetValidSpawnPoint(player:GetPosition())

        if spawnpoint then
            self:SpawnFish(spawnpoint, player)
        else
            print("Could not find a valid spawning position for a suprise fish.")
        end
    end

    _scheduledtasks[player] = nil
    reschedule(player)
end

local function ScheduleSpawn(player)
    if _scheduledtasks[player] == nil then
        _scheduledtasks[player] = player:DoTaskInTime(GetRandomMinMax(TUNING.SUPRISE_FISH_SPAWN_DELAY.min, TUNING.SUPRISE_FISH_SPAWN_DELAY.max), TrySpawning, ScheduleSpawn)
    end
end

local function CancelSpawn(player)
    if _scheduledtasks[player] then
        _scheduledtasks[player]:Cancel()
        _scheduledtasks[player] = nil
    end
end

local function OnPlayerJoined(src, player)
    ScheduleSpawn(player)
end

local function OnPlayerLeft(src, player)
    CancelSpawn(player)
end

for i, player in ipairs(AllPlayers) do
    ScheduleSpawn(player)
end

--------------------------------------------------------------------------
--[[ Initialization ]]
--------------------------------------------------------------------------

inst:ListenForEvent("ms_playerjoined", OnPlayerJoined, TheWorld)
inst:ListenForEvent("ms_playerleft", OnPlayerLeft, TheWorld)

--------------------------------------------------------------------------
--[[ Public member functions ]]
--------------------------------------------------------------------------

function self:SpawnFish(pt, player)
    local fish = _fishesprefabs[math.random(#_fishesprefabs)]
    local px, py, pz = player.Transform:GetWorldPosition()

    if fish then
        fish = SpawnPrefab(fish)
        fish.Transform:SetPosition(pt:Get())
        fish.Physics:SetMotorVel(0.6, 0, 0)

        local rot = fish:GetAngleToPoint(px, py, pz) + math.random()*20 - 10
        fish.Transform:SetRotation(rot)
    end
end

function self:TryForceSpawnFish(player)
    local spawnpoint = GetValidSpawnPoint(player:GetPosition())

    if spawnpoint then
        self:SpawnFish(spawnpoint, player)
    else
        print("Could not find a valid spawning position for a suprise fish.")
    end
end

end)