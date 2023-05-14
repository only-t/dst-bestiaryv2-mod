local BestiaryData = Class(function(self)
	self.discovered_mobs = {  }
	self.learned_mobs = {  }
end)

function BestiaryData:ReadBestiaryData()
	local file = io.open(BESTIARYMODROOTFOLDER.."/bestiarydata", "r")

    if file == nil then
        return
    end

    local status, bestiary = pcall(function() return json.decode(file:read()) end)

    if status and bestiary then
        self.discovered_mobs = bestiary.discovered_mobs or {  }
        self.learned_mobs = bestiary.learned_mobs or {  }
    else
        print("Failed to load the bestiary on the client!", status, bestiary)
    end

    file:close()
end

function BestiaryData:GetDiscoveredMobs()
	local t = {  }
	for name, data in pairs(self.discovered_mobs) do
		table.insert(t, data)
	end

	return t
end

function BestiaryData:GetLearnedMobs()
	local t = {  }
	for name, data in pairs(self.learned_mobs) do
		table.insert(t, data)
	end

	return t
end

function BestiaryData:PrintDebugString()
    for name, data in pairs(self.discovered_mobs) do
        print("-----")
        print("Name: "..name)
        print("Bank: "..(data.bank or "nil"))
        print("Build: "..(data.build or "nil"))
        print("Idle animation: "..(data.anim_idle or "nil"))
        print("Health: "..(data.health or "nil"))
        print("Damage: "..(data.damage or "nil"))
        print("Walking speed: "..(data.walkspeed or "nil"))
        print("Running speed: "..(data.runspeed or "nil"))
        print("Type: "..(data.type or "nil"))
        print("Is hostile: "..(data.ishostile and "true" or "false"))
        print("Can swim: "..(data.canswim and "true" or "false"))
        print("Is flying: "..(data.isflying and "true" or "false"))
        print("-----")
    end
end

return BestiaryData