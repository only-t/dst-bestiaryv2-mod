local CANT_DICOVERY_TAGS = { "FX", "INLIMBO", "DECOR", "player", "structure", "light", "notarget", "wall" }
local ONEOF_DISCOVERY_TAGS = { "_combat", "_health", "king", "mermking", "NET_workable" }
local BestiaryUser = Class(function(self, inst)
    self.inst = inst

    self.discovered_mobs = {  }
    self.learned_mobs = {  }

    self.discover_task = self.inst:DoPeriodicTask(1, function(inst)
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

function BestiaryUser:OnRemoveFromEntity()
    if self.discover_task then
        self.discover_task:Cancel()
    end
end

function BestiaryUser:DiscoverMob(mob)
    if mob == nil or type(mob) ~= "table" or self.discovered_mobs[mob.prefab] then
        return
    end
    
    self.discovered_mobs[mob.prefab] = { name = mob.prefab }
    
    local mob_data = self.discovered_mobs[mob.prefab]
    local mob_data_table = { mob.prefab }

    mob_data.bank = "spider"
    -- mob_data.build = mob.AnimState:GetBuild()
    mob_data.build = "spider_build"
    mob_data.anim_idle = "idle"
    table.insert(mob_data_table, mob_data.bank)
    table.insert(mob_data_table, mob_data.build)
    table.insert(mob_data_table, mob_data.anim_idle)

    if mob.components.health then
        mob_data.health = mob.components.health.maxhealth
        table.insert(mob_data_table, mob_data.health)
    end

    if mob.components.combat then
        mob_data.damage = mob.components.combat.defaultdamage
        table.insert(mob_data_table, mob_data.damage)
    end

    if mob.components.locomotor then
        mob_data.walkspeed = mob.components.locomotor.walkspeed or nil
        mob_data.runspeed = mob.components.locomotor.runspeed or nil

        if mob_data.walkspeed then table.insert(mob_data_table, mob_data.walkspeed) end
        if mob_data.runspeed then table.insert(mob_data_table, mob_data.runspeed) end
    end

    if (TheNet:IsDedicated() or (TheWorld.ismastersim and self.inst ~= ThePlayer)) and self.inst.userid then
        SendModRPCToClient(GetClientModRPC("󰀈 Bestiary 󰀈", "DiscoverMob"), self.inst.userid, unpack(mob_data_table))
    end
end

function BestiaryUser:PrintDebugString()
    for name, data in pairs(self.discovered_mobs) do
        print("-----")
        print("Name: "..name)
        print("Health: "..(data.health or "nil"))
        print("Damage: "..(data.damage or "nil"))
        print("Walking speed: "..(data.walkspeed or "nil"))
        print("Running speed: "..(data.runspeed or "nil"))
        print("-----")
    end
end

-- function BestiaryUser:LearnMob(mob)
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