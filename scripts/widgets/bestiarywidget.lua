local Image = require "widgets/image"
local Widget = require "widgets/widget"
local BestiaryPage = require "widgets/bestiarypage"

require("util")

local BestiaryWidget = Class(Widget, function(self, owner)
    Widget._ctor(self, "BestiaryWidget")

    self.root = self:AddChild(Widget("root"))
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetVAnchor(ANCHOR_TOP)
    self.root:SetMaxPropUpscale(MAX_HUD_SCALE)

    self.root.book_background = self.root:AddChild(Image("images/bestiary_book_cover.xml", "bestiary_book_cover.tex"))
    self.root.book_background:SetScale(1.2, 1.2)
    self.root.book_background:SetPosition(0, -400)

    self.root.book_background.page = self.root.book_background:AddChild(BestiaryPage(owner))
end)

return BestiaryWidget