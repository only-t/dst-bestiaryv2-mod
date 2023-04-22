AddPopup("BESTIARY")

_G.POPUPS.BESTIARY.fn = function(inst, show)
    if inst.HUD then
        if not show then
            inst.HUD:CloseBestiaryScreen()
        elseif not inst.HUD:OpenBestiaryScreen() then
            _G.POPUPS.BESTIARY:Close(inst)
        end
    end
end