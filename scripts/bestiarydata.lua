local BestiaryData = Class(function(self)
	self.discovered_mobs = {  }
	self.learned_mobs = {  }
end)

function BestiaryData:Save(force_save)
	if force_save or self.dirty then
		local str = json.encode({ discovered_mobs = self.discovered_mobs, learned_mobs = self.learned_mobs })

		TheSim:SetPersistentString("bestiary", str, false)
		self.dirty = false
	end
end

function BestiaryData:Load()
	TheSim:GetPersistentString("bestiary", function(load_success, data)
		if load_success and data then
			local status, bestiary = pcall(function() return json.decode(data) end)

		    if status and bestiary then
				self.discovered_mobs = bestiary.discovered_mobs or {  }
				self.learned_mobs = bestiary.learned_mobs or {  }
			else
				print("Failed to load the bestiary!", status, bestiary)
			end
		end
	end)
end

function BestiaryData:DiscoverMob(mob_data)
	if mob_data and self.discovered_mobs[mob_data.name] == nil then
		self.discovered_mobs[mob_data.name] = { name = mob_data.name }
    
		local t = self.discovered_mobs[mob_data.name]
		t.bank = mob_data.bank
		t.build = mob_data.build
		t.anim_idle = mob_data.anim_idle
		t.health = mob_data.health
		t.damage = mob_data.damage
		t.walkspeed = mob_data.walkspeed
		t.runspeed = mob_data.runspeed
	end

	self:Save(true)
end

function BestiaryData:LearnMob(mob_data)

	
	self:Save(true)
end

function BestiaryData:GetDiscoveredMobs()
	local t = {  }
	for name, data in pairs(self.discovered_mobs) do
		table.insert(t, data)
	end

	return t
end

function BestiaryData:PrintDebugString()
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

return BestiaryData