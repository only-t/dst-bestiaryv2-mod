AddModRPCHandler("󰀈 Bestiary 󰀈", "OpenBestiary", function(player)
    if player.sg and not player.sg:HasStateTag("busy") then
        player.sg:GoToState("bestiary_open")
    end
end)

AddClientModRPCHandler("󰀈 Bestiary 󰀈", "SyncBestiaryOnClient", function()
    if _G.ThePlayer and _G.ThePlayer.bestiary then
        _G.ThePlayer.bestiary:ReadBestiaryData()
    end
end)