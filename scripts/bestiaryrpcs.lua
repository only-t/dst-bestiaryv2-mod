AddModRPCHandler("󰀈 Bestiary 󰀈", "OpenBestiary", function(player)
    if player and (player.components.health == nil or not player.components.health:IsDead()) then
        player.components.bestiaryuser:OpenBestiary()
    end
end)

AddClientModRPCHandler("󰀈 Bestiary 󰀈", "SyncBestiaryOnClient", function()
    if _G.ThePlayer and _G.ThePlayer.bestiary then
        _G.ThePlayer.bestiary:ReadBestiaryData()
    end
end)