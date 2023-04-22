AddModRPCHandler("󰀈 Bestiary 󰀈", "OpenBestiary", function(player)
    if player.sg and not player.sg:HasStateTag("busy") then
        player.sg:GoToState("bestiary_open")
    end
end)

local MOB_DATA_NAMES = { "name", "health", "damage", "walkspeed", "runspeed" }
AddClientModRPCHandler("󰀈 Bestiary 󰀈", "DiscoverMob", function(...)
    -- The variable number of arguments should always be in this order:
    -- 1. name
    -- 2. health
    -- 3. damage
    -- 4. walkspeed
    -- 5. runspeed
    -- ...
    -- { "name", "health", "damage", "walkspeed", "runspeed" }

    local mob_data = {  }
    for i, data in ipairs(arg) do
        mob_data[MOB_DATA_NAMES[i]] = data
    end

    if _G.ThePlayer and _G.ThePlayer.bestiary then
        _G.ThePlayer.bestiary:DiscoverMob(mob_data)
    end
end)