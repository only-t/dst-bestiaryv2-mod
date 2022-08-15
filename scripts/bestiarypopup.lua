AddPopup("BESTIARY")

GLOBAL.POPUPS.BESTIARY.fn = function(inst, show)
    if inst.HUD then
        if not show then
            inst.HUD:CloseBestiaryScreen()
        elseif not inst.HUD:OpenBestiaryScreen() then
            GLOBAL.POPUPS.BESTIARY:Close(inst)
        end
    end
end