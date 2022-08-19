local Screen = require "widgets/screen"
local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local BestiaryWidget = require "widgets/bestiarywidget"

local BestiaryPopupScreen = Class(Screen, function(self, owner)
    self.owner = owner
    Screen._ctor(self, "BestiaryPopupScreen")

    local black = self:AddChild(ImageButton("images/global.xml", "square.tex"))
    black.image:SetVRegPoint(ANCHOR_MIDDLE)
    black.image:SetHRegPoint(ANCHOR_MIDDLE)
    black.image:SetVAnchor(ANCHOR_MIDDLE)
    black.image:SetHAnchor(ANCHOR_MIDDLE)
    black.image:SetScaleMode(SCALEMODE_FILLSCREEN)
    black.image:SetTint(0, 0, 0, 0.5)
    black:SetOnClick(function() TheFrontEnd:PopScreen() end)
    black:SetHelpTextMessage("")

	local root = self:AddChild(Widget("root"))
	root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    root:SetHAnchor(ANCHOR_MIDDLE)
    root:SetVAnchor(ANCHOR_MIDDLE)

	self.book = root:AddChild(BestiaryWidget(self.owner))

	self.default_focus = self.book

    SetAutopaused(true)
end)

function BestiaryPopupScreen:OnDestroy()
    SetAutopaused(false)

    POPUPS.BESTIARY:Close(self.owner)
	BestiaryPopupScreen._base.OnDestroy(self)
end

function BestiaryPopupScreen:OnBecomeInactive()
    BestiaryPopupScreen._base.OnBecomeInactive(self)
end

function BestiaryPopupScreen:OnBecomeActive()
    BestiaryPopupScreen._base.OnBecomeActive(self)
end

function BestiaryPopupScreen:OnControl(control, down)
    if BestiaryPopupScreen._base.OnControl(self, control, down) then
		return true
	end

    if not down and (control == CONTROL_MAP or control == CONTROL_CANCEL) then
		self.owner.SoundEmitter:PlaySound("dontstarve/common/use_book")
        TheFrontEnd:PopScreen()
		
        return true
    end

	return false
end

return BestiaryPopupScreen