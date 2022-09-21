local Widget = require "widgets/widget"
local ImageButton = require("widgets/imagebutton")

local BestiaryButton = Class(Widget, function(self, owner)
    Widget._ctor(self, "BestiaryPopupScreen")

    self.owner = owner

    local scale = 0.4

    self.button = self:AddChild(ImageButton("images/bestiarybutton.xml", "button.tex", "buttonfocus.tex"))
    self.button.image:SetScale(0.4)
    self.button.normal_scale = { scale, scale, scale }
    self.button.focus_scale = { scale + 0.05, scale + 0.05, scale + 0.05 }

    self.button.ongainfocus = function()
        self.button.image:SetScale(self.button.focus_scale[1], self.button.focus_scale[2], self.button.focus_scale[3])
    end

    self.button.onlosefocus = function()
        self.button.image:SetScale(self.button.normal_scale[1], self.button.normal_scale[2], self.button.normal_scale[3])
    end

    self.button:SetOnClick(function()
        SendModRPCToServer(GetModRPC("󰀈 Bestiary 󰀈", "open_bestiary"))
    end)
end)

return BestiaryButton