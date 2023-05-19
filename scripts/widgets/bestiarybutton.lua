local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"

local BestiaryButton = Class(Widget, function(self, owner)
    Widget._ctor(self, "BestiaryPopupScreen")

    self.owner = owner
    self.onclick = function() self.button.onclick() end

    self.bg = self:AddChild(Image("images/hud.xml", "craft_slot.tex"))
    self.bg:SetScale(1, 1.6, 1)
    self.bg:SetPosition(0, 20, 0)

    local scale = 0.4

    self.button = self:AddChild(ImageButton("images/bestiarybutton.xml", "button.tex", "buttonfocus.tex"))
    self.button:SetPosition(0, 30, 0)
    self.button.image:SetScale(scale)
    self.button.normal_scale = { scale, scale, scale }
    self.button.focus_scale = { scale + 0.05, scale + 0.05, scale + 0.05 }

    self.button.ongainfocus = function()
        self.button.image:SetScale(self.button.focus_scale[1], self.button.focus_scale[2], self.button.focus_scale[3])
        self.button:SetPosition(0, 35, 0)
    end

    self.button.onlosefocus = function()
        self.button.image:SetScale(self.button.normal_scale[1], self.button.normal_scale[2], self.button.normal_scale[3])
        self.button:SetPosition(0, 30, 0)
    end

    self.button:SetOnClick(function()
        SendModRPCToServer(GetModRPC("󰀈 Bestiary 󰀈", "OpenBestiary"))

        local act = BufferedAction(self.onwer, nil, ACTIONS.OPEN_BESTIARY)
        self.owner.components.locomotor:PreviewAction(act, true)
    end)
end)

function BestiaryButton:ShowBackground()
    self.bg:Show()
end

function BestiaryButton:HideBackground()
    self.bg:Hide()
end
return BestiaryButton