--CALORIES_TINY = 		9.375	berries
--CALORIES_SMALL = 		12.5	carrots
--CALORIES_MEDSMALL = 	18.75	raw meat
--CALORIES_MED = 		25		cooked meat
--CALORIES_LARGE = 		37.5	crockpot foods
--CALORIES_HUGE = 		75		crockpot foods
--CALORIES_SUPERHUGE = 	150		meaty stew

--HEALING_TINY = 		1
--HEALING_SMALL = 		3
--HEALING_MEDSMALL = 	8
--HEALING_MED = 		20
--HEALING_MEDLARGE = 	30
--HEALING_LARGE = 		40
--HEALING_HUGE = 		60
--HEALING_SUPERHUGE = 	100

--SANITY_SUPERTINY = 	1
--SANITY_TINY = 		5
--SANITY_SMALL = 		10
--SANITY_MED = 			15
--SANITY_MEDLARGE = 	20
--SANITY_LARGE = 		33
--SANITY_HUGE = 		50

--DAPPERNESS_TINY = 100/(day_time*15),		= 0.02
--DAPPERNESS_SMALL = 100/(day_time*10),		= 0.03
--DAPPERNESS_MED = 100/(day_time*6),		= 0.05
--DAPPERNESS_MED_LARGE = 100/(day_time*4.5),= 0.07
--DAPPERNESS_LARGE = 100/(day_time*3),		= 0.11
--DAPPERNESS_HUGE = 100/(day_time),			= 0.33
--DAPPERNESS_SUPERHUGE = 100/(day_time*0.5),= 0.66

    --- *** ---

local seg_time = 30
local total_day_time = seg_time*16 -- 480

local day_segs = 10
local dusk_segs = 4
local night_segs = 2

local day_time = seg_time * day_segs -- 300
local dusk_time = seg_time * dusk_segs -- 120
local night_time = seg_time * night_segs -- 60

local multiplayer_attack_modifier = 1
local multiplayer_goldentool_modifier = 1
local multiplayer_armor_durability_modifier = 0.7

local wilson_attack = 34 * multiplayer_attack_modifier
local wilson_health = 150
local wilson_hunger = 150
local wilson_sanity = 200
local calories_per_day = 75

local wilson_attack_period = 0.4

	--- *** ---

TUNING.DISCOVER_MOB_RANGE = 7

TUNING.SUPRISE_FISH_DISCOVER_RANGE = 20
TUNING.SUPRISE_FISH_SPAWN_CHANCE = 0.05
TUNING.SUPRISE_FISH_WORLD_AGE_DELAY = 10
TUNING.SUPRISE_FISH_SPAWN_DELAY = {
    min = 4*seg_time,
    max = total_day_time/2,
}