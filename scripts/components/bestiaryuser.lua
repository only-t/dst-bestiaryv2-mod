local DUMMY_LootDropper = Class(function(self, inst) -- This is so I can replicate `lootsetupfn` and pull drops that get generated from it
    self.inst = inst                                 -- Remember to update it if Klei changes LootDropper

    self.numrandomloot = nil
    self.randomloot = nil
    self.chancerandomloot = nil
    self.chanceloot = nil
    self.ifnotchanceloot = nil
    self.loot = nil
    self.chanceloottable = nil
end)

function DUMMY_LootDropper:SetChanceLootTable(name)
    self.chanceloottable = name
end

function DUMMY_LootDropper:SetLoot(loots)
    self.loot = loots
    self.chanceloot = nil
    self.randomloot = nil
    self.numrandomloot = nil
end

function DUMMY_LootDropper:AddRandomLoot(prefab, weight)
    if not self.randomloot then
        self.randomloot = {}
        self.totalrandomweight = 0
    end

    table.insert(self.randomloot, { prefab = prefab, weight = weight })
    self.totalrandomweight = self.totalrandomweight + weight
end

-- This overrides the normal loot table while haunted
function DUMMY_LootDropper:AddRandomHauntedLoot(prefab, weight)
    if not self.randomhauntedloot then
        self.randomhauntedloot = {}
        self.totalhauntedrandomweight = 0
    end

    table.insert(self.randomhauntedloot, { prefab = prefab, weight = weight })
    self.totalhauntedrandomweight = self.totalhauntedrandomweight + weight
end

function DUMMY_LootDropper:AddChanceLoot(prefab, chance)
    if not self.chanceloot then
        self.chanceloot = {}
    end
    table.insert(self.chanceloot, { prefab = prefab, chance = chance })
end

function DUMMY_LootDropper:AddIfNotChanceLoot(prefab)
    if not self.ifnotchanceloot then
        self.ifnotchanceloot = {}
    end
    table.insert(self.ifnotchanceloot, { prefab = prefab })
end

--[[ ----------------------------------------------------------------------- ]]

local function GetCaughtAnim(ent)
    local debugstring = ent.entity:GetDebugString()

    if debugstring then
        local _, animname_start = string.find(debugstring, "anim: ")

        if animname_start then
            local animname_end = string.find(debugstring, " ", animname_start + 1)

            return string.sub(debugstring, animname_start + 1, animname_end - 1)
        end
    end
end

local CANT_DICOVERY_TAGS = { "FX", "INLIMBO", "DECOR", "player", "structure", "light", "notarget", "wall", "boat", "projectile", "hedge_hound_bush" }
local ONEOF_DISCOVERY_TAGS = { "_combat", "_health", "king", "mermking", "NET_workable" }
local BestiaryUser = Class(function(self, inst)
    self.inst = inst

    self.discovered_mobs = {  }
    self.learned_mobs = {  }

    self.discover_task = self.inst:DoPeriodicTask(0.25, function(inst)
        if inst:HasTag("playerghost") or inst:HasTag("corpse") then
            return
        end

        local x, y, z = inst.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x, y, z, TUNING.DISCOVER_MOB_RANGE, nil, CANT_DICOVERY_TAGS, ONEOF_DISCOVERY_TAGS)

        for i, ent in ipairs(ents) do
            self:DiscoverMob(ent)
        end
    end)
end)

function BestiaryUser:OnLoad()
    local file = io.open(BESTIARYMODROOTFOLDER.."/bestiarydata", "r")

    if file == nil then
        return
    end

    local status, bestiary = pcall(function() return json.decode(file:read()) end)

    if status and bestiary then
        self.discovered_mobs = bestiary.discovered_mobs or {  }
        self.learned_mobs = bestiary.learned_mobs or {  }
    else
        print("Failed to load the bestiary on the server!", status, bestiary)
    end

    file:close()
end

function BestiaryUser:OnRemoveFromEntity()
    if self.discover_task then
        self.discover_task:Cancel()
    end
end

