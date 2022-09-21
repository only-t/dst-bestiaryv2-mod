local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local Text = require "widgets/text"

local BestiaryButton = Class(Widget, function(self, owner)
    Widget._ctor(self, "BestiaryPopupScreen")

    self.owner = owner

    local scale = 0.4

    self.button = self:AddChild(ImageButton("images/bestiarybutton.xml", "button.tex", "buttonfocus.tex"))
    self.button:SetPosition(0, 30, 0)
    self.button.image:SetScale(0.4)
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
        SendModRPCToServer(GetModRPC("󰀈 Bestiary 󰀈", "open_bestiary"))
    end)

    self.banner = self:AddChild(Widget("banner"))
    self.banner:SetScale(0.5, 0.5, 0.5)

    self.banner.left = self.banner:AddChild(Image("images/crafting_menu.xml", "page_bg.tex"))
    self.banner.left:SetScale(-1, 1, 1)

    self.banner.right = self.banner:AddChild(Image("images/crafting_menu.xml", "page_bg.tex"))
    self.banner.right:SetScale(1, 1, 1)

    local w, h = self.banner.right:GetScaledSize()
    self.banner.left:SetPosition(-w/2, 0, 0)
    self.banner.right:SetPosition(w/2, 0, 0)

    self.banner.text = self.banner:AddChild(Text(HEADERFONT, 36, "Bestiary", UICOLOURS.WHITE))
end)

return BestiaryButton