local MUST_DISCOVERY_TAGS = {  }
local CANT_DICOVERY_TAGS = { "FX", "LIMBO", "player", "structure", "light" }
local ONEOF_DISCOVERY_TAGS = { "_combat", "_health", "trader" }

local BestiaryUser = Class(function(self, inst)
    self.inst = inst

    self.discovered_mobs = {  }
    self.learned_mobs = {  }

    self.discover_task = self.inst:DoPeriodicTask(1, function(inst)
        local x, y, z = inst.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x, y, z, TUNING.DISCOVER_MOB_RANGE, nil, CANT_DICOVERY_TAGS, ONEOF_DISCOVERY_TAGS)

        TheNet:Announce("-----")

        for i, ent in ipairs(ents) do
            TheNet:Announce(ent.prefab or "nil")
        end
    end)
end)

function BestiaryUser:TryDiscovering()

end

function BestiaryUser:DiscoverMob()

end

function BestiaryUser:LearnMob()

end

return BestiaryUser