function BestiaryUser:DiscoverMob(mob)
    if mob == nil or type(mob) ~= "table" then
        return
    end

    if self.discovered_mobs[mob.prefab] then
        local caught_anim_name = GetCaughtAnim(mob)

        if not self.discovered_mobs[mob.prefab].anims[caught_anim_name] then
            self.discovered_mobs[mob.prefab].anims[caught_anim_name] = true
        end

        return
    end
    
    self.discovered_mobs[mob.prefab] = { name = mob:GetBasicDisplayName() }
    
    local mob_data = self.discovered_mobs[mob.prefab]

    mob_data.bank = mob.AnimState:GetCurrentBankName()
    mob_data.build = mob.AnimState:GetBuild()
    mob_data.anims = {  }
    mob_data.anims[(GetCaughtAnim(mob) or "idle")] = true -- or "idle" is a last effort
    local x1, y1, x2, y2 = mob.AnimState:GetVisualBB()
    mob_data.bb = { x1 = x1, y1 = y1, x2 = x2, y2 = y2 }

    if mob.components.health then
        mob_data.health = mob.components.health.maxhealth
    end

    if mob.components.combat then
        mob_data.damage = mob.components.combat.defaultdamage
    end

    if mob.components.locomotor then
        mob_data.walkspeed = mob.components.locomotor.walkspeed or nil
        mob_data.runspeed = mob.components.locomotor.runspeed or nil
    end

    if mob.components.lootdropper then
        local loot_tables = {  }
        if mob.components.lootdropper.lootsetupfn then
            local dummy_lootdropper = DUMMY_LootDropper(mob)
            mob.components.lootdropper.lootsetupfn(dummy_lootdropper)

            mob_data.chanceloot = mob.components.lootdropper.chanceloot or nil
            mob_data.randomloot = mob.components.lootdropper.randomloot or nil
            mob_data.numrandomloot = mob.components.lootdropper.numrandomloot or nil
            mob_data.chancerandomloot = mob.components.lootdropper.chancerandomloot or nil
            mob_data.chanceloottable = mob.components.lootdropper.chanceloottable or nil

            loot_tables.dummy_loot = dummy_lootdropper.loot
            loot_tables.dummy_chanceloot = dummy_lootdropper.chanceloot
            loot_tables.dummy_randomloot = dummy_lootdropper.randomloot
            loot_tables.dummy_numrandomloot = dummy_lootdropper.numrandomloot
            loot_tables.dummy_chancerandomloot = dummy_lootdropper.chancerandomloot
            loot_tables.dummy_chanceloottable = dummy_lootdropper.chanceloottable
        else
            loot_tables.loot = mob.components.lootdropper.loot
            loot_tables.chanceloot = mob.components.lootdropper.chanceloot
            loot_tables.randomloot = mob.components.lootdropper.randomloot
            loot_tables.numrandomloot = mob.components.lootdropper.numrandomloot
            loot_tables.chancerandomloot = mob.components.lootdropper.chancerandomloot
            loot_tables.chanceloottable = mob.components.lootdropper.chanceloottable
        end

        mob_data.loot_tables = loot_tables or nil
    end

    if mob.components.health and mob.components.health.maxhealth >= 10000 then -- Max health over 10000 == Raid Boss ¯\_(ツ)_/¯ 
        mob_data.type = STRINGS.MOB_TYPES.RAIDBOSS
    elseif mob:HasTag("epic") then
        mob_data.type = STRINGS.MOB_TYPES.BOSS
    elseif mob:HasTag("monster") then
        mob_data.type = STRINGS.MOB_TYPES.MONSTER
    else
        mob_data.type = STRINGS.MOB_TYPES.ANIMAL
    end

    if mob.components.amphibiouscreature then
        mob_data.canswim = true
    end

    if mob:HasTag("flying") then
        mob_data.isflying = true
    end

    if mob:HasTag("hostile") then
        mob_data.ishostile = mob:HasTag("hostile") and true or false
    end

    local str = json.encode({ discovered_mobs = self.discovered_mobs, learned_mobs = self.learned_mobs })
    local file = _G.io.open(BESTIARYMODROOTFOLDER.."/bestiarydata", "w")
    file:write(str)
    file:close()
    
    if (TheNet:IsDedicated() or (TheWorld.ismastersim and self.inst ~= ThePlayer)) and self.inst.userid then
        SendModRPCToClient(GetClientModRPC("󰀈 Bestiary 󰀈", "SyncBestiaryOnClient"), self.inst.userid)
    end
end

function BestiaryUser:OpenBestiary()
    local act = BufferedAction(self.inst, nil, ACTIONS.OPEN_BESTIARY)
    self.inst.components.locomotor:PushAction(act)
end

function BestiaryUser:PrintDebugString()
    for prefab, data in pairs(self.discovered_mobs) do
        print("-----")
        print("Prefab: "..prefab)
        print("Display name: "..data.name)
        print("Bank: "..(data.bank or "nil"))
        print("Build: "..(data.build or "nil"))
        print("Animations: ")
        for animname, _ in pairs(data.anims) do
            print("  "..animname)
        end
        print("Health: "..(data.health or "nil"))
        print("Damage: "..(data.damage or "nil"))
        print("Walking speed: "..(data.walkspeed or "nil"))
        print("Running speed: "..(data.runspeed or "nil"))
        print("Type: "..(data.type or "nil"))
        print("Is hostile: "..(data.ishostile and "true" or "false"))
        print("Can swim: "..(data.canswim and "true" or "false"))
        print("Is flying: "..(data.isflying and "true" or "false"))
        print("-")
        print("Learned: "..(self.learned_mobs[name] and "true" or "false"))
        print("-----")
    end
end

-- function BestiaryUser:LearnMob(mob) -- TODO
--     self.learned_mobs[mob.prefab] = {  }
--     local data = self.learned_mobs[mob.prefab]

--     if mob.components.lootdropper then
--         if mob.components.lootdropper.lootsetupfn then
--             mob.components.lootdropper:lootsetupfn()
--         end

--         if mob.components.lootdropper.randomloot then
--             -- data["loot"] = {  }

--             for i, loot in ipairs(mob.components.lootdropper.randomloot) do
--                 local chance = loot.weight/mob.components.lootdropper.totalrandomweight

--                 TheNet:Announce(loot.prefab)
--                 TheNet:Announce(chance)
--             end
--         end
        
--         -- self.numrandomloot = nil
--         -- self.totalrandomweight = nil
--         -- self.chanceloot = nil
--         -- self.ifnotchanceloot = nil
--         -- self.droppingchanceloot = false
--         -- self.loot = nil
--         -- self.chanceloottable = nil
--     end
-- end

return BestiaryUser