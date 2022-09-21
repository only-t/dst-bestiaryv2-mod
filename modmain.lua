local require = GLOBAL.require

GLOBAL.CHEATS_ENABLED = true
require("debugkeys")

GLOBAL.DISCOVERABLE_MOBS_CONFIG = GetModConfigData("Discoverable Mobs")

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