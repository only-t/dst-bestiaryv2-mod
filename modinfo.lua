name = "󰀈 Bestiary 󰀈"
description = [[The Bestiary adds a new book to Don't Starve Together with all the information of the different creatues of The Constant!

If you want to have all the information from the start disable Discoverable Mobs in the configurations!
If you want to be able to open the bestiary without using the book disable Bestiary as an Item in the configurations!

Current version: 2.0.0 󰀔
- ONLY IF [API] Mods In Menu IS ENABLED: Added the Bestiary to the main manu (located in the Compendium)
]]
author = "-т-"
version = "1.2.0"
forumthread = "forums/topic/137812-the-bestiary-mod-full-release"
icon_atlas = "icon.xml"
icon = "icon.tex"
client_only_mod = false
all_clients_require_mod = true
dst_compatible = true
dont_starve_compatible = false
priority = -99999999
api_version = 10

configuration_options = {
    {
        name = "Discoverable Mobs",
        options = {
            { description = "Yes", data = true },
            { description = "No", data = false }
        },

        default = true,
    },
    {
        name = "Autopause Bestiary",
        options = {
            { description = "Yes", data = true },
            { description = "No", data = false }
        },

        default = true,
    },
}