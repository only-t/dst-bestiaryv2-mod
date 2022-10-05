local BESTIARYINFO = require "additionalinfo"

local omni_diet = {
    "meat",
    "veggies",
    "seeds",
    "generic",
    "goodies",
}

local data = {
    {
        name = "Deerclops",
        prefab = "deerclops",
        bank = "deerclops",
        build = "deerclops_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = TUNING.DEERCLOPS_HEALTH,
            damage = 75,
            speed = 3,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 8, chance = 1 },
                { prefab = "deerclops_eyeball", amount = 1, chance = 1 },
                { prefab = "chesspiece_deerclops_sketch", amount = 1, chance = 1, name_override = "sketch" },
            }
        },

        info = BESTIARYINFO.DEERCLOPS
    },
    {
        name = "Spider",
        prefab = "spider",
        bank = "spider",
        build = "spider_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 100,
            damage = 20,
            speed = 5,
            diet = { "meat", "horrible" },
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "monstermeat", amount = 1, chance = 0.5 },
                    { prefab = "silk", amount = 1, chance = 0.25 },
                    { prefab = "spidergland", amount = 1, chance = 0.25 },
                }
            },

            info = BESTIARYINFO.SPIDER
        }
    },
    {
        name = "Klaus",
        prefab = "klaus",
        bank = "klaus",
        build = "klaus_build",
        anim_idle = "idle_loop",
        anim_action = "attack_doubleclaw",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 15000,
            damage = 37.5,
            speed = 2.75,
            diet = "none",

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 1 },
                { prefab = "charcoal", amount = 1, chance = 1 },
                { prefab = "klaussackkey", amount = 1, chance = 1 },
                { prefab = "chesspiece_klaus_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.KLAUS
        },

        form_override_fn = function(animstate)
            animstate:ClearAllOverrideSymbols()
        end
    },
    {
        name = "Tentacle",
        prefab = "tentacle",
        bank = "tentacle",
        build = "tentacle",
        anim_idle = "atk_idle",
        anim_action = "atk_loop",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },

        stats = {
            health = 500,
            damage = 34,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "monstermeat", amount = 2, chance = 1 },
                { prefab = "tentaclespike", amount = 1, chance = 0.5 },
                { prefab = "tentaclespots", amount = 1, chance = 0.2 },
            },

            info = BESTIARYINFO.TENTACLE
        }
    },
    {
        name = "Rabbit",
        prefab = "rabbit",
        bank = "rabbit",
        build = "rabbit_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 1,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_savanna.xml", grid_image = "monstergrid_bg_savanna.tex", atlas = "images/monster_bg_savanna.xml", image = "monster_bg_savanna.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 5,
            diet = { "veggies" },

            drops = {
                { prefab = "smallmeat", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.RABBIT
        }
    },
    {
        name = "Beefalo",
        prefab = "beefalo",
        bank = "beefalo",
        build = "beefalo_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_savanna.xml", grid_image = "monstergrid_bg_savanna.tex", atlas = "images/monster_bg_savanna.xml", image = "monster_bg_savanna.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        stats = {
            health = 1000,
            damage = 34,
            speed = 1,
            diet = { "veggies", "roughage" },

            drops = {
                { prefab = "meat", amount = 4, chance = 1 },
                { prefab = "beefalowool", amount = 3, chance = 1 },
                { prefab = "horn", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.BEEFALO
        }
    },
    {
        name = "Bearger",
        prefab = "bearger",
        bank = "bearger",
        build = "bearger_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.15,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 6000,
            damage = 100,
            speed = 3,
            diet = { "meat", "veggies", "berries", "generic" },

            drops = {
                { prefab = "meat", amount = 8, chance = 1 },
                { prefab = "bearger_fur", amount = 1, chance = 1 },
                { prefab = "chesspiece_bearger_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.BEARGER
        }
    },
    {
        name = "Crab King",
        prefab = "crabking",
        bank = "king_crab",
        build = "crab_king_build",
        anim_idle = "idle",
        anim_action = "hit_light",
        scale = 0.1, -- That's a big boy
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },

        stats = {
            health = "20000-95000", -- Oh, dear...
            damage = 0,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 7, chance = 1 },
                { prefab = "chesspiece_crabking_sketch", amount = 1, chance = 1 },
                { prefab = "trident_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "singingshell_octave5", amount = 4, chance = 1, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.5, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.25, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave4", amount = 3, chance = 1, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.5, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.25, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave3", amount = 2, chance = 1, name_override = "singingshell_octave3_1" },
                { prefab = "singingshell_octave3", amount = 1, chance = 0.5, name_override = "singingshell_octave3_1" },
                { prefab = "barnacle", amount = 3, chance = 1 },
                { prefab = "barnacle", amount = 4, chance = 0.25 },
            },

            info = BESTIARYINFO.CRABKING
        }
    },
    {
        name = "Wilson",
        prefab = "wilson",
        bank = "wilson",
        build = "wilson",
        anim_idle = "idle",
        anim_action = "none",
        scale = 1,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        
        stats = {
            health = "150",
            damage = 10,
            speed = 5,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 7, chance = 1 },
                { prefab = "chesspiece_crabking_sketch", amount = 1, chance = 1 },
                { prefab = "trident_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "singingshell_octave5", amount = 4, chance = 1, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.5, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.25, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave4", amount = 3, chance = 1, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.5, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.25, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave3", amount = 2, chance = 1, name_override = "singingshell_octave3_1" },
                { prefab = "singingshell_octave3", amount = 1, chance = 0.5, name_override = "singingshell_octave3_1" },
                { prefab = "barnacle", amount = 3, chance = 1 },
                { prefab = "barnacle", amount = 4, chance = 0.25 },
            },

            info = BESTIARYINFO.CRABKING
        }
    },
    {
        name = "Ancient Guardian",
        prefab = "minotaur",
        bank = "rook",
        build = "rook_rhino",
        anim_idle = "idle",
        anim_action = "bite",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 10000,
            damage = 100,
            speed = 17,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 8, chance = 1 },
                { prefab = "minotaurhorn", amount = 1, chance = 1 },
                { prefab = "chesspiece_minotaur_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.MINOTAUR
        }
    },
    {
        name = "Batilisk",
        prefab = "bat",
        bank = "bat",
        build = "bat_basic",
        anim_idle = "fly_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 20,
            speed = 6,
            diet = { "meat" },

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
                { prefab = "batwing", amount = 1, chance = 0.25 },
                { prefab = "monstermeat", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.BAT
        }
    },
    {
        name = "Batilisk",
        prefab = "bat",
        bank = "bat",
        build = "bat_basic",
        anim_idle = "fly_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 20,
            speed = 6,
            diet = { "meat" },

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
                { prefab = "batwing", amount = 1, chance = 0.25 },
                { prefab = "monstermeat", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.BAT
        }
    },
    {
        name = "Batilisk",
        prefab = "bat",
        bank = "bat",
        build = "bat_basic",
        anim_idle = "fly_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 20,
            speed = 6,
            diet = { "meat" },

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
                { prefab = "batwing", amount = 1, chance = 0.25 },
                { prefab = "monstermeat", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.BAT
        }
    },
    {
        name = "Mandrake",
        prefab = "mandrake_active",
        bank = "mandrake",
        build = "mandrake",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 20,
            damage = 0,
            speed = 6,
            diet = "none",

            drops = {
                { prefab = "mandrake", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.MANDRAKE
        }
    },
    {
        name = "Merm",
        prefab = "merm",
        bank = "pigman",
        build = "merm_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 500,
            damage = 30,
            speed = 8,
            diet = { "veggies", "seeds", "generic", "goodies" },

            drops = {
                { prefab = "fish", amount = 1, chance = 1 },
                { prefab = "froglegs", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.MERM
        }
    },
    {
        name = "Lure Plant",
        prefab = "lureplant",
        bank = "eyeplant_trap",
        build = "eyeplant_trap",
        anim_idle = "idle_hidden",
        anim_action = "hit",
        scale = 0.4,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 300,
            damage = 0,
            speed = 0,
            diet = { "meat" },

            drops = {
                { prefab = "plantmeat", amount = 1, chance = 1 },
                { prefab = "lureplantbulb", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.LUREPLANT
        }
    },
    {
        name = "Eyeplant",
        prefab = "eyeplant",
        bank = "eyeplant",
        build = "eyeplant",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 30,
            damage = 20,
            speed = 0,
            diet = { "meat" },
            drops = "none",
            info = BESTIARYINFO.EYEPLANT
        }
    },
    {
        name = "Mosquito",
        prefab = "mosquito",
        bank = "mosquito",
        build = "mosquito",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },

        stats = {
            health = 100,
            damage = 3,
            speed = 12,
            diet = "none",

            drops = {
                { prefab = "mosquitosack", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.MOSQUITO
        }
    },
    {
        name = "Pengull",
        prefab = "penguin",
        bank = "penguin",
        build = "penguin_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 150,
            damage = 33,
            speed = 6,
            diet = { unpack(omni_diet), "horrible" },

            drops = {
                { prefab = "feather_crow", amount = 1, chance = 0.2 },
                { prefab = "smallmeat", amount = 1, chance = 0.1 },
                { prefab = "drumstick", amount = 1, chance = 0.1 }
            },

            info = BESTIARYINFO.PENGUIN
        }
    },
    {
        name = "Pig Man",
        prefab = "pigman",
        bank = "pigman",
        build = "pig_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 250,
            damage = 33,
            speed = 5,
            diet = { unpack(omni_diet), "horrible", "raw" },

            drops = {
                { prefab = "meat", amount = 1, chance = 0.75 },
                { prefab = "pigskin", amount = 1, chance = 0.25 },
            },

            info = BESTIARYINFO.PIG
        }
    },
    {
        name = "Guard Pig",
        prefab = "pigguard",
        bank = "pigman",
        build = "pig_guard_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 600,
            damage = 33,
            speed = 5,
            diet = { unpack(omni_diet), "horrible", "raw" },

            drops = {
                { prefab = "meat", amount = 1, chance = 0.75 },
                { prefab = "pigskin", amount = 1, chance = 0.25 },
            },

            info = BESTIARYINFO.PIG_GUARD
        }
    },
    {
        name = "Werepig",
        prefab = "werepig",
        bank = "pigman",
        build = "werepig_build",
        anim_idle = "were_idle_loop",
        anim_action = "howl",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 525,
            damage = 40,
            speed = 7,
            diet = { unpack(omni_diet), "horrible", "raw" },

            drops = {
                { prefab = "meat", amount = 2, chance = 1 },
                { prefab = "pigskin", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.WEREPIG
        }
    },
    {
        name = "Fireflies",
        prefab = "fireflies",
        bank = "fireflies",
        build = "fireflies",
        anim_idle = "swarm_loop",
        anim_action = nil,
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },

        stats = {
            health = 0,
            damage = 0,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "fireflies", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.FIREFLIES
        }
    },
    {
        name = "Rock Lobster",
        prefab = "rocky",
        bank = "rocky",
        build = "rocky",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = "2250-3600",
            damage = "56.25-90",
            speed = 2,
            diet = { "elemental" },

            drops = {
                { prefab = "rocks", amount = 2, chance = 1 },
                { prefab = "meat", amount = 1, chance = 1 },
                { prefab = "flint", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.ROCKY
        }
    },
    {
        name = "Crawling Horror",
        prefab = "crawlinghorror",
        bank = "shadowcreature1",
        build = "shadow_insanity1_basic",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 300,
            damage = 20,
            speed = 3,
            diet = "none",

            drops = {
                { prefab = "nightmarefuel", amount = 1, chance = 1 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.CRAWLINGHORROR
        }
    },
    {
        name = "Terrorbeak",
        prefab = "terrorbeak",
        bank = "shadowcreature2",
        build = "shadow_insanity2_basic",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 400,
            damage = 50,
            speed = 7,
            diet = "none",

            drops = {
                { prefab = "nightmarefuel", amount = 1, chance = 1 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.TERRORBEAK
        }
    },
    {
        name = "Slurper",
        prefab = "slurper",
        bank = "slurper",
        build = "slurper_basic",
        anim_idle = "idle_loop",
        anim_action = "taunt",
        scale = 0.6,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lightbulb.xml", grid_image = "monstergrid_bg_lightbulb.tex", atlas = "images/monster_bg_lightbulb.xml", image = "monster_bg_lightbulb.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 200,
            damage = 30,
            speed = 9,
            diet = "none",

            drops = {
                { prefab = "lightbulb", amount = 2, chance = 1 },
                { prefab = "slurper_pelt", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.SLURPER
        }
    },{
        name = "Deerclops",
        prefab = "deerclops",
        bank = "deerclops",
        build = "deerclops_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = TUNING.DEERCLOPS_HEALTH,
            damage = 75,
            speed = 3,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 8, chance = 1 },
                { prefab = "deerclops_eyeball", amount = 1, chance = 1 },
                { prefab = "chesspiece_deerclops_sketch", amount = 1, chance = 1, name_override = "sketch" },
            }
        },

        info = BESTIARYINFO.DEERCLOPS
    },
    {
        name = "Spider",
        prefab = "spider",
        bank = "spider",
        build = "spider_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 100,
            damage = 20,
            speed = 5,
            diet = { "meat", "horrible" },
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "monstermeat", amount = 1, chance = 0.5 },
                    { prefab = "silk", amount = 1, chance = 0.25 },
                    { prefab = "spidergland", amount = 1, chance = 0.25 },
                }
            },

            info = BESTIARYINFO.SPIDER
        }
    },
    {
        name = "Klaus",
        prefab = "klaus",
        bank = "klaus",
        build = "klaus_build",
        anim_idle = "idle_loop",
        anim_action = "attack_doubleclaw",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 15000,
            damage = 37.5,
            speed = 2.75,
            diet = "none",

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 1 },
                { prefab = "charcoal", amount = 1, chance = 1 },
                { prefab = "klaussackkey", amount = 1, chance = 1 },
                { prefab = "chesspiece_klaus_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.KLAUS
        },

        form_override_fn = function(animstate)
            animstate:ClearAllOverrideSymbols()
        end
    },
    {
        name = "Tentacle",
        prefab = "tentacle",
        bank = "tentacle",
        build = "tentacle",
        anim_idle = "atk_idle",
        anim_action = "atk_loop",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },

        stats = {
            health = 500,
            damage = 34,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "monstermeat", amount = 2, chance = 1 },
                { prefab = "tentaclespike", amount = 1, chance = 0.5 },
                { prefab = "tentaclespots", amount = 1, chance = 0.2 },
            },

            info = BESTIARYINFO.TENTACLE
        }
    },
    {
        name = "Rabbit",
        prefab = "rabbit",
        bank = "rabbit",
        build = "rabbit_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 1,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_savanna.xml", grid_image = "monstergrid_bg_savanna.tex", atlas = "images/monster_bg_savanna.xml", image = "monster_bg_savanna.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 5,
            diet = { "veggies" },

            drops = {
                { prefab = "smallmeat", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.RABBIT
        }
    },
    {
        name = "Beefalo",
        prefab = "beefalo",
        bank = "beefalo",
        build = "beefalo_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_savanna.xml", grid_image = "monstergrid_bg_savanna.tex", atlas = "images/monster_bg_savanna.xml", image = "monster_bg_savanna.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        stats = {
            health = 1000,
            damage = 34,
            speed = 1,
            diet = { "veggies", "roughage" },

            drops = {
                { prefab = "meat", amount = 4, chance = 1 },
                { prefab = "beefalowool", amount = 3, chance = 1 },
                { prefab = "horn", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.BEEFALO
        }
    },
    {
        name = "Bearger",
        prefab = "bearger",
        bank = "bearger",
        build = "bearger_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.15,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 6000,
            damage = 100,
            speed = 3,
            diet = { "meat", "veggies", "berries", "generic" },

            drops = {
                { prefab = "meat", amount = 8, chance = 1 },
                { prefab = "bearger_fur", amount = 1, chance = 1 },
                { prefab = "chesspiece_bearger_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.BEARGER
        }
    },
    {
        name = "Crab King",
        prefab = "crabking",
        bank = "king_crab",
        build = "crab_king_build",
        anim_idle = "idle",
        anim_action = "hit_light",
        scale = 0.1, -- That's a big boy
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },

        stats = {
            health = "20000-95000", -- Oh, dear...
            damage = 0,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 7, chance = 1 },
                { prefab = "chesspiece_crabking_sketch", amount = 1, chance = 1 },
                { prefab = "trident_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "singingshell_octave5", amount = 4, chance = 1, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.5, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.25, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave4", amount = 3, chance = 1, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.5, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.25, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave3", amount = 2, chance = 1, name_override = "singingshell_octave3_1" },
                { prefab = "singingshell_octave3", amount = 1, chance = 0.5, name_override = "singingshell_octave3_1" },
                { prefab = "barnacle", amount = 3, chance = 1 },
                { prefab = "barnacle", amount = 4, chance = 0.25 },
            },

            info = BESTIARYINFO.CRABKING
        }
    },
    {
        name = "Wilson",
        prefab = "wilson",
        bank = "wilson",
        build = "wilson",
        anim_idle = "idle",
        anim_action = "none",
        scale = 1,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        
        stats = {
            health = "150",
            damage = 10,
            speed = 5,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 7, chance = 1 },
                { prefab = "chesspiece_crabking_sketch", amount = 1, chance = 1 },
                { prefab = "trident_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "singingshell_octave5", amount = 4, chance = 1, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.5, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave5", amount = 1, chance = 0.25, name_override = "singingshell_octave5_1" },
                { prefab = "singingshell_octave4", amount = 3, chance = 1, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.5, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave4", amount = 1, chance = 0.25, name_override = "singingshell_octave4_1" },
                { prefab = "singingshell_octave3", amount = 2, chance = 1, name_override = "singingshell_octave3_1" },
                { prefab = "singingshell_octave3", amount = 1, chance = 0.5, name_override = "singingshell_octave3_1" },
                { prefab = "barnacle", amount = 3, chance = 1 },
                { prefab = "barnacle", amount = 4, chance = 0.25 },
            },

            info = BESTIARYINFO.CRABKING
        }
    },
    {
        name = "Ancient Guardian",
        prefab = "minotaur",
        bank = "rook",
        build = "rook_rhino",
        anim_idle = "idle",
        anim_action = "bite",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 10000,
            damage = 100,
            speed = 17,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 8, chance = 1 },
                { prefab = "minotaurhorn", amount = 1, chance = 1 },
                { prefab = "chesspiece_minotaur_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.MINOTAUR
        }
    },
    {
        name = "Batilisk",
        prefab = "bat",
        bank = "bat",
        build = "bat_basic",
        anim_idle = "fly_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 20,
            speed = 6,
            diet = { "meat" },

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
                { prefab = "batwing", amount = 1, chance = 0.25 },
                { prefab = "monstermeat", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.BAT
        }
    },
    {
        name = "Batilisk",
        prefab = "bat",
        bank = "bat",
        build = "bat_basic",
        anim_idle = "fly_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 20,
            speed = 6,
            diet = { "meat" },

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
                { prefab = "batwing", amount = 1, chance = 0.25 },
                { prefab = "monstermeat", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.BAT
        }
    },
    {
        name = "Batilisk",
        prefab = "bat",
        bank = "bat",
        build = "bat_basic",
        anim_idle = "fly_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 20,
            speed = 6,
            diet = { "meat" },

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
                { prefab = "batwing", amount = 1, chance = 0.25 },
                { prefab = "monstermeat", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.BAT
        }
    },
    {
        name = "Mandrake",
        prefab = "mandrake_active",
        bank = "mandrake",
        build = "mandrake",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 20,
            damage = 0,
            speed = 6,
            diet = "none",

            drops = {
                { prefab = "mandrake", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.MANDRAKE
        }
    },
    {
        name = "Merm",
        prefab = "merm",
        bank = "pigman",
        build = "merm_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 500,
            damage = 30,
            speed = 8,
            diet = { "veggies", "seeds", "generic", "goodies" },

            drops = {
                { prefab = "fish", amount = 1, chance = 1 },
                { prefab = "froglegs", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.MERM
        }
    },
    {
        name = "Lure Plant",
        prefab = "lureplant",
        bank = "eyeplant_trap",
        build = "eyeplant_trap",
        anim_idle = "idle_hidden",
        anim_action = "hit",
        scale = 0.4,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 300,
            damage = 0,
            speed = 0,
            diet = { "meat" },

            drops = {
                { prefab = "plantmeat", amount = 1, chance = 1 },
                { prefab = "lureplantbulb", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.LUREPLANT
        }
    },
    {
        name = "Eyeplant",
        prefab = "eyeplant",
        bank = "eyeplant",
        build = "eyeplant",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 30,
            damage = 20,
            speed = 0,
            diet = { "meat" },
            drops = "none",
            info = BESTIARYINFO.EYEPLANT
        }
    },
    {
        name = "Mosquito",
        prefab = "mosquito",
        bank = "mosquito",
        build = "mosquito",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },

        stats = {
            health = 100,
            damage = 3,
            speed = 12,
            diet = "none",

            drops = {
                { prefab = "mosquitosack", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.MOSQUITO
        }
    },
    {
        name = "Pengull",
        prefab = "penguin",
        bank = "penguin",
        build = "penguin_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 150,
            damage = 33,
            speed = 6,
            diet = { unpack(omni_diet), "horrible" },

            drops = {
                { prefab = "feather_crow", amount = 1, chance = 0.2 },
                { prefab = "smallmeat", amount = 1, chance = 0.1 },
                { prefab = "drumstick", amount = 1, chance = 0.1 }
            },

            info = BESTIARYINFO.PENGUIN
        }
    },
    {
        name = "Pig Man",
        prefab = "pigman",
        bank = "pigman",
        build = "pig_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 250,
            damage = 33,
            speed = 5,
            diet = { unpack(omni_diet), "horrible", "raw" },

            drops = {
                { prefab = "meat", amount = 1, chance = 0.75 },
                { prefab = "pigskin", amount = 1, chance = 0.25 },
            },

            info = BESTIARYINFO.PIG
        }
    },
    {
        name = "Guard Pig",
        prefab = "pigguard",
        bank = "pigman",
        build = "pig_guard_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 600,
            damage = 33,
            speed = 5,
            diet = { unpack(omni_diet), "horrible", "raw" },

            drops = {
                { prefab = "meat", amount = 1, chance = 0.75 },
                { prefab = "pigskin", amount = 1, chance = 0.25 },
            },

            info = BESTIARYINFO.PIG_GUARD
        }
    },
    {
        name = "Werepig",
        prefab = "werepig",
        bank = "pigman",
        build = "werepig_build",
        anim_idle = "were_idle_loop",
        anim_action = "howl",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 525,
            damage = 40,
            speed = 7,
            diet = { unpack(omni_diet), "horrible", "raw" },

            drops = {
                { prefab = "meat", amount = 2, chance = 1 },
                { prefab = "pigskin", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.WEREPIG
        }
    },
    {
        name = "Fireflies",
        prefab = "fireflies",
        bank = "fireflies",
        build = "fireflies",
        anim_idle = "swarm_loop",
        anim_action = nil,
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },

        stats = {
            health = 0,
            damage = 0,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "fireflies", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.FIREFLIES
        }
    },
    {
        name = "Rock Lobster",
        prefab = "rocky",
        bank = "rocky",
        build = "rocky",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.4,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = "2250-3600",
            damage = "56.25-90",
            speed = 2,
            diet = { "elemental" },

            drops = {
                { prefab = "rocks", amount = 2, chance = 1 },
                { prefab = "meat", amount = 1, chance = 1 },
                { prefab = "flint", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.ROCKY
        }
    },
    {
        name = "Crawling Horror",
        prefab = "crawlinghorror",
        bank = "shadowcreature1",
        build = "shadow_insanity1_basic",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 300,
            damage = 20,
            speed = 3,
            diet = "none",

            drops = {
                { prefab = "nightmarefuel", amount = 1, chance = 1 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.CRAWLINGHORROR
        }
    },
    {
        name = "Terrorbeak",
        prefab = "terrorbeak",
        bank = "shadowcreature2",
        build = "shadow_insanity2_basic",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 400,
            damage = 50,
            speed = 7,
            diet = "none",

            drops = {
                { prefab = "nightmarefuel", amount = 1, chance = 1 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.TERRORBEAK
        }
    },
    {
        name = "Slurper",
        prefab = "slurper",
        bank = "slurper",
        build = "slurper_basic",
        anim_idle = "idle_loop",
        anim_action = "taunt",
        scale = 0.6,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lightbulb.xml", grid_image = "monstergrid_bg_lightbulb.tex", atlas = "images/monster_bg_lightbulb.xml", image = "monster_bg_lightbulb.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 200,
            damage = 30,
            speed = 9,
            diet = "none",

            drops = {
                { prefab = "lightbulb", amount = 2, chance = 1 },
                { prefab = "slurper_pelt", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.SLURPER
        }
    }
}

return data