----						  [ Coder ]						  ----
---- 							 -т-						  ----
----  https://forums.kleientertainment.com/profile/365042-t/  ----
----  					  Discord: -т-#1234				  	  ----

local require = GLOBAL.require

GLOBAL.CHEATS_ENABLED = true
require("debugkeys")

GLOBAL.DISCOVERABLE_MOBS_CONFIG = GetModConfigData("Discoverable Mobs")
GLOBAL.BESTIARY_ITEM_CONFIG = GetModConfigData("Bestiary as an Item")

--\/ INIT \/--

modimport("init/init_assets")
modimport("init/init_prefabs")
modimport("init/init_desc")

--/\ INIT /\--

--\/ EXTERNAL CODE \/--

modimport("scripts/addbestiaryaction")
modimport("scripts/addstates")
modimport("scripts/bestiarypopup")
modimport("scripts/bestiaryhud")

--/\ EXTERNAL CODE /\--