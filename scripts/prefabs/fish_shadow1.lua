local assets = {
    Asset("ANIM", "anim/fish_shadow1.zip"),
    Asset("SOUND", "sound/fish_shadow1.fsb")
}

local MUST_DICOVER_TAGS = { "player" }
local CANT_DICOVER_TAGS = { "playerghost", "corpse" }
local function LookForPlayers(inst, dt)
    local x, y, z = inst.Transform:GetWorldPosition()
    local players = TheSim:FindEntities(x, y, z, TUNING.SUPRISE_FISH_DISCOVER_RANGE, MUST_DICOVER_TAGS, CANT_DICOVER_TAGS)

    for i, player in ipairs(players) do
        if not table.contains(inst.discover_list, player) then
            table.insert(inst.discover_list, player)
        end
    end
end

local function DiscoverBestiaryEntry(inst)
    for i, player in ipairs(inst.discover_list) do
        TheNet:Announce(player.prefab)
        -- Discover hidden bestiary entry : TODO
    end
end

local function Warn(inst)
    inst:DoTaskInTime(math.random(0, 2), function()
        inst.SoundEmitter:PlaySound("fish_shadow1/warning/warning_far", nil, 2)

        DiscoverBestiaryEntry(inst)
    end)
end

local function Submerge(inst)
    inst:DoTaskInTime(math.random(1, 2), function()
        inst.components.colourtweener:StartTween({ 0.8, 0.8, 0.8, 0 }, 3, Warn)
        inst.components.sizetweener:StartTween(6, 3)
    end)
end

local function Emerge(inst)
    inst.components.colourtweener:StartTween({ 0.8, 0.8, 0.8, 0.2 }, 3, Submerge)
    inst.components.sizetweener:StartTween(10, 3)
end

local function OnEntitySleep(inst)
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddPhysics()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.Transform:SetEightFaced()
    inst.Transform:SetScale(6, 6, 6)

    inst:AddTag("scarytoprey")
	inst:AddTag("notarget")
	inst:AddTag("NOCLICK")
	inst:AddTag("NOBLOCK")

    inst.AnimState:SetBank("fish_shadow1")
    inst.AnimState:SetBuild("fish_shadow1")
    inst.AnimState:PlayAnimation("swimming", true)
    inst.AnimState:SetMultColour(0.8, 0.8, 0.8, 0)
    inst.AnimState:SetSortOrder(ANIM_SORT_ORDER_BELOW_GROUND.UNDERWATER)
    inst.AnimState:SetLayer(LAYER_WIP_BELOW_OCEAN)

    inst.Physics:SetMass(1000)
    inst.Physics:SetFriction(0)
    inst.Physics:SetDamping(5)
    inst.Physics:SetCapsule(2, 1)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = TUNING.SPIDER_WALK_SPEED
    inst.components.locomotor.runspeed = TUNING.SPIDER_RUN_SPEED

    inst:AddComponent("colourtweener")
    inst:AddComponent("sizetweener")

    inst:AddComponent("updatelooper")
    inst.components.updatelooper:AddOnUpdateFn(LookForPlayers)

    inst.discover_list = {  }
    Emerge(inst)

	inst.persists = false
    inst.OnEntitySleep = OnEntitySleep

    return inst
end

return Prefab("fish_shadow1", fn, assets)