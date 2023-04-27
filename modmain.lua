env._G = GLOBAL._G
GLOBAL.setfenv(1, env)

--\/ INIT \/--

modimport("init/init_assets")
modimport("init/init_strings")
modimport("init/init_tuning")

--/\ INIT /\--

--\/ EXTERNAL CODE \/--

modimport("scripts/addstates")
modimport("scripts/bestiarypopup")
modimport("scripts/addbestiarytohud")
modimport("scripts/bestiaryrpcs")

--/\ EXTERNAL CODE /\--

require("debugkeys")

_G.global("TheBestiary")
_G.TheBestiary = require("bestiarydata")()
_G.TheBestiary:Load()

local function OnPlayerActivated(inst)
	if not _G.TheNet:IsDedicated() and inst == _G.ThePlayer then
		inst.bestiary = _G.TheBestiary
	end
end

AddPlayerPostInit(function(inst)
	inst:ListenForEvent("playeractivated", OnPlayerActivated)

    if not _G.TheWorld.ismastersim then
        return
    end

    inst:AddComponent("bestiaryuser")
end)