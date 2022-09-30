AddModRPCHandler("󰀈 Bestiary 󰀈", "open_bestiary", function(player)
    if player.sg and not player.sg:HasStateTag("busy") then
        player.sg:GoToState("bestiary_open")
    end
end)