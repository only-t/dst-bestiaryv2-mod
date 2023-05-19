env._G = GLOBAL._G
GLOBAL.setfenv(1, env)

--\/ INIT \/--

modimport("init/init_assets")
modimport("init/init_strings")
modimport("init/init_tuning")
modimport("init/init_prefabs")

--/\ INIT /\--

--\/ EXTERNAL CODE \/--

modimport("scripts/addstates")
modimport("scripts/bestiarypopup")
modimport("scripts/addbestiarytohud")
modimport("scripts/bestiaryrpcs")

--/\ EXTERNAL CODE /\--

_G.BESTIARYMODROOTFOLDER = MODROOT

_G.global("TheBestiary")
_G.TheBestiary = require("bestiarydata")()
_G.TheBestiary:ReadBestiaryData()

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
    inst.components.bestiaryuser:OnLoad()
end)

AddPrefabPostInit("forest", function(inst)
    if not inst.ismastersim then
        return
    end

    inst:AddComponent("suprisefishspawner")
end)