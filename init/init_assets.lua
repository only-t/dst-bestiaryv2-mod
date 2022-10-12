Assets = {
	Asset("ATLAS", "images/bestiarybutton.xml"),
	Asset("IMAGE", "images/bestiarybutton.tex"),

	Asset("ATLAS", "images/bestiary_page_bg.xml"),
	Asset("IMAGE", "images/bestiary_page_bg.tex"),
	
	Asset("ATLAS", "images/bestiary_pointer.xml"),
	Asset("IMAGE", "images/bestiary_pointer.tex"),

	Asset("ATLAS", "images/mob_cellrim.xml"),
	Asset("IMAGE", "images/mob_cellrim.tex"),

	Asset("ATLAS", "images/mob_cellbasicbg.xml"),
	Asset("IMAGE", "images/mob_cellbasicbg.tex"),
}

 -- Load in base game assets for mobs for usage in the compendium

if GLOBAL.TheNet:GetServerGameMode() == "" then
	local assets = {
		Asset("ATLAS", "minimap/minimap_data.xml"),
		Asset("IMAGE", "minimap/minimap_atlas.tex"),

		Asset("ANIM", "anim/stalker_basic.zip"),
		Asset("ANIM", "anim/stalker_action.zip"),
		Asset("ANIM", "anim/stalker_atrium.zip"),
		Asset("ANIM", "anim/stalker_shadow_build.zip"),
		Asset("ANIM", "anim/stalker_atrium_build.zip"),

		Asset("ANIM", "anim/rook.zip"),
		Asset("ANIM", "anim/rook_rhino.zip"),
		Asset("ANIM", "anim/rook_attacks.zip"),

		Asset("ANIM", "anim/archive_centipede.zip"),
		Asset("ANIM", "anim/archive_centipede_actions.zip"),
		Asset("ANIM", "anim/archive_centipede_build.zip"),

		Asset("ANIM", "anim/antlion_build.zip"),
		Asset("ANIM", "anim/antlion_basic.zip"),
		Asset("ANIM", "anim/antlion_action.zip"),

		Asset("ANIM", "anim/beefalo_basic.zip"),
		Asset("ANIM", "anim/beefalo_actions.zip"),
		Asset("ANIM", "anim/beefalo_baby_build.zip"),

		Asset("ANIM", "anim/tentacle_arm.zip"),
    	Asset("ANIM", "anim/tentacle_arm_build.zip"),

		Asset("ANIM", "anim/bat_basic.zip"),

		Asset("ANIM", "anim/bearger_build.zip"),
		Asset("ANIM", "anim/bearger_basic.zip"),
		Asset("ANIM", "anim/bearger_actions.zip"),
		Asset("ANIM", "anim/bearger_yule.zip"),

		Asset("ANIM", "anim/bee.zip"),
		Asset("ANIM", "anim/bee_build.zip"),
		Asset("ANIM", "anim/bee_angry_build.zip"),
		Asset("ANIM", "anim/bee_guard.zip"),
		Asset("ANIM", "anim/bee_guard_build.zip"),
		Asset("ANIM", "anim/bee_guard_puffy_build.zip"),

		Asset("ANIM", "anim/bee_queen_basic.zip"),
		Asset("ANIM", "anim/bee_queen_actions.zip"),
		Asset("ANIM", "anim/bee_queen_build.zip"),

		Asset("ANIM", "anim/beefalo_basic.zip"),
		Asset("ANIM", "anim/beefalo_actions.zip"),
		Asset("ANIM", "anim/beefalo_build.zip"),

		Asset("ANIM", "anim/tentacle_pillar.zip"),

		Asset("ANIM", "anim/treedrake.zip"),
    	Asset("ANIM", "anim/treedrake_build.zip"),

		Asset("ANIM", "anim/manrabbit_basic.zip"),
		Asset("ANIM", "anim/manrabbit_attacks.zip"),
		Asset("ANIM", "anim/manrabbit_build.zip"),
		Asset("ANIM", "anim/manrabbit_beard_build.zip"),
		Asset("ANIM", "anim/manrabbit_beard_basic.zip"),
		Asset("ANIM", "anim/manrabbit_beard_actions.zip"),

		Asset("ANIM", "anim/butterfly_basic.zip"),

		Asset("ANIM", "anim/buzzard_build.zip"),
    	Asset("ANIM", "anim/buzzard_basic.zip"),

		Asset("ANIM", "anim/canary.zip"),
		Asset("ANIM", "anim/canary_build.zip"),

		Asset("ANIM", "anim/carrat_basic.zip"),
		Asset("ANIM", "anim/carrat_build.zip"),

		Asset("ANIM", "anim/catcoon_build.zip"),
		Asset("ANIM", "anim/catcoon_basic.zip"),
		Asset("ANIM", "anim/catcoon_actions.zip"),
		
		Asset("ANIM", "anim/ds_spider_caves.zip"),

		Asset("ANIM", "anim/alterguardian_phase1.zip"),
		Asset("ANIM", "anim/alterguardian_phase2.zip"),
		Asset("ANIM", "anim/alterguardian_phase3.zip"),

		Asset("ANIM", "anim/chester.zip"),
		Asset("ANIM", "anim/chester_build.zip"),
		Asset("ANIM", "anim/chester_shadow_build.zip"),
		Asset("ANIM", "anim/chester_snow_build.zip"),

		Asset("ANIM", "anim/bishop.zip"),
		Asset("ANIM", "anim/bishop_build.zip"),
		Asset("ANIM", "anim/bishop_nightmare.zip"),

		Asset("ANIM", "anim/knight.zip"),
		Asset("ANIM", "anim/knight_build.zip"),
		Asset("ANIM", "anim/knight_nightmare.zip"),

		Asset("ANIM", "anim/rook.zip"),
		Asset("ANIM", "anim/rook_build.zip"),
		Asset("ANIM", "anim/rook_nightmare.zip"),

		Asset("ANIM", "anim/cookiecutter_build.zip"),
		Asset("ANIM", "anim/cookiecutter.zip"),
		Asset("ANIM", "anim/cookiecutter_water.zip"),

		Asset("ANIM", "anim/crab_king_basic.zip"),
		Asset("ANIM", "anim/crab_king_actions.zip"),
		Asset("ANIM", "anim/crab_king_build.zip"),

		Asset("ANIM", "anim/player_hermitcrab_idle.zip"),
		Asset("ANIM", "anim/player_hermitcrab_look.zip"),
		Asset("ANIM", "anim/hermitcrab_build.zip"),

		Asset("ANIM", "anim/shadow_insanity1_basic.zip"),
		
		Asset("ANIM", "anim/stalker_cave_build.zip"),

		Asset("ANIM", "anim/spider_white.zip"),

		Asset("ANIM", "anim/deerclops_basic.zip"),
		Asset("ANIM", "anim/deerclops_actions.zip"),
		Asset("ANIM", "anim/deerclops_build.zip"),
		Asset("ANIM", "anim/deerclops_yule.zip"),

		Asset("ANIM", "anim/worm.zip"),

		Asset("ANIM", "anim/dragonfly_basic.zip"),
    	Asset("ANIM", "anim/dragonfly_actions.zip"),
		Asset("ANIM", "anim/dragonfly_build.zip"),
		Asset("ANIM", "anim/dragonfly_yule_build.zip"),

		Asset("ANIM", "anim/dustmoth.zip"),

		Asset("ANIM", "anim/spat_basic.zip"),
		Asset("ANIM", "anim/spat_actions.zip"),
		Asset("ANIM", "anim/spat_build.zip"),
		Asset("ANIM", "anim/spat_phlegm.zip"),

		Asset("ANIM", "anim/lavae.zip"),

		Asset("ANIM", "anim/eyeofterror_action.zip"),
		Asset("ANIM", "anim/eyeofterror_basic.zip"),

		Asset("ANIM", "anim/eyeplant.zip"),

		Asset("ANIM", "anim/fireflies.zip"),

		Asset("ANIM", "anim/fruitfly.zip"),
		Asset("ANIM", "anim/fruitfly_good.zip"),

		Asset("ANIM", "anim/frog.zip"),

		Asset("ANIM", "anim/fruitfly_evil_minion.zip"),

		Asset("ANIM", "anim/brightmare_gestalt_head.zip"),

		Asset("ANIM", "anim/player_ghost_withhat.zip"),
		Asset("ANIM", "anim/ghost_build.zip"),

		Asset("ANIM", "anim/glommer.zip"),

		Asset("ANIM", "anim/gnarwail.zip"),
		Asset("ANIM", "anim/gnarwail_build.zip"),

		Asset("ANIM", "anim/perd_basic.zip"),
		Asset("ANIM", "anim/perd.zip"),

		Asset("ANIM", "anim/grass_gator.zip"),
		Asset("ANIM", "anim/grass_gator_basic.zip"),
		Asset("ANIM", "anim/grass_gator_actions.zip"),

		Asset("ANIM", "anim/grassgecko.zip"),

		Asset("ANIM", "anim/brightmare_gestalt_evolved.zip"),

		Asset("ANIM", "anim/ds_pig_basic.zip"),
		Asset("ANIM", "anim/ds_pig_attacks.zip"),
		Asset("ANIM", "anim/pig_guard_build.zip"),

		Asset("ANIM", "anim/hound_basic.zip"),
		Asset("ANIM", "anim/hound_basic_water.zip"),
		Asset("ANIM", "anim/hound.zip"),
		Asset("ANIM", "anim/hound_ocean.zip"),
		Asset("ANIM", "anim/hound_red.zip"),
		Asset("ANIM", "anim/hound_red_ocean.zip"),
		Asset("ANIM", "anim/hound_ice.zip"),
		Asset("ANIM", "anim/hound_ice_ocean.zip"),
		Asset("ANIM", "anim/hound_mutated.zip"),

		Asset("ANIM", "anim/hutch.zip"),
		Asset("ANIM", "anim/hutch_build.zip"),
		Asset("ANIM", "anim/hutch_musicbox_build.zip"),
		Asset("ANIM", "anim/hutch_pufferfish_build.zip"),

		Asset("ANIM", "anim/merm_king.zip"),

		Asset("ANIM", "anim/klaus_basic.zip"),
		Asset("ANIM", "anim/klaus_actions.zip"),
		Asset("ANIM", "anim/klaus_build.zip"),

		Asset("ANIM", "anim/koalefant_basic.zip"),
		Asset("ANIM", "anim/koalefant_actions.zip"),
		Asset("ANIM", "anim/koalefant_summer_build.zip"),
		Asset("ANIM", "anim/koalefant_winter_build.zip"),

		Asset("ANIM", "anim/krampus_basic.zip"),
		Asset("ANIM", "anim/krampus_build.zip"),

		Asset("ANIM", "anim/fruitfly_evil.zip"),

		Asset("ANIM", "anim/merm_build.zip"),
		Asset("ANIM", "anim/merm_guard_build.zip"),
		Asset("ANIM", "anim/merm_guard_small_build.zip"),
		Asset("ANIM", "anim/merm_actions.zip"),

		Asset("ANIM", "anim/lobster.zip"),
		Asset("ANIM", "anim/lobster_moonglass.zip"),

		Asset("ANIM", "anim/eyeplant_trap.zip"),
		Asset("ANIM", "anim/meat_rack_food.zip"),

		Asset("ANIM", "anim/walrus_actions.zip"),
		Asset("ANIM", "anim/walrus_attacks.zip"),
		Asset("ANIM", "anim/walrus_basic.zip"),
		Asset("ANIM", "anim/walrus_build.zip"),

		Asset("ANIM", "anim/malbatross_basic.zip"),
		Asset("ANIM", "anim/malbatross_actions.zip"),
		Asset("ANIM", "anim/malbatross_build.zip"),

		Asset("ANIM", "anim/mandrake.zip"),
		
		Asset("ANIM", "anim/mutated_robin.zip"),
		Asset("ANIM", "anim/bird_mutant_spitter_build.zip"),

	    Asset("ANIM", "anim/mole_build.zip"),
    	Asset("ANIM", "anim/mole_basic.zip"),

		Asset("ANIM", "anim/butterfly_basic.zip"),
		Asset("ANIM", "anim/butterfly_moon.zip"),

		Asset("ANIM", "anim/mutated_crow.zip"),
		Asset("ANIM", "anim/bird_mutant_build.zip"),

		Asset("ANIM", "anim/penguin.zip"),
		Asset("ANIM", "anim/penguin_mutated_build.zip"),

		Asset("ANIM", "anim/goosemoose_build.zip"),
		Asset("ANIM", "anim/goosemoose_basic.zip"),
		Asset("ANIM", "anim/goosemoose_actions.zip"),
		Asset("ANIM", "anim/goosemoose_yule_build.zip"),

		Asset("ANIM", "anim/mossling_build.zip"),
		Asset("ANIM", "anim/mossling_basic.zip"),
		Asset("ANIM", "anim/mossling_actions.zip"),
		Asset("ANIM", "anim/mossling_angry_build.zip"),
		Asset("ANIM", "anim/mossling_yule_build.zip"),
		Asset("ANIM", "anim/mossling_yule_angry_build.zip"),

		Asset("ANIM", "anim/mosquito.zip"),

		Asset("ANIM", "anim/grotto_mushgnome.zip"),

		Asset("ANIM", "anim/molebat.zip"),

		Asset("ANIM", "anim/deer_build.zip"),
		Asset("ANIM", "anim/deer_basic.zip"),
		Asset("ANIM", "anim/deer_action.zip"),

		Asset("ANIM", "anim/ds_spider_cannon.zip"),
		Asset("ANIM", "anim/spider_wolf_build.zip"),

		Asset("ANIM", "anim/stalker_forest.zip"),
		Asset("ANIM", "anim/stalker_forest_build.zip"),

		Asset("ANIM", "anim/penguin_build.zip"),

		Asset("ANIM", "anim/pig_king.zip"),

		Asset("ANIM", "anim/pig_build.zip"),

		Asset("ANIM", "anim/ghost_kid.zip"),
		Asset("ANIM", "anim/ghost_build.zip"),

		Asset("ANIM", "anim/tree_leaf_monster.zip"),
		Asset("ANIM", "anim/tree_leaf_trunk_build.zip"),
		Asset("ANIM", "anim/tree_leaf_poison_build.zip"),

		Asset("ANIM", "anim/puffin.zip"),
        Asset("ANIM", "anim/puffin_build.zip"),

		Asset("ANIM", "anim/ds_rabbit_basic.zip"),
		Asset("ANIM", "anim/rabbit_build.zip"),
		Asset("ANIM", "anim/beard_monster.zip"),
		Asset("ANIM", "anim/rabbit_winter_build.zip"),

		Asset("ANIM", "anim/eyeofterror_twin1_build.zip"),

		Asset("ANIM", "anim/rocky.zip"),

		Asset("ANIM", "anim/shark_basic.zip"),
		Asset("ANIM", "anim/shark_build.zip"),

		Asset("ANIM", "anim/fruit_dragon.zip"),
		Asset("ANIM", "anim/fruit_dragon_build.zip"),
		Asset("ANIM", "anim/fruit_dragon_ripe_build.zip"),

		Asset("ANIM", "anim/spider_water.zip"),
		Asset("ANIM", "anim/spider_water_water.zip"),

		Asset("ANIM", "anim/barnacle_plant.zip"),
		Asset("ANIM", "anim/barnacle_plant_colour_swaps.zip"),

		Asset("ANIM", "anim/shadow_bishop.zip"),
        Asset("ANIM", "anim/shadow_bishop_upg_build.zip"),

		Asset("ANIM", "anim/shadow_knight.zip"),
        Asset("ANIM", "anim/shadow_knight_upg_build.zip"),

		Asset("ANIM", "anim/shadow_rook.zip"),
        Asset("ANIM", "anim/shadow_rook_upg_build.zip"),

		Asset("ANIM", "anim/ds_spider_basic.zip"),
		Asset("ANIM", "anim/ds_spider_moon.zip"),

		Asset("ANIM", "anim/squid.zip"),
		Asset("ANIM", "anim/squid_build.zip"),

		Asset("ANIM", "anim/slurper_basic.zip"),

		Asset("ANIM", "anim/slurtle.zip"),
		Asset("ANIM", "anim/slurtle_snaily.zip"),

		Asset("ANIM", "anim/smallbird_basic.zip"),

		Asset("ANIM", "anim/ds_tallbird_basic.zip"),
		Asset("ANIM", "anim/tallbird_teen_basic.zip"),
		Asset("ANIM", "anim/tallbird_teen_build.zip"),

		Asset("ANIM", "anim/eyeofterror_twin2_build.zip"),

		Asset("ANIM", "anim/spider_build.zip"),

		Asset("ANIM", "anim/spider_queen_build.zip"),
		Asset("ANIM", "anim/spider_queen.zip"),
		Asset("ANIM", "anim/spider_queen_2.zip"),

		Asset("ANIM", "anim/ds_spider_warrior.zip"),
		Asset("ANIM", "anim/spider_warrior_build.zip"),

		Asset("ANIM", "anim/ds_spider2_caves.zip"),
		Asset("ANIM", "anim/ds_spider2_caves_boat_jump.zip"),

		Asset("ANIM", "anim/kiki_basic.zip"),
		Asset("ANIM", "anim/kiki_nightmare_skin.zip"),

		Asset("ANIM", "anim/eyeofterror_mini_actions.zip"),
		Asset("ANIM", "anim/eyeofterror_mini_basic.zip"),
		Asset("ANIM", "anim/eyeofterror_mini_mob_build.zip"),

		Asset("ANIM", "anim/tentacle.zip"),

		Asset("ANIM", "anim/shadow_insanity2_basic.zip"),

		Asset("ANIM", "anim/shadow_oceanhorror.zip"),

		Asset("ANIM", "anim/toadstool_basic.zip"),
		Asset("ANIM", "anim/toadstool_actions.zip"),
		Asset("ANIM", "anim/toadstool_build.zip"),
		Asset("ANIM", "anim/toadstool_basic.zip"),
		Asset("ANIM", "anim/toadstool_actions.zip"),
		Asset("ANIM", "anim/toadstool_dark_build.zip"),

		Asset("ANIM", "anim/leif_idles.zip"),
		Asset("ANIM", "anim/leif_build.zip"),
		Asset("ANIM", "anim/leif_lumpy_build.zip"),
		Asset("ANIM", "anim/leif_attacks.zip"),

		Asset("ANIM", "anim/warg_actions.zip"),
		Asset("ANIM", "anim/warg_build.zip"),

		Asset("ANIM", "anim/lightning_goat_build.zip"),
		Asset("ANIM", "anim/lightning_goat_shocked_build.zip"),
		Asset("ANIM", "anim/lightning_goat_basic.zip"),
		Asset("ANIM", "anim/lightning_goat_actions.zip"),

		Asset("ANIM", "anim/shadow_wavey_jones.zip"),

		Asset("ANIM", "anim/walrus_baby_build.zip"),

		Asset("ANIM", "anim/werepig_build.zip"),
		Asset("ANIM", "anim/werepig_basic.zip"),
		Asset("ANIM", "anim/werepig_actions.zip"),

		Asset("ANIM", "anim/lobster.zip"),
		Asset("ANIM", "anim/lobster_sheller.zip"),

		Asset("ANIM", "anim/stalker_shadow_build.zip"),
        Asset("ANIM", "anim/stalker_minion.zip"),
        Asset("ANIM", "anim/stalker_minion_2.zip"),
	}

	for i, asset in ipairs(assets) do
		table.insert(Assets, asset)
	end
end