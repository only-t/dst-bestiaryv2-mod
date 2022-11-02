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
        scale = 0.2,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Deerclops",
                prefab = "deerclops",
                bank = "deerclops",
                build = "deerclops_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = TUNING.DEERCLOPS_HEALTH,
                    damage = 75,
                    speed = 3,
                    diet = "none",
        
                    drops = {
                        { prefab = "meat", amount = 8, chance = 1 },
                        { prefab = "deerclops_eyeball", amount = 1, chance = 1 },
                        { prefab = "chesspiece_deerclops_sketch", amount = 1, chance = 1, name_override = "sketch" },
                    },
        
                    info = BESTIARYINFO.DEERCLOPS
                },
            },
            {
                name = "Deerclops",
                prefab = "deerclops",
                bank = "deerclops",
                build = "deerclops_yule",
                anim_idle = "idle_loop",
                anim_action = "atk2",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = TUNING.DEERCLOPS_HEALTH,
                    damage = 75,
                    speed = 3,
                    diet = "none",
        
                    drops = {
                        { prefab = "meat", amount = 8, chance = 1 },
                        { prefab = "deerclops_eyeball", amount = 1, chance = 1 },
                        { prefab = "chesspiece_deerclops_sketch", amount = 1, chance = 1, name_override = "sketch" },
                    },
        
                    info = BESTIARYINFO.DEERCLOPS_YULE
                }
            }
        }
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
        scale = 0.3,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Klaus",
                prefab = "klaus",
                bank = "klaus",
                build = "klaus_build",
                anim_idle = "idle_loop",
                anim_action = "attack_doubleclaw",
                intent = STRINGS.BESTIARY_AGGRESSIVE,

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
                name = "Klaus",
                prefab = "klaus",
                bank = "klaus",
                build = "klaus_build",
                anim_idle = "idle_loop",
                anim_action = "attack_doubleclaw",
                intent = STRINGS.BESTIARY_AGGRESSIVE,

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
                        { prefab = "winter_food3", amount = 2, chance = 1 },
                    },

                    info = BESTIARYINFO.KLAUS
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("swap_chain", "klaus_build", "swap_chain_winter")
                    animstate:OverrideSymbol("swap_chain_link", "klaus_build", "swap_chain_link_winter")
                    animstate:OverrideSymbol("swap_chain_lock", "klaus_build", "swap_chain_lock_winter")
                    animstate:OverrideSymbol("swap_klaus_antler", "klaus_build", "swap_klaus_antler_winter")
                end,
            },
        }
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
        scale = 1,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_savanna.xml", grid_image = "monstergrid_bg_savanna.tex", atlas = "images/monster_bg_savanna.xml", image = "monster_bg_savanna.tex" },

        forms = {
            {
                name = "Rabbit",
                prefab = "rabbit",
                bank = "rabbit",
                build = "rabbit_build",
                anim_idle = "idle",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
        
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
                name = "Beardling",
                prefab = "rabbit",
                bank = "rabbit",
                build = "beard_monster",
                anim_idle = "idle",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 25,
                    damage = 0,
                    speed = 5,
                    diet = { "veggies" },
                    drops = "none",
        
                    limited_drops = {
                        amount = 1,
                        loot = {
                            { prefab = "monstermeat", amount = 1, chance = 0.4 },
                            { prefab = "nightmarefuel", amount = 1, chance = 0.4 },
                            { prefab = "beardhair", amount = 1, chance = 0.2 },
                        }
                    },
        
                    info = BESTIARYINFO.BEARDLING
                }
            }
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
        scale = 0.15,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Bearger",
                prefab = "bearger",
                bank = "bearger",
                build = "bearger_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,

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
                name = "Bearger",
                prefab = "bearger",
                bank = "bearger",
                build = "bearger_yule",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,

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
        },
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
        scale = 0.8,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        
        forms = {
            {
                name = "Bee",
                prefab = "bee",
                bank = "bee",
                build = "bee_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
                rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },
        
                stats = {
                    health = 100,
                    damage = 10,
                    speed = 6,
                    diet = "none",
                    drops = "none",
        
                    limited_drops = {
                        amount = 1,
                        loot = {
                            { prefab = "honey", amount = 1, chance = 0.167 },
                            { prefab = "stinger", amount = 1, chance = 0.833 },
                        }
                    },
        
                    info = BESTIARYINFO.BEE
                }
            },
            {
                name = "Killer Bee",
                prefab = "killerbee",
                bank = "bee",
                build = "bee_angry_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
                rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },
        
                stats = {
                    health = 100,
                    damage = 10,
                    speed = 6,
                    diet = "none",
                    drops = "none",
        
                    limited_drops = {
                        amount = 1,
                        loot = {
                            { prefab = "honey", amount = 1, chance = 0.167 },
                            { prefab = "stinger", amount = 1, chance = 0.833 },
                        }
                    },
        
                    info = BESTIARYINFO.KILLERBEE
                }
            },
            {
                name = "Grumble Bee",
                prefab = "beeguard",
                bank = "bee_guard",
                build = "bee_guard_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
                rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },
        
                stats = {
                    health = 150,
                    damage = 15,
                    speed = 4.2,
                    diet = "none",
        
                    drops = {
                        { prefab = "stinger", amount = 1, chance = 0.01 },
                    },
        
                    info = BESTIARYINFO.GRUMPYBEE
                }
            }
        }
    },
    {
        name = "Butterfly",
        prefab = "butterfly",
        bank = "butterfly",
        build = "butterfly_basic",
        anim_idle = "flight_cycle",
        anim_action = "idle_flight_loop",
        scale = 0.6,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 1,
            damage = 0,
            speed = 5,
            diet = "none",
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "butter", amount = 1, chance = 0.02 },
                    { prefab = "butterflywings", amount = 1, chance = 0.98 },
                }
            },

            info = BESTIARYINFO.BUTTERFLY
        }
    },
    {
        scale = 0.25,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_savanna.xml", grid_image = "monstergrid_bg_savanna.tex", atlas = "images/monster_bg_savanna.xml", image = "monster_bg_savanna.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Baby Beefalo",
                prefab = "babybeefalo",
                bank = "beefalo",
                build = "beefalo_baby_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,

                stats = {
                    health = 300,
                    damage = 0,
                    speed = 9,
                    diet = { "veggies" },

                    drops = {
                        { prefab = "smallmeat", amount = 3, chance = 1 },
                        { prefab = "beefalowool", amount = 1, chance = 1 },
                    },

                    info = BESTIARYINFO.BABYBEEFALO
                },
            },
            {
                name = "Toddler Beefalo",
                prefab = "babybeefalo",
                bank = "beefalo",
                build = "beefalo_baby_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,

                stats = {
                    health = 300,
                    damage = 0,
                    speed = 9,
                    diet = { "veggies" },
        
                    drops = {
                        { prefab = "smallmeat", amount = 4, chance = 1 },
                        { prefab = "beefalowool", amount = 2, chance = 1 },
                    },
        
                    info = BESTIARYINFO.BABYBEEFALO
                }
            },
            {
                name = "Teen Beefalo",
                prefab = "babybeefalo",
                bank = "beefalo",
                build = "beefalo_baby_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,

                stats = {
                    health = 300,
                    damage = 0,
                    speed = 9,
                    diet = { "veggies" },
        
                    drops = {
                        { prefab = "meat", amount = 3, chance = 1 },
                        { prefab = "beefalowool", amount = 2, chance = 1 },
                    },
        
                    info = BESTIARYINFO.BABYBEEFALO
                }
            }
        }
    },
    {
        name = "Crow",
        prefab = "crow",
        bank = "crow",
        build = "crow_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.65,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 0,
            diet = { "seeds" },
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "smallmeat", amount = 1, chance = 0.5 },
                    { prefab = "feather_crow", amount = 1, chance = 0.5 },
                }
            },

            info = BESTIARYINFO.CROW
        }
    },
    {
        name = "Redbird",
        prefab = "robin",
        bank = "crow",
        build = "robin_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.65,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 0,
            diet = { "seeds" },
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "smallmeat", amount = 1, chance = 0.5 },
                    { prefab = "feather_robin", amount = 1, chance = 0.5 },
                }
            },

            info = BESTIARYINFO.REDBIRD
        }
    },
    {
        name = "Snowbird",
        prefab = "robin_winter",
        bank = "crow",
        build = "robin_winter_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.65,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 0,
            diet = { "seeds" },
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "smallmeat", amount = 1, chance = 0.5 },
                    { prefab = "feather_robin_winter", amount = 1, chance = 0.5 },
                }
            },

            info = BESTIARYINFO.SNOWBIRD
        }
    },
    {
        scale = 0.65,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        forms = {
            {
                name = "Canary",
                prefab = "canary",
                bank = "crow",
                build = "canary_build",
                anim_idle = "idle",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 25,
                    damage = 0,
                    speed = 0,
                    diet = { "seeds" },
                    drops = "none",
        
                    limited_drops = {
                        amount = 1,
                        loot = {
                            { prefab = "smallmeat", amount = 1, chance = 0.91 },
                            { prefab = "feather_canary", amount = 1, chance = 0.09 },
                        }
                    },
        
                    info = BESTIARYINFO.CANARY
                }
            },
            {
                name = "Canary (Volatile)",
                prefab = "canary_poisoned",
                bank = "crow",
                build = "canary_build",
                anim_idle = "stunned_loop",
                anim_action = nil,
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 25,
                    damage = 0,
                    speed = 0,
                    diet = { "seeds" },
        
                    drops = {
                        { prefab = "feather_canary", amount = 5, chance = 1 },
                        { prefab = "feather_canary", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.CANARY_SICK
                }
            }
        }
    },
    {
        name = "Puffin",
        prefab = "puffin",
        bank = "puffin",
        build = "puffin_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.65,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 0,
            diet = { "seeds" },
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "smallmeat", amount = 1, chance = 0.5 },
                    { prefab = "feather_crow", amount = 1, chance = 0.5 },
                }
            },

            info = BESTIARYINFO.PUFFIN
        }
    },
    {
        scale = 0.5,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_cavewilds.xml", grid_image = "monstergrid_bg_cavewilds.tex", atlas = "images/monster_bg_cavewilds.xml", image = "monster_bg_cavewilds.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Bunnyman",
                prefab = "bunnyman",
                bank = "manrabbit",
                build = "manrabbit_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 200,
                    damage = 40,
                    speed = 6,
                    diet = { "veggies", "raw" },
                    drops = "none",
        
                    limited_drops = {
                        amount = 1,
                        loot = {
                            { prefab = "carrot", amount = 1, chance = 0.375 },
                            { prefab = "meat", amount = 1, chance = 0.375 },
                            { prefab = "manrabbit_tail", amount = 1, chance = 0.25 },
                        }
                    },
        
                    info = BESTIARYINFO.BUNNYMAN
                }
            },
            {
                name = "Beardlord",
                prefab = "bunnyman",
                bank = "manrabbit",
                build = "manrabbit_beard_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 200,
                    damage = 60,
                    speed = 6,
                    diet = { "veggies", "raw" },
        
                    drops = {
                        { prefab = "beardhair", amount = 2, chance = 1 },
                        { prefab = "monstermeat", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.BEARDLORD
                }
            }
        }
    },
    {
        scale = 0.75,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Chester",
                prefab = "chester",
                bank = "chester",
                build = "chester_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
                
                stats = {
                    health = 450,
                    damage = 0,
                    speed = 7,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.CHESTER
                },
            },
            {
                name = "Chester",
                prefab = "chester",
                bank = "chester",
                build = "chester_snow_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
                
                stats = {
                    health = 450,
                    damage = 0,
                    speed = 7,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.CHESTER
                },
            },
            {
                name = "Chester",
                prefab = "chester",
                bank = "chester",
                build = "chester_shadow_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
                
                stats = {
                    health = 450,
                    damage = 0,
                    speed = 7,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.CHESTER
                },
            }
        }
    },
    {
        scale = 0.3,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Clockwork Bishop",
                prefab = "bishop",
                bank = "bishop",
                build = "bishop_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 40,
                    speed = 5,
                    diet = "none",
        
                    drops = {
                        { prefab = "gears", amount = 2, chance = 1 },
                        { prefab = "purplegem", amount = 1, chance = 1 }
                    },
        
                    info = BESTIARYINFO.BISHOP
                }
            },
            {
                name = "Damaged Bishop",
                prefab = "bishop_nightmare",
                bank = "bishop",
                build = "bishop_nightmare",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 40,
                    speed = 5,
                    diet = "none",
        
                    drops = {
                        { prefab = "purplegem", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.6 },
                        { prefab = "thulecite_pieces", amount = 1, chance = 0.5 }
                    },
        
                    info = BESTIARYINFO.BISHOP_NIGHTMARE
                }
            }
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Clockwork Knight",
                prefab = "knight",
                bank = "knight",
                build = "knight_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 40,
                    speed = 5,
                    diet = "none",
        
                    drops = {
                        { prefab = "gears", amount = 2, chance = 1 },
                    },
        
                    info = BESTIARYINFO.KNIGHT
                }
            },
            {
                name = "Damaged Knight",
                prefab = "knight_nightmare",
                bank = "knight",
                build = "knight_nightmare",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 40,
                    speed = 5,
                    diet = "none",
        
                    drops = {
                        { prefab = "gears", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.6 },
                        { prefab = "thulecite_pieces", amount = 1, chance = 0.5 }
                    },
        
                    info = BESTIARYINFO.KNIGHT_NIGHTMARE
                }
            }
        }
    },
    {
        scale = 0.2,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Clockwork Rook",
                prefab = "rook",
                bank = "rook",
                build = "rook_build",
                anim_idle = "idle",
                anim_action = "gore",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 45,
                    speed = 16,
                    diet = "none",
        
                    drops = {
                        { prefab = "gears", amount = 2, chance = 1 },
                    },
        
                    info = BESTIARYINFO.ROOK
                }
            },
            {
                name = "Damaged Rook",
                prefab = "rook_nightmare",
                bank = "rook",
                build = "rook_nightmare",
                anim_idle = "idle",
                anim_action = "gore",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 45,
                    speed = 16,
                    diet = "none",
        
                    drops = {
                        { prefab = "gears", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.6 },
                        { prefab = "thulecite_pieces", amount = 1, chance = 0.5 }
                    },
        
                    info = BESTIARYINFO.ROOK_NIGHTMARE
                }
            }
        }
    },
    {
        name = "Depths Worm",
        prefab = "worm",
        bank = "worm",
        build = "worm",
        anim_idle = "taunt",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 900,
            damage = 75,
            speed = 4,
            diet = omni_diet,

            drops = {
                { prefab = "monstermeat", amount = 4, chance = 1 },
                { prefab = "wormlight", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.DEPTHS_WORM
        }
    },
    {
        name = "Ewecus",
        prefab = "spat",
        bank = "spat",
        build = "spat_build",
        anim_idle = "idle_loop",
        anim_action = "strike",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        stats = {
            health = 800,
            damage = 60,
            speed = 7,
            diet = { "veggies" },

            drops = {
                { prefab = "meat", amount = 4, chance = 1 },
                { prefab = "steelwool", amount = 2, chance = 1 },
                { prefab = "steelwool", amount = 1, chance = 0.5 },
                { prefab = "phlegm", amount = 1, chance = 1 },
                { prefab = "phlegm", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.YUCKY_SHEEP
        }
    },
    {
        name = "Frog",
        prefab = "frog",
        bank = "frog",
        build = "frog",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.6,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 100,
            damage = 10,
            speed = 8,
            diet = { "veggies" },

            drops = {
                { prefab = "froglegs", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.FROG
        }
    },
    {
        name = "Ghost",
        prefab = "ghost",
        bank = "ghost",
        build = "ghost_build",
        anim_idle = "idle",
        anim_action = "angry",
        scale = 0.35,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },

        stats = {
            health = 200,
            damage = 15,
            speed = 2,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.GHOST
        }
    },
    {
        name = "Gobbler",
        prefab = "perd",
        bank = "perd",
        build = "perd",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.3,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 0,
            speed = 8,
            diet = { "veggies", "raw" },

            drops = {
                { prefab = "drumstick", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.PERD
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Hound",
                prefab = "hound",
                bank = "hound",
                build = "hound_ocean",
                anim_idle = "idle",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
                
                stats = {
                    health = 150,
                    damage = 20,
                    speed = 10,
                    diet = { "meat", "horrible" },
        
                    drops = {
                        { prefab = "monstermeat", amount = 1, chance = 1 },
                        { prefab = "houndstooth", amount = 1, chance = 0.125 },
                    },
        
                    info = BESTIARYINFO.HOUND
                }
            },
            {
                name = "Red Hound",
                prefab = "firehound",
                bank = "hound",
                build = "hound_red_ocean",
                anim_idle = "idle",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 100,
                    damage = 30,
                    speed = 10,
                    diet = { "meat", "horrible" },
        
                    drops = {
                        { prefab = "monstermeat", amount = 1, chance = 1 },
                        { prefab = "houndstooth", amount = 1, chance = 1 },
                        { prefab = "redgem", amount = 1, chance = 0.2 },
                    },
        
                    info = BESTIARYINFO.RED_HOUND
                }
            },
            {
                name = "Blue Hound",
                prefab = "icehound",
                bank = "hound",
                build = "hound_ice_ocean",
                anim_idle = "idle",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 100,
                    damage = 30,
                    speed = 10,
                    diet = { "meat", "horrible" },
        
                    drops = {
                        { prefab = "monstermeat", amount = 1, chance = 1 },
                        { prefab = "houndstooth", amount = 2, chance = 1 },
                        { prefab = "bluegem", amount = 1, chance = 0.2 },
                    },
        
                    info = BESTIARYINFO.BLUE_HOUND
                }
            }
        }
    },
    {
        scale = 0.3,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Koalefant",
                prefab = "koalefant_summer",
                bank = "koalefant",
                build = "koalefant_summer_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 1000,
                    damage = 50,
                    speed = 7,
                    diet = { "veggies" },
        
                    drops = {
                        { prefab = "meat", amount = 8, chance = 1 },
                        { prefab = "trunk_summer", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.KOALEFANT
                }
            },
            {
                name = "Winter Koalefant",
                prefab = "koalefant_winter",
                bank = "koalefant",
                build = "koalefant_winter_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,

                stats = {
                    health = 1000,
                    damage = 50,
                    speed = 7,
                    diet = { "veggies" },

                    drops = {
                        { prefab = "meat", amount = 8, chance = 1 },
                        { prefab = "trunk_winter", amount = 1, chance = 1 },
                    },

                    info = BESTIARYINFO.KOALEFANT
                }
            }
        }
    },
    {
        name = "Krampus",
        prefab = "krampus",
        bank = "krampus",
        build = "krampus_build",
        anim_idle = "idle",
        anim_action = "taunt",
        scale = 0.3,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 300,
            damage = 50,
            speed = 7,
            diet = "none",

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 1 },
                { prefab = "charcoal", amount = 2, chance = 1 },
                { prefab = "krampus_sack", amount = 1, chance = 0.01 },
            },

            info = BESTIARYINFO.KRAMPUS
        }
    },
    {
        name = "MacTusk",
        prefab = "walrus",
        bank = "walrus",
        build = "walrus_build",
        anim_idle = "idle_loop",
        anim_action = "atk_dart",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 300,
            damage = 33,
            speed = 4,
            diet = { "meat" },

            drops = {
                { prefab = "meat", amount = 1, chance = 1 },
                { prefab = "blowdart_pipe", amount = 1, chance = 1 },
                { prefab = "walrus_tusk", amount = 1, chance = 0.5 },
                { prefab = "walrushat", amount = 1, chance = 0.25 },
            },

            info = BESTIARYINFO.WALRUS
        }
    },
    {
        name = "Wee MacTusk",
        prefab = "little_walrus",
        bank = "walrus",
        build = "walrus_baby_build",
        anim_idle = "idle_loop",
        anim_action = "abandon",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 300,
            damage = 22,
            speed = 5,
            diet = { "meat" },

            drops = {
                { prefab = "meat", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.LITTLE_WALRUS
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
    },
    {
        scale = 0.5,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lightbulb.xml", grid_image = "monstergrid_bg_lightbulb.tex", atlas = "images/monster_bg_lightbulb.xml", image = "monster_bg_lightbulb.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Slurtle",
                prefab = "slurtle",
                bank = "slurtle",
                build = "slurtle",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 1200,
                    damage = 25,
                    speed = 3,
                    diet = { "elemental" },
        
                    drops = {
                        { prefab = "slurtleslime", amount = 2, chance = 1 },
                        { prefab = "slurtleslime", amount = 1, chance = 1 },
                        { prefab = "slurtle_shellpieces", amount = 1, chance = 1 },
                        { prefab = "slurtlehat", amount = 1, chance = 0.1 },
                    },
        
                    info = BESTIARYINFO.SLURTLE
                }
            },
            {
                name = "Snurtle",
                prefab = "snurtle",
                bank = "snurtle",
                build = "slurtle_snaily",
                anim_idle = "idle",
                anim_action = "hit_out",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 200,
                    damage = 0,
                    speed = 4,
                    diet = { "elemental" },
        
                    drops = {
                        { prefab = "slurtleslime", amount = 2, chance = 1 },
                        { prefab = "slurtleslime", amount = 1, chance = 1 },
                        { prefab = "slurtle_shellpieces", amount = 1, chance = 1 },
                        { prefab = "armorsnurtleshell", amount = 1, chance = 0.75 },
                    },
        
                    info = BESTIARYINFO.SNURTLE
                }
            }
        }
    },
    {
        scale = 0.5,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Splumonkey",
                prefab = "monkey",
                bank = "kiki",
                build = "kiki_basic",
                anim_idle = "idle_loop",
                anim_action = "throw",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 125,
                    damage = 20,
                    speed = 7,
                    diet = { "veggies" },
        
                    drops = {
                        { prefab = "smallmeat", amount = 1, chance = 1 },
                        { prefab = "cave_banana", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.MONKEY
                }
            },
            {
                name = "Shadow Splumonkey",
                prefab = "monkey",
                bank = "kiki",
                build = "kiki_nightmare_skin",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 125,
                    damage = 20,
                    speed = 7,
                    diet = { "veggies" },
        
                    drops = {
                        { prefab = "smallmeat", amount = 2, chance = 1 },
                        { prefab = "cave_banana", amount = 1, chance = 1 },
                        { prefab = "beardhair", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.MONKEY_SPOOKY
                }
            }
        }
    },
    {
        name = "Spider Warrior",
        prefab = "spider_warrior",
        bank = "spider",
        build = "spider_warrior_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 400,
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

            info = BESTIARYINFO.SPIDER_WARRIOR
        }
    },
    {
        name = "Spider Queen",
        prefab = "spiderqueen",
        bank = "spider_queen",
        build = "spider_queen_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 2500,
            damage = 80,
            speed = 1.75,
            diet = { "meat", "horrible" },

            drops = {
                { prefab = "monstermeat", amount = 4, chance = 1 },
                { prefab = "silk", amount = 4, chance = 1 },
                { prefab = "spidereggsack", amount = 1, chance = 1 },
                { prefab = "spiderhat", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.SPIDER_QUEEN
        }
    },
    {
        name = "Cave Spider",
        prefab = "spider_hider",
        bank = "spider",
        build = "DS_spider_caves",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 225,
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

            info = BESTIARYINFO.CAVE_SPIDER
        }
    },
    {
        name = "Spitter",
        prefab = "spider_spitter",
        bank = "spider",
        build = "DS_spider2_caves",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 350,
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

            info = BESTIARYINFO.SPIDER_SPITTER
        }
    },
    {
        name = "Dangling Depth Dweller",
        prefab = "spider_dropper",
        bank = "spider",
        build = "spider_white",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 400,
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

            info = BESTIARYINFO.SPIDER_DROPPER
        }
    },
    {
        name = "Tallbird",
        prefab = "tallbird",
        bank = "tallbird",
        build = "ds_tallbird_basic",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 800,
            damage = 50,
            speed = 7,
            diet = omni_diet,

            drops = {
                { prefab = "meat", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.TALLBIRD
        }
    },
    {
        name = "Smallish Tallbird",
        prefab = "teenbird",
        bank = "tallbird",
        build = "tallbird_teen_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 600,
            damage = 37.5,
            speed = 6,
            diet = omni_diet,

            drops = {
                { prefab = "meat", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.TEENBIRD
        }
    },
    {
        name = "Smallbird",
        prefab = "smallbird",
        bank = "smallbird",
        build = "smallbird_basic",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.4,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 10,
            speed = 6,
            diet = { "seeds", "berries" },

            drops = {
                { prefab = "smallmeat", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.SMALLBIRD
        }
    },
    {
        name = "Big Tentacle",
        prefab = "tentacle_pillar",
        bank = "tentaclepillar",
        build = "tentacle_pillar",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.06,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },

        stats = {
            health = 750,
            damage = 0,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "tentaclespike", amount = 1, chance = 0.5 },
                { prefab = "turf_marsh", amount = 1, chance = 0.25 },
                { prefab = "tentaclespots", amount = 1, chance = 0.4 },
                { prefab = "rocks", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.TENTAPILLAR
        }
    },
    {
        name = "Baby Tentacle",
        prefab = "tentacle_pillar_arm",
        bank = "tentacle_arm",
        build = "tentacle_arm_build",
        anim_idle = "atk_idle",
        anim_action = "atk_loop",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },

        stats = {
            health = 20,
            damage = 5,
            speed = 0,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.BABYTENTACLE
        }
    },
    {
        scale = 0.2,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Treeguard",
                prefab = "leif",
                bank = "leif",
                build = "leif_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = "2100-3750",
                    damage = "34.65-61.875", -- Wth are those numbers?
                    speed = "0.735-2.344",
                    diet = "none",
        
                    drops = {
                        { prefab = "monstermeat", amount = 1, chance = 1 },
                        { prefab = "livinglog", amount = 6, chance = 1 },
                    },
        
                    info = BESTIARYINFO.TREEGUARD
                },
            },
            {
                name = "Treeguard",
                prefab = "leif",
                bank = "leif",
                build = "leif_lumpy_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = "2100-3750",
                    damage = "34.65-61.875", -- Wth are those numbers?
                    speed = "0.735-2.344",
                    diet = "none",
        
                    drops = {
                        { prefab = "monstermeat", amount = 1, chance = 1 },
                        { prefab = "livinglog", amount = 6, chance = 1 },
                    },
        
                    info = BESTIARYINFO.TREEGUARD
                },
            }
        }
    },
    {
        name = "Buzzard",
        prefab = "buzzard",
        bank = "buzzard",
        build = "buzzard_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 250,
            damage = 15,
            speed = 4,
            diet = omni_diet,

            drops = {
                { prefab = "drumstick", amount = 1, chance = 1 },
                { prefab = "smallmeat", amount = 1, chance = 0.33 },
                { prefab = "feather_crow", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.BUZZARD
        }
    },
    {
        name = "Catcoon",
        prefab = "catcoon",
        bank = "catcoon",
        build = "catcoon_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.6,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 150,
            damage = 25,
            speed = 3,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 1, chance = 1 },
                { prefab = "coontail", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.CATCOON
        }
    },
    {
        scale = 0.25,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Dragonfly",
                prefab = "dragonfly",
                bank = "dragonfly",
                build = "dragonfly_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 27500,
                    damage = 75,
                    speed = 6.5,
                    diet = "none",
        
                    drops = {
                        { prefab = "dragon_scales", amount = 1, chance = 1 },
                        { prefab = "dragonflyfurnace_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                        { prefab = "chesspiece_dragonfly_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "lavae_egg", amount = 1, chance = 0.33 },
        
                        { prefab = "meat", amount = 6, chance = 1 },
                        { prefab = "goldnugget", amount = 4, chance = 1 },
                        { prefab = "goldnugget", amount = 4, chance = 0.5 },
        
                        { prefab = "redgem", amount = 2, chance = 1 },
                        { prefab = "bluegem", amount = 2, chance = 1 },
                        { prefab = "purplegem", amount = 1, chance = 1 },
                        { prefab = "orangegem", amount = 1, chance = 1 },
                        { prefab = "yellowgem", amount = 1, chance = 1 },
                        { prefab = "greengem", amount = 1, chance = 1 },
        
                        { prefab = "purplegem", amount = 1, chance = 0.5 },
                        { prefab = "orangegem", amount = 1, chance = 0.5 },
                        { prefab = "yellowgem", amount = 1, chance = 0.5 },
                        { prefab = "greengem", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.DRAGONFLY
                },
            },
            {
                name = "Dragonfly",
                prefab = "dragonfly",
                bank = "dragonfly",
                build = "dragonfly_yule_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 27500,
                    damage = 75,
                    speed = 6.5,
                    diet = "none",
        
                    drops = {
                        { prefab = "dragon_scales", amount = 1, chance = 1 },
                        { prefab = "dragonflyfurnace_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                        { prefab = "chesspiece_dragonfly_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "lavae_egg", amount = 1, chance = 0.33 },
        
                        { prefab = "meat", amount = 6, chance = 1 },
                        { prefab = "goldnugget", amount = 4, chance = 1 },
                        { prefab = "goldnugget", amount = 4, chance = 0.5 },
        
                        { prefab = "redgem", amount = 2, chance = 1 },
                        { prefab = "bluegem", amount = 2, chance = 1 },
                        { prefab = "purplegem", amount = 1, chance = 1 },
                        { prefab = "orangegem", amount = 1, chance = 1 },
                        { prefab = "yellowgem", amount = 1, chance = 1 },
                        { prefab = "greengem", amount = 1, chance = 1 },
        
                        { prefab = "purplegem", amount = 1, chance = 0.5 },
                        { prefab = "orangegem", amount = 1, chance = 0.5 },
                        { prefab = "yellowgem", amount = 1, chance = 0.5 },
                        { prefab = "greengem", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.DRAGONFLY
                }
            }
        }
    },
    {
        name = "Glommer",
        prefab = "glommer",
        bank = "glommer",
        build = "glommer",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 100,
            damage = 0,
            speed = 6,
            diet = "none",

            drops = {
                { prefab = "monstermeat", amount = 3, chance = 1 },
                { prefab = "glommerwings", amount = 1, chance = 1 },
                { prefab = "glommerfuel", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.GLOMMER
        }
    },
    {
        name = "Moleworm",
        prefab = "mole",
        bank = "mole",
        build = "mole_build",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 30,
            damage = 0,
            speed = 2.75,
            diet = { "elemental" },

            drops = {
                { prefab = "smallmeat", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.MOLE
        }
    },
    {
        scale = 0.2,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Moosegoose", -- Special case for randomly generated name
                prefab = "moose",
                bank = "goosemoose",
                build = "goosemoose_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 6000,
                    damage = 75,
                    speed = 12,
                    diet = { "meat", "veggies", "seeds" },
        
                    drops = {
                        { prefab = "meat", amount = 6, chance = 1 },
                        { prefab = "drumstick", amount = 2, chance = 1 },
                        { prefab = "goose_feather", amount = 3, chance = 1 },
                        { prefab = "goose_feather", amount = 2, chance = 0.33 },
                        { prefab = "chesspiece_moosegoose_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "oceanfishingbobber_goose_tacklesketch", amount = 1, chance = 1, name_override = "tacklesketch" },
                    },
        
                    info = BESTIARYINFO.MOOSEGOOSE
                },
            },
            {
                name = "Moosegoose", -- Special case for randomly generated name
                prefab = "moose",
                bank = "goosemoose",
                build = "goosemoose_yule_build",
                anim_idle = "idle",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 6000,
                    damage = 75,
                    speed = 12,
                    diet = { "meat", "veggies", "seeds" },
        
                    drops = {
                        { prefab = "meat", amount = 6, chance = 1 },
                        { prefab = "drumstick", amount = 2, chance = 1 },
                        { prefab = "goose_feather", amount = 3, chance = 1 },
                        { prefab = "goose_feather", amount = 2, chance = 0.33 },
                        { prefab = "chesspiece_moosegoose_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "oceanfishingbobber_goose_tacklesketch", amount = 1, chance = 1, name_override = "tacklesketch" },
                    },
        
                    info = BESTIARYINFO.MOOSEGOOSE
                },
            }
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },
        
        forms = {
            {
                name = "Mosling",
                prefab = "mossling",
                bank = "mossling",
                build = "mossling_build",
                anim_idle = "idle",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 525,
                    damage = 0,
                    speed = 5,
                    diet = { "meat", "veggies", "seeds" },
        
                    drops = {
                        { prefab = "meat", amount = 1, chance = 1 },
                        { prefab = "drumstick", amount = 1, chance = 1 },
                        { prefab = "goose_feather", amount = 2, chance = 1 },
                        { prefab = "goose_feather", amount = 1, chance = 0.33 },
                    },
        
                    info = BESTIARYINFO.MOSSLING
                }
            },
            {
                name = "Mosling",
                prefab = "mossling",
                bank = "mossling",
                build = "mossling_angry_build",
                anim_idle = "idle",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 525,
                    damage = 50,
                    speed = 5,
                    diet = { "meat", "veggies", "seeds" },
        
                    drops = {
                        { prefab = "meat", amount = 1, chance = 1 },
                        { prefab = "drumstick", amount = 1, chance = 1 },
                        { prefab = "goose_feather", amount = 2, chance = 1 },
                        { prefab = "goose_feather", amount = 1, chance = 0.33 },
                    },
        
                    info = BESTIARYINFO.MOSSLING
                }
            },
            {
                name = "Mosling",
                prefab = "mossling",
                bank = "mossling",
                build = "mossling_yule_build",
                anim_idle = "idle",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 525,
                    damage = 0,
                    speed = 5,
                    diet = { "meat", "veggies", "seeds" },
        
                    drops = {
                        { prefab = "meat", amount = 1, chance = 1 },
                        { prefab = "drumstick", amount = 1, chance = 1 },
                        { prefab = "goose_feather", amount = 2, chance = 1 },
                        { prefab = "goose_feather", amount = 1, chance = 0.33 },
                    },
        
                    info = BESTIARYINFO.MOSSLING
                }
            },
            {
                name = "Mosling",
                prefab = "mossling",
                bank = "mossling",
                build = "mossling_yule_angry_build",
                anim_idle = "idle",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 525,
                    damage = 50,
                    speed = 5,
                    diet = { "meat", "veggies", "seeds" },
        
                    drops = {
                        { prefab = "meat", amount = 1, chance = 1 },
                        { prefab = "drumstick", amount = 1, chance = 1 },
                        { prefab = "goose_feather", amount = 2, chance = 1 },
                        { prefab = "goose_feather", amount = 1, chance = 0.33 },
                    },
        
                    info = BESTIARYINFO.MOSSLING
                }
            }
        }
    },
    {
        name = "Poison Birchnut Tree",
        prefab = "deciduoustree",
        bank = "tree_leaf_monster",
        build = "tree_leaf_trunk_build",
        anim_idle = "idle_loop_agro",
        anim_action = "sway_loop_agro",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },

        stats = {
            health = TUNING.DECIDUOUS_CHOPS_MONSTER,
            damage = 30,
            speed = 0,
            diet = "none",

            drops = {
                { prefab = "livinglog", amount = 1, chance = 1 },
                { prefab = "livinglog", amount = 1, chance = 0.2 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.2 },
                { prefab = "acorn", amount = 3, chance = 1 },
            },

            info = BESTIARYINFO.POISON_TREE
        }
    },
    {
        name = "Birchnutter",
        prefab = "birchnutdrake",
        bank = "treedrake",
        build = "treedrake_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.6,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 50,
            damage = 5,
            speed = 3.5,
            diet = "none",
            drops = "none",

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "twigs", amount = 1, chance = 0.6 },
                    { prefab = "acorn", amount = 1, chance = 0.4 },
                }
            },

            info = BESTIARYINFO.NUTBOY
        }
    },
    {
        name = "Varg",
        prefab = "warg",
        bank = "warg",
        build = "warg_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        stats = {
            health = 1800,
            damage = 50,
            speed = 5.5,
            diet = "none", -- Suprisingly

            drops = {
                { prefab = "monstermeat", amount = 4, chance = 1 },
                { prefab = "monstermeat", amount = 2, chance = 0.5 },
                { prefab = "houndstooth", amount = 1, chance = 1 },
                { prefab = "houndstooth", amount = 1, chance = 0.66 },
                { prefab = "houndstooth", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.WARG
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Volt Goat",
                prefab = "lightninggoat",
                bank = "lightning_goat",
                build = "lightning_goat_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 700,
                    damage = 25,
                    speed = 8,
                    diet = "none",
        
                    drops = {
                        { prefab = "meat", amount = 2, chance = 1 },
                        { prefab = "lightninggoathorn", amount = 1, chance = 0.25 },
                    },
        
                    info = BESTIARYINFO.GOAT
                }
            },
            {
                name = "Charged Volt Goat",
                prefab = "lightninggoat",
                bank = "lightning_goat",
                build = "lightning_goat_shocked_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 700,
                    damage = "37.5-62.5",
                    speed = 8,
                    diet = "none",
        
                    drops = {
                        { prefab = "meat", amount = 2, chance = 1 },
                        { prefab = "goatmilk", amount = 1, chance = 1 },
                        { prefab = "lightninggoathorn", amount = 1, chance = 0.25 },
                    },
        
                    info = BESTIARYINFO.GOAT
                }
            }
        }
    },
    {
        name = "Antlion",
        prefab = "antlion",
        bank = "antlion",
        build = "antlion_build",
        anim_idle = "idle",
        anim_action = "cast_pre",
        scale = 0.2,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },

        stats = {
            health = 6000,
            damage = "50-100",
            speed = 0,
            diet = "none", -- Trinkets are not a foodtype

            drops = {
                { prefab = "townportaltalisman", amount = 6, chance = 1 },
                { prefab = "townportaltalisman", amount = 2, chance = 0.5 },
                { prefab = "meat", amount = 4, chance = 1 },
                { prefab = "rocks", amount = 2, chance = 1 },
                { prefab = "rocks", amount = 2, chance = 0.5 },
                { prefab = "townportal_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "chesspiece_antlion_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            limited_drops = {
                amount = 2,
                loot = {
                    { prefab = "trinket_1", amount = 1, chance = 0.22 },
                    { prefab = "trinket_3", amount = 1, chance = 0.22 },
                    { prefab = "trinket_8", amount = 1, chance = 0.22 },
                    { prefab = "trinket_9", amount = 1, chance = 0.22 },
                    { prefab = "antliontrinket", amount = 1, chance = 0.11 },
                }
            },

            info = BESTIARYINFO.ANANTANDALION
        }
    },
    {
        name = "Bee Queen",
        prefab = "beequeen",
        bank = "bee_queen",
        build = "bee_queen_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 22500,
            damage = 60,
            speed = 5.6,
            diet = "none",

            drops = {
                { prefab = "royal_jelly", amount = 6, chance = 1 },
                { prefab = "royal_jelly", amount = 1, chance = 0.5 },
                { prefab = "honeycomb", amount = 1, chance = 1 },
                { prefab = "honeycomb", amount = 1, chance = 0.5 },
                { prefab = "honey", amount = 3, chance = 1 },
                { prefab = "honey", amount = 1, chance = 0.5 },
                { prefab = "stinger", amount = 1, chance = 1 },
                { prefab = "hivehat", amount = 1, chance = 1 },
                { prefab = "bundlewrap_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "chesspiece_beequeen_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.BEEQUEEN
        }
    },
    {
        name = "Carrat",
        prefab = "carrat",
        bank = "carrat",
        build = "carrat_build",
        anim_idle = "idle1",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL, -- BESTIARY_MONSTER ?
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 7,
            diet = omni_diet,

            drops = {
                { prefab = "plantmeat", amount = 1, chance = 1 },
                { prefab = "carrot_seeds", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.CARRAT
        }
    },
    {
        name = "Cookie Cutter",
        prefab = "cookiecutter",
        bank = "cookiecutter",
        build = "cookiecutter_build",
        anim_idle = "idle",
        anim_action = "jumping",
        scale = 0.5,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 100,
            damage = 20,
            speed = 2,
            diet = { "wood" },

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 1 },
                { prefab = "cookiecuttershell", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.COOKIECUTTER
        }
    },
    {
        name = "Extra-Adorable Lavae",
        prefab = "lavae_pet",
        bank = "lavae",
        build = "lavae",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT  },

        stats = {
            health = 250,
            damage = 0,
            speed = 7.5,
            diet = { "burnt" },

            drops = {
                { prefab = "lavae_cocoon", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.CUTE_LAVAE
        }
    },
    {
        name = "Gestalt",
        prefab = "gestalt",
        bank = "brightmare_gestalt_head",
        build = "brightmare_gestalt_head",
        anim_idle = "idle",
        anim_action = nil, -- I don't know what the hell to do with this amalgam of prefabs...
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 0,
            damage = 0,
            speed = 1.5,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.GESTALT
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Red Gem Deer",
                prefab = "deer_red",
                bank = "deer",
                build = "deer_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 1500,
                    damage = 50,
                    speed = 8,
                    diet = "none",
        
                    drops = {
                        { prefab = "meat", amount = 2, chance = 1 },
                        { prefab = "redgem", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.REDGEMDEER
                }
            },
            {
                name = "Blue Gem Deer",
                prefab = "deer_blue",
                bank = "deer",
                build = "deer_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 1500,
                    damage = 50,
                    speed = 8,
                    diet = "none",
                    
                    drops = {
                        { prefab = "meat", amount = 2, chance = 1 },
                        { prefab = "bluegem", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.BLUEGEMDEER
                }
            }
        }
    },
    {
        name = "Grass Gekko",
        prefab = "grassgekko",
        bank = "grassgecko",
        build = "grassgecko",
        anim_idle = "idle_loop",
        anim_action = "tail_off",
        scale = 0.4,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 150,
            damage = 0,
            speed = 10,
            diet = "none",

            drops = {
                { prefab = "plantmeat", amount = 1, chance = 1 },
                { prefab = "cutgrass", amount = 2, chance = 0.75 },
            },

            info = BESTIARYINFO.GRASS_GEKKO
        }
    },
    {
        name = "Horror Hound",
        prefab = "mutatedhound",
        bank = "hound",
        build = "hound_mutated",
        anim_idle = "idle",
        anim_action = "taunt",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 100,
            damage = 25,
            speed = 10,
            diet = { "meat", "horrible" },

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 1 },
                { prefab = "houndstooth", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.HORROR_HOUND
        }
    },
    {
        scale = 0.8,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Hutch",
                prefab = "hutch",
                bank = "hutch",
                build = "hutch_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 450,
                    damage = 0,
                    speed = 7,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.HUTCH
                },
            },
            {
                name = "Hutch",
                prefab = "hutch",
                bank = "hutch",
                build = "hutch_pufferfish_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 450,
                    damage = 34,
                    speed = 7,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.HUTCH
                },  
            },
            {
                name = "Hutch",
                prefab = "hutch",
                bank = "hutch",
                build = "hutch_musicbox_build",
                anim_idle = "idle_loop",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 450,
                    damage = 0,
                    speed = 7,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.HUTCH
                },
            }
        }
    },
    {
        name = "Lavae",
        prefab = "lavae",
        bank = "lavae",
        build = "lavae",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_desert.xml", grid_image = "monstergrid_bg_desert.tex", atlas = "images/monster_bg_desert.xml", image = "monster_bg_desert.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT  },

        stats = {
            health = 500,
            damage = 50,
            speed = 5.5,
            diet = { "burnt" },
            drops = "none",
            info = BESTIARYINFO.LAVAE
        }
    },
    {
        name = "No-Eyed Deer",
        prefab = "deer",
        bank = "deer",
        build = "deer_build",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.4,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_winter.xml", grid_image = "monstergrid_bg_winter.tex", atlas = "images/monster_bg_winter.xml", image = "monster_bg_winter.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        stats = {
            health = 700,
            damage = 0,
            speed = 8,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 1, chance = 1 },
                { prefab = "meat", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.DEER
        }
    },
    {
        name = "Malbatross",
        prefab = "malbatross",
        bank = "malbatross",
        build = "malbatross_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.2,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 5000,
            damage = 75,
            speed = 3,
            diet = "none",

            drops = {
                { prefab = "meat", amount = 7, chance = 1 },
                { prefab = "malbatross_beak", amount = 1, chance = 1 },
                { prefab = "mast_malbatross_item_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "malbatross_feathered_weave_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "premiumwateringcan_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                { prefab = "bluegem", amount = 2, chance = 1 },
                { prefab = "bluegem", amount = 1, chance = 0.3 },
                { prefab = "yellowgem", amount = 1, chance = 0.05 },
                { prefab = "oceanfishingbobber_malbatross_tacklesketch", amount = 1, chance = 1, name_override = "tacklesketch" },
                { prefab = "chesspiece_malbatross_sketch", amount = 1, chance = 1, name_override = "sketch" },
            },

            info = BESTIARYINFO.MALBATROSS
        }
    },
    {
        name = "Moonrock Pengull",
        prefab = "mutated_penguin",
        bank = "penguin",
        build = "penguin_mutated_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 100,
            damage = 20,
            speed = 0.75,
            diet = { unpack(omni_diet), "horrible" },

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 0.25 },
                { prefab = "ice", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.MUTATED_PENGUIN
        }
    },
    {
        scale = 0.9,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Saladmander",
                prefab = "fruitdragon",
                bank = "fruit_dragon",
                build = "fruit_dragon_build",
                anim_idle = "idle_loop",
                anim_action = "attack",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 900,
                    damage = 30,
                    speed = 2,
                    diet = "none",
        
                    drops = {
                        { prefab = "plantmeat", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.SALADMANDER
                }
            },
            {
                name = "Ripe Saladmander",
                prefab = "fruitdragon",
                bank = "fruit_dragon",
                build = "fruit_dragon_ripe_build",
                anim_idle = "idle_loop",
                anim_action = "attack",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 900,
                    damage = 50,
                    speed = 2,
                    diet = "none",
        
                    drops = {
                        { prefab = "dragonfruit", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.SALADMANDER
                }
            }
        }
    },
    {
        name = "Shattered Spider",
        prefab = "spider_moon",
        bank = "spider_moon",
        build = "ds_spider_moon",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 250,
            damage = "10-25",
            speed = 6.25,
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
            
            info = BESTIARYINFO.SPIDER_MOON
        }
    },
    {
        scale = 0.15,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_lightbulb.xml", grid_image = "monstergrid_bg_lightbulb.tex", atlas = "images/monster_bg_lightbulb.xml", image = "monster_bg_lightbulb.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Toadstool",
                prefab = "toadstool",
                bank = "toadstool",
                build = "toadstool_build",
                anim_idle = "idle",
                anim_action = "attack_infection",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 52500,
                    damage = "100-250",
                    speed = "0.6-3.2",
                    diet = "none",
        
                    drops = {
                        { prefab = "froglegs", amount = 1, chance = 1 },
                        { prefab = "meat", amount = 3, chance = 1 },
                        { prefab = "meat", amount = 1, chance = 0.5 },
                        { prefab = "meat", amount = 1, chance = 0.25 },
                        { prefab = "shroom_skin", amount = 1, chance = 1 },
                        { prefab = "chesspiece_toadstool_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "red_cap", amount = 1, chance = 1 },
                        { prefab = "red_cap", amount = 2, chance = 0.33 },
                        { prefab = "blue_cap", amount = 1, chance = 1 },
                        { prefab = "blue_cap", amount = 2, chance = 0.33 },
                        { prefab = "green_cap", amount = 1, chance = 1 },
                        { prefab = "green_cap", amount = 2, chance = 0.33 },
                        { prefab = "mushroom_light_blueprint", amount = 1, chance = 0.66, name_override = "blueprint_rare" },
                    },
        
                    limited_drops = {
                        amount = 1,
                        loot = {
                            { prefab = "red_mushroomhat_blueprint", amount = 1, chance = 0.33, name_override = "blueprint_rare" },
                            { prefab = "green_mushroomhat_blueprint", amount = 1, chance = 0.33, name_override = "blueprint_rare" },
                            { prefab = "blue_mushroomhat_blueprint", amount = 1, chance = 0.33, name_override = "blueprint_rare" },
                        }
                    },
        
                    info = BESTIARYINFO.TOADSTOOL
                }
            },
            {
                name = "Misery Toadstool",
                prefab = "toadstool_dark",
                bank = "toadstool",
                build = "toadstool_dark_build",
                anim_idle = "idle",
                anim_action = "attack_infection",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 99999, -- rip
                    damage = "150-300",
                    speed = "0.6-3.2",
                    diet = "none",
        
                    drops = {
                        { prefab = "froglegs", amount = 1, chance = 1 },
                        { prefab = "meat", amount = 3, chance = 1 },
                        { prefab = "meat", amount = 1, chance = 0.5 },
                        { prefab = "meat", amount = 1, chance = 0.25 },
                        { prefab = "shroom_skin", amount = 2, chance = 1 },
                        { prefab = "chesspiece_toadstool_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "red_cap", amount = 1, chance = 1 },
                        { prefab = "red_cap", amount = 2, chance = 0.33 },
                        { prefab = "blue_cap", amount = 1, chance = 1 },
                        { prefab = "blue_cap", amount = 2, chance = 0.33 },
                        { prefab = "green_cap", amount = 1, chance = 1 },
                        { prefab = "green_cap", amount = 2, chance = 0.33 },
                        { prefab = "mushroom_light2_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                        { prefab = "sleepbomb_blueprint", amount = 1, chance = 1, name_override = "blueprint_rare" },
                    },
        
                    limited_drops = {
                        amount = 2,
                        loot = {
                            { prefab = "red_mushroomhat_blueprint", amount = 1, chance = 0.33, name_override = "blueprint_rare" },
                            { prefab = "green_mushroomhat_blueprint", amount = 1, chance = 0.33, name_override = "blueprint_rare" },
                            { prefab = "blue_mushroomhat_blueprint", amount = 1, chance = 0.33, name_override = "blueprint_rare" },
                        }
                    },
        
                    info = BESTIARYINFO.TOADSTOOL_DARK
                }
            }
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Shadow Bishop",
                prefab = "shadow_bishop",
                bank = "shadow_bishop",
                build = "shadow_bishop",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 800,
                    damage = 20,
                    speed = 3,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.SHADOW_BISHOP
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                end,
            },
            {
                name = "Shadow Bishop",
                prefab = "shadow_bishop",
                bank = "shadow_bishop",
                build = "shadow_bishop",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 2500,
                    damage = 35,
                    speed = 6,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 3, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.SHADOW_BISHOP
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("body_mid", "shadow_bishop_upg_build", "body_mid1")
                    animstate:OverrideSymbol("body_upper", "shadow_bishop_upg_build", "body_upper1")
                    animstate:OverrideSymbol("head", "shadow_bishop_upg_build", "head1")
                    animstate:OverrideSymbol("sharp_feather_a", "shadow_bishop_upg_build", "sharp_feather_a1")
                    animstate:OverrideSymbol("sharp_feather_b", "shadow_bishop_upg_build", "sharp_feather_b1")
                    animstate:OverrideSymbol("wing", "shadow_bishop_upg_build", "wing1")
                end,
            },
            {
                name = "Shadow Bishop",
                prefab = "shadow_bishop",
                bank = "shadow_bishop",
                build = "shadow_bishop",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 7500,
                    damage = 60,
                    speed = 7,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 4, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "shadowheart", amount = 1, chance = 1 },
                        { prefab = "armor_sanity", amount = 1, chance = 1 },
                        { prefab = "nightsword", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.SHADOW_BISHOP
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("body_mid", "shadow_bishop_upg_build", "body_mid2")
                    animstate:OverrideSymbol("body_upper", "shadow_bishop_upg_build", "body_upper2")
                    animstate:OverrideSymbol("head", "shadow_bishop_upg_build", "head2")
                    animstate:OverrideSymbol("sharp_feather_a", "shadow_bishop_upg_build", "sharp_feather_a2")
                    animstate:OverrideSymbol("sharp_feather_b", "shadow_bishop_upg_build", "sharp_feather_b2")
                    animstate:OverrideSymbol("wing", "shadow_bishop_upg_build", "wing2")
                end,
            }
        }
    },
    {
        scale = 0.4,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Shadow Knight",
                prefab = "shadow_knight",
                bank = "shadow_knight",
                build = "shadow_knight",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 900,
                    damage = 40,
                    speed = 7,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.SHADOW_KNIGHT
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                end,
            },
            {
                name = "Shadow Knight",
                prefab = "shadow_knight",
                bank = "shadow_knight",
                build = "shadow_knight",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 2700,
                    damage = 90,
                    speed = 9,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 3, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.SHADOW_KNIGHT
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("arm", "shadow_knight_upg_build", "arm1")
                    animstate:OverrideSymbol("ear", "shadow_knight_upg_build", "ear1")
                    animstate:OverrideSymbol("face", "shadow_knight_upg_build", "face1")
                    animstate:OverrideSymbol("head", "shadow_knight_upg_build", "head1")
                    animstate:OverrideSymbol("leg_low", "shadow_knight_upg_build", "leg_low1")
                    animstate:OverrideSymbol("neck", "shadow_knight_upg_build", "neck1")
                    animstate:OverrideSymbol("spring", "shadow_knight_upg_build", "spring1")
                end,
            },
            {
                name = "Shadow Knight",
                prefab = "shadow_knight",
                bank = "shadow_knight",
                build = "shadow_knight",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 8100,
                    damage = 150,
                    speed = 12,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 4, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "shadowheart", amount = 1, chance = 1 },
                        { prefab = "armor_sanity", amount = 1, chance = 1 },
                        { prefab = "nightsword", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.SHADOW_KNIGHT
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("arm", "shadow_knight_upg_build", "arm2")
                    animstate:OverrideSymbol("ear", "shadow_knight_upg_build", "ear2")
                    animstate:OverrideSymbol("face", "shadow_knight_upg_build", "face2")
                    animstate:OverrideSymbol("head", "shadow_knight_upg_build", "head2")
                    animstate:OverrideSymbol("leg_low", "shadow_knight_upg_build", "leg_low2")
                    animstate:OverrideSymbol("neck", "shadow_knight_upg_build", "neck2")
                    animstate:OverrideSymbol("spring", "shadow_knight_upg_build", "spring2")
                end,
            }
        }
    },
    {
        scale = 0.25,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Shadow Rook",
                prefab = "shadow_rook",
                bank = "shadow_rook",
                build = "shadow_rook",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 1000,
                    damage = 45,
                    speed = 7,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 1, chance = 1 },
                        { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.SHADOW_ROOK
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                end,
            },
            {
                name = "Shadow Rook",
                prefab = "shadow_rook",
                bank = "shadow_rook",
                build = "shadow_rook",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 4000,
                    damage = 100,
                    speed = 8,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 3, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.SHADOW_ROOK
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("base", "shadow_rook_upg_build", "base1")
                    animstate:OverrideSymbol("big_horn", "shadow_rook_upg_build", "big_horn1")
                    animstate:OverrideSymbol("bottom_head", "shadow_rook_upg_build", "bottom_head1")
                    animstate:OverrideSymbol("small_horn_lft", "shadow_rook_upg_build", "small_horn_lft1")
                    animstate:OverrideSymbol("small_horn_rgt", "shadow_rook_upg_build", "small_horn_rgt1")
                    animstate:OverrideSymbol("top_head", "shadow_rook_upg_build", "top_head1")
                end,
            },
            {
                name = "Shadow Rook",
                prefab = "shadow_rook",
                bank = "shadow_rook",
                build = "shadow_rook",
                anim_idle = "idle_loop",
                anim_action = "taunt",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 10000,
                    damage = 165,
                    speed = 11,
                    diet = "none",
        
                    drops = {
                        { prefab = "nightmarefuel", amount = 4, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "shadowheart", amount = 1, chance = 1 },
                        { prefab = "armor_sanity", amount = 1, chance = 1 },
                        { prefab = "nightsword", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.SHADOW_ROOK
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("base", "shadow_rook_upg_build", "base2")
                    animstate:OverrideSymbol("big_horn", "shadow_rook_upg_build", "big_horn2")
                    animstate:OverrideSymbol("bottom_head", "shadow_rook_upg_build", "bottom_head2")
                    animstate:OverrideSymbol("small_horn_lft", "shadow_rook_upg_build", "small_horn_lft2")
                    animstate:OverrideSymbol("small_horn_rgt", "shadow_rook_upg_build", "small_horn_rgt2")
                    animstate:OverrideSymbol("top_head", "shadow_rook_upg_build", "top_head2")
                end,
            }
        }
    },
    {
        name = "Odd Mossy Skeleton",
        prefab = "stalker_forest",
        bank = "stalker_forest",
        build = "stalker_shadow_build",
        anim_idle = "idle",
        anim_action = "taunt1",
        scale = 0.2,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 4000,
            damage = 0,
            speed = 2.4,
            diet = "none",

            drops = {
                { prefab = "shadowheart", amount = 1, chance = 1 },
                { prefab = "fossil_piece", amount = 8, chance = 1 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
            },

            info = BESTIARYINFO.FOREST_SKELETON
        }
    },
    {
        name = "Creepy Cave Skeleton",
        prefab = "stalker",
        bank = "stalker",
        build = "stalker_shadow_build",
        anim_idle = "idle",
        anim_action = "taunt1",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_cave.xml", grid_image = "monstergrid_bg_cave.tex", atlas = "images/monster_bg_cave.xml", image = "monster_bg_cave.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 4000,
            damage = 100,
            speed = 4.2,
            diet = "none",

            drops = {
                { prefab = "shadowheart", amount = 1, chance = 1 },
                { prefab = "fossil_piece", amount = 8, chance = 1 },
                { prefab = "nightmarefuel", amount = 2, chance = 1 },
                { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
            },

            info = BESTIARYINFO.CAVE_SKELETON
        }
    },
    {
        name = "Ancient Fuelweaver",
        prefab = "stalker_atrium",
        bank = "stalker",
        build = "stalker_shadow_build",
        anim_idle = "idle",
        anim_action = "taunt1",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 16000,
            damage = 100,
            speed = 4.2,
            diet = "none",

            drops = {
                { prefab = "thurible", amount = 1, chance = 1 },
                { prefab = "armorskeleton", amount = 1, chance = 1 },
                { prefab = "skeletonhat", amount = 1, chance = 1 },
                { prefab = "chesspiece_stalker_sketch", amount = 1, chance = 1, name_override = "sketch" },
                { prefab = "nightmarefuel", amount = 4, chance = 1 },
                { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
            },

            info = BESTIARYINFO.FUELWEAVER
        }
    },
    {
        scale = 0.6,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ruins.xml", grid_image = "monstergrid_bg_ruins.tex", atlas = "images/monster_bg_ruins.xml", image = "monster_bg_ruins.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Woven Shadow",
                prefab = "stalker_minion1",
                bank = "stalker_minion",
                build = "stalker_minion",
                anim_idle = "idle",
                anim_action = "spawn",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 1,
                    damage = 0,
                    speed = 3,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.STALKER_MINION
                },
            },
            {
                name = "Woven Shadow",
                prefab = "stalker_minion1",
                bank = "stalker_minion_2",
                build = "stalker_minion_2",
                anim_idle = "idle",
                anim_action = "spawn",
                intent = STRINGS.BESTIARY_PASSIVE,
        
                stats = {
                    health = 1,
                    damage = 0,
                    speed = 3,
                    diet = "none",
                    drops = "none",
                    info = BESTIARYINFO.STALKER_MINION
                },
            }
        }
    },
    {
        scale = 0.5,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        forms = {
            {
                name = "Loyal Merm Guard",
                prefab = "mermguard",
                bank = "pigman",
                build = "merm_guard_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 660,
                    damage = 50,
                    speed = 8,
                    diet = { "veggies", "seeds", "generic", "goodies" },
        
                    drops = {
                        { prefab = "fish", amount = 1, chance = 1 },
                        { prefab = "froglegs", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.MERMGUARD
                }
            },
            {
                name = "Loyal Merm Guard",
                prefab = "mermguard",
                bank = "pigman",
                build = "merm_guard_small_build",
                anim_idle = "idle_loop",
                anim_action = "atk",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 200,
                    damage = 20,
                    speed = 8,
                    diet = { "veggies", "seeds", "generic", "goodies" },
        
                    drops = {
                        { prefab = "fish", amount = 1, chance = 1 },
                        { prefab = "froglegs", amount = 1, chance = 1 },
                    },
        
                    info = BESTIARYINFO.MERMGUARD
                }
            }
        }
    },
    {
        name = "Pipspook",
        prefab = "smallghost",
        bank = "ghost_kid",
        build = "ghost_kid",
        anim_idle = "idle",
        anim_action = "sad",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },

        stats = {
            health = 0,
            damage = 0,
            speed = 6,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.PIPSPOOK
        }
    },
    {
        name = "Skittersquid",
        prefab = "squid",
        bank = "squiderp",
        build = "squid_build",
        anim_idle = "idle",
        anim_action = "attack",
        scale = 0.5,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 170,
            damage = 6.67,
            speed = 6,
            diet = { "meat", "horrible" },

            drops = {
                { prefab = "monstermeat", amount = 1, chance = 1 },
                { prefab = "lightbulb", amount = 1, chance = 0.33 },
            },

            info = BESTIARYINFO.SKITTERSQUID
        }
    },
    {
        name = "Crabby Hermit",
        prefab = "hermitcrab",
        bank = "wilson",
        build = "hermitcrab_build",
        anim_idle = "idle_loop",
        anim_action = "idle_tap_loop",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 0,
            damage = 0,
            speed = 5,
            diet = { unpack(omni_diet), "horrible", "raw" },
            drops = "none",
            info = BESTIARYINFO.PEARL
        }
    },
    {
        name = "Gnarwail",
        prefab = "gnarwail",
        bank = "gnarwail",
        build = "gnarwail_build",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.4,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 1000,
            damage = 50,
            speed = 5,
            diet = { "meat" },

            drops = {
                { prefab = "fishmeat", amount = 4, chance = 1 },
                { prefab = "gnarwail_horn", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.GNARWAIL
        }
    },
    {
        name = "Rockjaw",
        prefab = "shark",
        bank = "shark",
        build = "shark_build",
        anim_idle = "idle",
        anim_action = "attack",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 1000,
            damage = 30,
            speed = 7,
            diet = { "meat", "horrible" },

            drops = {
                { prefab = "fishmeat", amount = 4, chance = 1 },
            },
            
            info = BESTIARYINFO.SHARK
        }
    },
    {
        scale = 0.3,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Sea Weed",
                prefab = "waterplant",
                bank = "barnacle_plant",
                build = "barnacle_plant_colour_swaps",
                anim_idle = "idle",
                anim_action = "attack",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 500,
                    damage = 68,
                    speed = 0,
                    diet = "none",
        
                    drops = {
                        { prefab = "waterplant_bomb", amount = 2, chance = 1 },
                        { prefab = "waterplant_bomb", amount = 1, chance = 0.5 },
                        { prefab = "waterplant_planter", amount = 1, chance = 1 },
                    },
                    
                    info = BESTIARYINFO.WATERPLANT
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("bc_bud", "barnacle_plant_colour_swaps", "bc_bud")
                    animstate:OverrideSymbol("bc_face", "barnacle_plant_colour_swaps", "bc_face")
                    animstate:OverrideSymbol("bc_flower_petal", "barnacle_plant_colour_swaps", "bc_flower_petal")
                end
            },
            {
                name = "Sea Weed",
                prefab = "waterplant",
                bank = "barnacle_plant",
                build = "barnacle_plant_colour_swaps",
                anim_idle = "idle",
                anim_action = "attack",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 500,
                    damage = 68,
                    speed = 0,
                    diet = "none",
        
                    drops = {
                        { prefab = "waterplant_bomb", amount = 2, chance = 1 },
                        { prefab = "waterplant_bomb", amount = 1, chance = 0.5 },
                        { prefab = "waterplant_planter", amount = 1, chance = 1 },
                    },
                    
                    info = BESTIARYINFO.WATERPLANT
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("bc_bud", "barnacle_plant_colour_swaps", "white_bc_bud")
                    animstate:OverrideSymbol("bc_face", "barnacle_plant_colour_swaps", "white_bc_face")
                    animstate:OverrideSymbol("bc_flower_petal", "barnacle_plant_colour_swaps", "white_bc_flower_petal")
                end
            },
            {
                name = "Sea Weed",
                prefab = "waterplant",
                bank = "barnacle_plant",
                build = "barnacle_plant_colour_swaps",
                anim_idle = "idle",
                anim_action = "attack",
                intent = STRINGS.BESTIARY_NEUTRAL,
        
                stats = {
                    health = 500,
                    damage = 68,
                    speed = 0,
                    diet = "none",
        
                    drops = {
                        { prefab = "waterplant_bomb", amount = 3, chance = 1 },
                        { prefab = "waterplant_bomb", amount = 2, chance = 0.5 },
                        { prefab = "waterplant_planter", amount = 1, chance = 1 },
                    },
                    
                    info = BESTIARYINFO.WATERPLANT
                },

                form_override_fn = function(animstate)
                    animstate:ClearAllOverrideSymbols()
                    animstate:OverrideSymbol("bc_bud", "barnacle_plant_colour_swaps", "yellow_bc_bud")
                    animstate:OverrideSymbol("bc_face", "barnacle_plant_colour_swaps", "yellow_bc_face")
                    animstate:OverrideSymbol("bc_flower_petal", "barnacle_plant_colour_swaps", "yellow_bc_flower_petal")
                end
            }
        }
    },
    {
        name = "Terrorclaw",
        prefab = "oceanhorror",
        bank = "oceanhorror",
        build = "shadow_oceanhorror",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 400,
            damage = 50,
            speed = 2,
            diet = "none",

            drops = {
                { prefab = "nightmarefuel", amount = 1, chance = 1 },
                { prefab = "nightmarefuel", amount = 1, chance = 0.5 },
            },
            
            info = BESTIARYINFO.OCEANHORROR
        }
    },
    {
        name = "Wavey Jones",
        prefab = "waveyjones",
        bank = "shadow_wavey_jones",
        build = "shadow_wavey_jones",
        anim_idle = "idle",
        anim_action = "laugh",
        scale = 0.4,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },

        stats = {
            health = 0,
            damage = 0,
            speed = 0,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.WAVEYJONES
        }
    },
    {
        name = "Ancient Sentrypede",
        prefab = "archive_centipede",
        bank = "archive_centipede",
        build = "archive_centipede_build",
        anim_idle = "idle",
        anim_action = "taunt",
        scale = 0.2,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cavelunar.xml", grid_image = "monstergrid_bg_cavelunar.tex", atlas = "images/monster_bg_cavelunar.xml", image = "monster_bg_cavelunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 1200,
            damage = "20-40",
            speed = 4,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.SENTRYPEDE
        }
    },
    {
        name = "Dust Moth",
        prefab = "dustmoth",
        bank = "dustmoth",
        build = "dustmoth",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.5,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_cavelunar.xml", grid_image = "monstergrid_bg_cavelunar.tex", atlas = "images/monster_bg_cavelunar.xml", image = "monster_bg_cavelunar.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 200,
            damage = 0,
            speed = 2.6,
            diet = { "elemental" },

            drops = {
                { prefab = "smallmeat", amount = 1, chance = 1 },
            },

            info = BESTIARYINFO.DUST_MOTH
        }
    },
    {
        name = "Greater Gestalt",
        prefab = "gestalt_guard",
        bank = "brightmare_gestalt_evolved",
        build = "brightmare_gestalt_evolved",
        anim_idle = "idle",
        anim_action = "attack",
        scale = 0.35,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cavelunar.xml", grid_image = "monstergrid_bg_cavelunar.tex", atlas = "images/monster_bg_cavelunar.xml", image = "monster_bg_cavelunar.tex" },

        stats = {
            health = 200,
            damage = 180,
            speed = 4,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.GREATER_GESTALT
        }
    },
    {
        name = "Mush Gnome",
        prefab = "mushgnome",
        bank = "grotto_mushgnome",
        build = "grotto_mushgnome",
        anim_idle = "idle_loop",
        anim_action = "hit",
        scale = 0.4,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cavelunar.xml", grid_image = "monstergrid_bg_cavelunar.tex", atlas = "images/monster_bg_cavelunar.xml", image = "monster_bg_cavelunar.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 600,
            damage = 0,
            speed = 2,
            diet = "none",

            drops = {
                { prefab = "livinglog", amount = 1, chance = 1 },
                { prefab = "livinglog", amount = 1, chance = 0.5 },
                { prefab = "moon_cap", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.MUSH_GNOME
        }
    },
    {
        name = "Naked Mole Bat",
        prefab = "molebat",
        bank = "molebat",
        build = "molebat",
        anim_idle = "idle_sit",
        anim_action = "attack",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_cavelunar.xml", grid_image = "monstergrid_bg_cavelunar.tex", atlas = "images/monster_bg_cavelunar.xml", image = "monster_bg_cavelunar.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 150,
            damage = 30,
            speed = 5,
            diet = omni_diet,

            drops = {
                { prefab = "guano", amount = 1, chance = 0.15 },
            },

            limited_drops = {
                amount = 1,
                loot = {
                    { prefab = "monstermeat", amount = 1, chance = 0.66 },
                    { prefab = "batnose", amount = 1, chance = 0.33 },
                }
            },

            info = BESTIARYINFO.MOLEBAT
        }
    },
    {
        name = "Lord of the Fruit Flies",
        prefab = "lordfruitfly",
        bank = "fruitfly",
        build = "fruitfly_evil",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.6,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 1500,
            damage = 25,
            speed = 2,
            diet = "none",

            drops = {
                { prefab = "fruitflyfruit", amount = 1, chance = 1 },
                { prefab = "plantmeat", amount = 1, chance = 1 },
            },
            
            info = BESTIARYINFO.LORDFRUITFLY
        }
    },
    {
        name = "Fruit Fly",
        prefab = "fruitfly",
        bank = "fruitfly",
        build = "fruitfly_evil_minion",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.6,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 100,
            damage = 5,
            speed = 16,
            diet = "none",

            drops = {
                { prefab = "seeds", amount = 1, chance = 0.1 },
            },

            info = BESTIARYINFO.FRUITFLY
        }
    },
    {
        name = "Friendly Fruit Fly",
        prefab = "friendlyfruitfly",
        bank = "fruitfly",
        build = "fruitfly_good",
        anim_idle = "idle",
        anim_action = "plant_dance_loop",
        scale = 0.6,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 100,
            damage = 0,
            speed = 6,
            diet = "none",
            drops = "none",
            info = BESTIARYINFO.FRIENDLYFRUITFLY
        }
    },
    {
        name = "Misshapen Bird",
        prefab = "bird_mutant_spitter",
        bank = "mutated_robin",
        build = "bird_mutant_spitter_build",
        anim_idle = "idle",
        anim_action = "attack",
        scale = 0.65,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 10,
            damage = 20,
            speed = 4,
            diet = { "seeds" },
            drops = "none",
            info = BESTIARYINFO.MUTATED_ROBIN
        }
    },
    {
        name = "Moonblind Crow",
        prefab = "bird_mutant_spitter",
        bank = "mutated_crow",
        build = "bird_mutant_build",
        anim_idle = "idle",
        anim_action = "attack",
        scale = 0.65,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },

        stats = {
            health = 10,
            damage = 20,
            speed = 4,
            diet = { "seeds" },
            drops = "none",
            info = BESTIARYINFO.MUTATED_CROW
        }
    },
    {
        name = "Sea Strider",
        prefab = "spider_water",
        bank = "spider_water",
        build = "spider_water",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 200,
            damage = 20,
            speed = "7-10",
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
            
            info = BESTIARYINFO.WATER_SPIDER
        }
    },
    {
        scale = 0.2,
        type = STRINGS.BESTIARY_RAIDBOSS,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },

        forms = {
            {
                name = "Celestial Champion",
                prefab = "alterguardian_phase1",
                bank = "alterguardian_phase1",
                build = "alterguardian_phase1",
                anim_idle = "idle",
                anim_action = "hit",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
                rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

                stats = {
                    health = 10000,
                    damage = "50-125",
                    speed = 5,
                    diet = "none",
                    drops = {
                        { prefab = "moonrocknugget", amount = 5, chance = 1 },
                        { prefab = "moonrocknugget", amount = 2, chance = 0.66 },
                    },

                    info = BESTIARYINFO.ALTERGUARDIAN1
                }
            },
            {
                name = "Celestial Champion",
                prefab = "alterguardian_phase2",
                bank = "alterguardian_phase2",
                build = "alterguardian_phase2",
                anim_idle = "idle",
                anim_action = "attk_chop",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
                rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

                stats = {
                    health = 13000,
                    damage = 100,
                    speed = 4.5,
                    diet = "none",
                    drops = {
                        { prefab = "moonglass", amount = 4, chance = 1 },
                        { prefab = "moonglass", amount = 2, chance = 0.66 },
                        { prefab = "moonrocknugget", amount = 2, chance = 0.6 },
                        { prefab = "moonrocknugget", amount = 2, chance = 0.3 },
                    },

                    info = BESTIARYINFO.ALTERGUARDIAN2
                }
            },
            {
                name = "Celestial Champion",
                prefab = "alterguardian_phase3",
                bank = "alterguardian_phase3",
                build = "alterguardian_phase3",
                anim_idle = "idle",
                anim_action = "attk_stab",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
                rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

                stats = {
                    health = 14000,
                    damage = 112.5,
                    speed = 6,
                    diet = "none",
                    drops = {
                        { prefab = "chesspiece_guardianphase3_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "moonglass", amount = 9, chance = 1 },
                        { prefab = "moonglass", amount = 5, chance = 0.66 },
                        { prefab = "moonglass", amount = 5, chance = 0.33 },
                        { prefab = "moonglass_charged", amount = 6, chance = 1 },
                        { prefab = "moonglass_charged", amount = 3, chance = 0.66 },
                        { prefab = "moonglass_charged", amount = 3, chance = 0.33 },
                        { prefab = "moonrocknugget", amount = 4, chance = 1 },
                        { prefab = "moonrocknugget", amount = 2, chance = 0.66 },
                    },

                    info = BESTIARYINFO.ALTERGUARDIAN3
                }
            }
        }
    },
    {
        name = "Nurse Spider",
        prefab = "spider_healer",
        bank = "spider",
        build = "spider_wolf_build",
        anim_idle = "idle",
        anim_action = "atk",
        scale = 0.7,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_forest.xml", grid_image = "monstergrid_bg_forest.tex", atlas = "images/monster_bg_forest.xml", image = "monster_bg_forest.tex" },
        rotations = { FACING_DOWN, FACING_RIGHT, FACING_UP, FACING_LEFT },

        stats = {
            health = 400,
            damage = 10,
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

            info = BESTIARYINFO.SPIDER_HEALER
        }
    },
    {
        name = "Grass Gator",
        prefab = "grassgator",
        bank = "grass_gator",
        build = "grass_gator",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.3,
        intent = STRINGS.BESTIARY_NEUTRAL,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_DOWNLEFT },

        stats = {
            health = 1000,
            damage = 50,
            speed = 3.5,
            diet = { "veggies" },

            drops = {
                { prefab = "plantmeat", amount = 7, chance = 1 },
                { prefab = "cutgrass", amount = 2, chance = 1 },
                { prefab = "twigs", amount = 2, chance = 1 },
            },

            info = BESTIARYINFO.GRASS_GATOR
        }
    },
    {
        scale = 0.25,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Eye of Terror",
                prefab = "eyeofterror",
                bank = "eyeofterror",
                build = "eyeofterror_basic",
                anim_idle = "idle",
                anim_action = "chomp",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 5000,
                    damage = 62.5,
                    speed = 15,
                    diet = "none",
        
                    drops = {
                        { prefab = "chesspiece_eyeofterror_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "eyemaskhat", amount = 1, chance = 1 },
                        { prefab = "milkywhites", amount = 3, chance = 1 },
                        { prefab = "milkywhites", amount = 2, chance = 0.5 },
                        { prefab = "monstermeat", amount = 2, chance = 1 },
                        { prefab = "monstermeat", amount = 2, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.EYEOFTERROR
                },

                form_override_fn = function(animstate, data)
                    animstate:Hide("ball_mouth")
                    animstate:Hide("mouth")
                    data.anim_action = "taunt"
                end
            },
            {
                name = "Eye of Terror",
                prefab = "eyeofterror",
                bank = "eyeofterror",
                build = "eyeofterror_basic",
                anim_idle = "idle",
                anim_action = "chomp",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 5000,
                    damage = 62.5,
                    speed = 18.75,
                    diet = "none",
        
                    drops = {
                        { prefab = "chesspiece_eyeofterror_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "eyemaskhat", amount = 1, chance = 1 },
                        { prefab = "milkywhites", amount = 3, chance = 1 },
                        { prefab = "milkywhites", amount = 2, chance = 0.5 },
                        { prefab = "monstermeat", amount = 2, chance = 1 },
                        { prefab = "monstermeat", amount = 2, chance = 0.5 },
                    },
        
                    info = BESTIARYINFO.EYEOFTERROR
                },

                form_override_fn = function(animstate, data)
                    animstate:Show("ball_mouth")
                    animstate:Show("mouth")
                    animstate:Hide("eye")
                    animstate:Hide("ball_eye")
                    data.anim_action = "chomp"
                end
            }
        }
    },
    {
        name = "Suspicious Peeper",
        prefab = "eyeofterror_mini",
        bank = "eyeofterror_mini",
        build = "eyeofterror_mini_mob_build",
        anim_idle = "idle_loop",
        anim_action = "atk",
        scale = 0.5,
        intent = STRINGS.BESTIARY_AGGRESSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        stats = {
            health = 200,
            damage = 20,
            speed = 4,
            diet = { "meat", "horrible" },
            drops = "none",
            info = BESTIARYINFO.PEEPER
        }
    },
    {
        scale = 0.25,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Retinazor",
                prefab = "twinofterror1",
                bank = "eyeofterror",
                build = "eyeofterror_twin1_build",
                anim_idle = "idle",
                anim_action = "chomp",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 10000,
                    damage = 125,
                    speed = "20-22",
                    diet = "none",
        
                    drops = {
                        { prefab = "chesspiece_twinsofterror_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "shieldofterror", amount = 1, chance = 1 },
                        { prefab = "yellowgem", amount = 1, chance = 1 },
                        { prefab = "gears", amount = 3, chance = 1 },
                        { prefab = "gears", amount = 2, chance = 0.5 },
                        { prefab = "transistor", amount = 2, chance = 1 },
                        { prefab = "transistor", amount = 1, chance = 0.75 },
                        { prefab = "nightmarefuel", amount = 2, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "trinket_6", amount = 1, chance = 1 },
                        { prefab = "trinket_6", amount = 1, chance = 0.5 },
                    },
                    
                    info = BESTIARYINFO.TWINOFTERROR1
                },

                form_override_fn = function(animstate, data)
                    animstate:Hide("ball_mouth")
                    animstate:Hide("mouth")
                    data.anim_action = "taunt"
                end
            },
            {
                name = "Retinazor",
                prefab = "twinofterror1",
                bank = "eyeofterror",
                build = "eyeofterror_twin1_build",
                anim_idle = "idle",
                anim_action = "chomp",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 7000,
                    damage = 125,
                    speed = "20-22",
                    diet = "none",
        
                    drops = {
                        { prefab = "chesspiece_twinsofterror_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "shieldofterror", amount = 1, chance = 1 },
                        { prefab = "yellowgem", amount = 1, chance = 1 },
                        { prefab = "gears", amount = 3, chance = 1 },
                        { prefab = "gears", amount = 2, chance = 0.5 },
                        { prefab = "transistor", amount = 2, chance = 1 },
                        { prefab = "transistor", amount = 1, chance = 0.75 },
                        { prefab = "nightmarefuel", amount = 2, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "trinket_6", amount = 1, chance = 1 },
                        { prefab = "trinket_6", amount = 1, chance = 0.5 },
                    },
                    
                    info = BESTIARYINFO.TWINOFTERROR1
                },

                form_override_fn = function(animstate, data)
                    animstate:Show("ball_mouth")
                    animstate:Show("mouth")
                    animstate:Hide("eye")
                    animstate:Hide("ball_eye")
                    data.anim_action = "chomp"
                end
            }
        }
    },
    {
        scale = 0.25,
        type = STRINGS.BESTIARY_BOSS,
        images = { grid_atlas = "images/monstergrid_bg_plain.xml", grid_image = "monstergrid_bg_plain.tex", atlas = "images/monster_bg_plain.xml", image = "monster_bg_plain.tex" },
        rotations = { FACING_DOWNRIGHT, FACING_RIGHT, FACING_UPRIGHT, FACING_UPLEFT, FACING_LEFT, FACING_DOWNLEFT },

        forms = {
            {
                name = "Spazmatism",
                prefab = "twinofterror2",
                bank = "eyeofterror",
                build = "eyeofterror_twin2_build",
                anim_idle = "idle",
                anim_action = "chomp",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 10000,
                    damage = 125,
                    speed = "23-25",
                    diet = "none",
        
                    drops = {
                        { prefab = "chesspiece_twinsofterror_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "shieldofterror", amount = 1, chance = 1 },
                        { prefab = "greengem", amount = 1, chance = 1 },
                        { prefab = "gears", amount = 3, chance = 1 },
                        { prefab = "gears", amount = 2, chance = 0.5 },
                        { prefab = "transistor", amount = 2, chance = 1 },
                        { prefab = "transistor", amount = 1, chance = 0.75 },
                        { prefab = "nightmarefuel", amount = 2, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "trinket_6", amount = 1, chance = 1 },
                        { prefab = "trinket_6", amount = 1, chance = 0.5 },
                    },
                    
                    info = BESTIARYINFO.TWINOFTERROR2
                },

                form_override_fn = function(animstate, data)
                    animstate:Hide("ball_mouth")
                    animstate:Hide("mouth")
                    data.anim_action = "taunt"
                end
            },
            {
                name = "Spazmatism",
                prefab = "twinofterror2",
                bank = "eyeofterror",
                build = "eyeofterror_twin2_build",
                anim_idle = "idle",
                anim_action = "chomp",
                intent = STRINGS.BESTIARY_AGGRESSIVE,
        
                stats = {
                    health = 7000,
                    damage = 125,
                    speed = "23-25",
                    diet = "none",
        
                    drops = {
                        { prefab = "chesspiece_twinsofterror_sketch", amount = 1, chance = 1, name_override = "sketch" },
                        { prefab = "shieldofterror", amount = 1, chance = 1 },
                        { prefab = "greengem", amount = 1, chance = 1 },
                        { prefab = "gears", amount = 3, chance = 1 },
                        { prefab = "gears", amount = 2, chance = 0.5 },
                        { prefab = "transistor", amount = 2, chance = 1 },
                        { prefab = "transistor", amount = 1, chance = 0.75 },
                        { prefab = "nightmarefuel", amount = 2, chance = 1 },
                        { prefab = "nightmarefuel", amount = 2, chance = 0.5 },
                        { prefab = "trinket_6", amount = 1, chance = 1 },
                        { prefab = "trinket_6", amount = 1, chance = 0.5 },
                    },
                    
                    info = BESTIARYINFO.TWINOFTERROR2
                },

                form_override_fn = function(animstate, data)
                    animstate:Show("ball_mouth")
                    animstate:Show("mouth")
                    animstate:Hide("eye")
                    animstate:Hide("ball_eye")
                    data.anim_action = "chomp"
                end
            }
        }
    },
    {
        name = "Pig King",
        prefab = "pigking",
        bank = "Pig_King", -- Wooooo... capitalized
        build = "Pig_King",
        anim_idle = "idle",
        anim_action = "unimpressed",
        scale = 0.3,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_deciduous.xml", grid_image = "monstergrid_bg_deciduous.tex", atlas = "images/monster_bg_deciduous.xml", image = "monster_bg_deciduous.tex" },

        stats = {
            health = 0,
            damage = 0,
            speed = 0,
            diet = { "meat", "horrible" },
            drops = "none",
            info = BESTIARYINFO.PIGKING
        }
    },
    {
        name = "Wobster",
        prefab = "wobster_sheller_land",
        bank = "lobster",
        build = "lobster_sheller",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.6,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_ocean.xml", grid_image = "monstergrid_bg_ocean.tex", atlas = "images/monster_bg_ocean.xml", image = "monster_bg_ocean.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 4,
            diet = "none",
            drops = {
                { prefab = "wobster_sheller_dead", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.WOBSTER
        }
    },
    {
        name = "Lunar Wobster",
        prefab = "wobster_moonglass_land",
        bank = "lobster",
        build = "lobster_moonglass",
        anim_idle = "idle",
        anim_action = "hit",
        scale = 0.6,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },

        stats = {
            health = 25,
            damage = 0,
            speed = 4,
            diet = "none",
            drops = {
                { prefab = "moonglass", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.WOBSTER_LUNAR
        }
    },
    {
        name = "Moon Moth",
        prefab = "moonbutterfly",
        bank = "butterfly",
        build = "butterfly_moon",
        anim_idle = "flight_cycle",
        anim_action = "idle_flight_loop",
        scale = 0.6,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_ANIMAL,
        images = { grid_atlas = "images/monstergrid_bg_lunar.xml", grid_image = "monstergrid_bg_lunar.tex", atlas = "images/monster_bg_lunar.xml", image = "monster_bg_lunar.tex" },

        stats = {
            health = 1,
            damage = 0,
            speed = 5,
            diet = "none",
            drops = {
                { prefab = "moonbutterflywings", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.BUTTERFLY_MOON
        }
    },
    {
        name = "King of The Merms",
        prefab = "mermking",
        bank = "merm_king",
        build = "merm_king",
        anim_idle = "idle",
        anim_action = "refuse",
        scale = 0.3,
        intent = STRINGS.BESTIARY_PASSIVE,
        type = STRINGS.BESTIARY_MONSTER,
        images = { grid_atlas = "images/monstergrid_bg_swamp.xml", grid_image = "monstergrid_bg_swamp.tex", atlas = "images/monster_bg_swamp.xml", image = "monster_bg_swamp.tex" },

        stats = {
            health = 1000,
            damage = 0,
            speed = 0,
            diet = { "veggies", "fish", "seeds" },
            drops = {
                { prefab = "fish", amount = 3, chance = 1 },
                { prefab = "kelp", amount = 2, chance = 1 },
                { prefab = "froglegs", amount = 1, chance = 1 }
            },

            info = BESTIARYINFO.MERMKING
        }
    }
}

return data