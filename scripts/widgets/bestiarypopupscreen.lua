local Screen = require "widgets/screen"
local Image = require "widgets/image"

local BestiaryPopupScreen = Class(Screen, function(self, owner)
    Screen._ctor(self, "BestiaryPopupScreen")
    
    self.owner = owner

    local page = self:AddChild(Image("images/bestiary_page.xml", "bestiary_page.tex"))
    page:SetVRegPoint(ANCHOR_MIDDLE)
    page:SetHRegPoint(ANCHOR_MIDDLE)
    page:SetVAnchor(ANCHOR_MIDDLE)
    page:SetHAnchor(ANCHOR_MIDDLE)
    page:SetScaleMode(SCALEMODE_FILLSCREEN)

	self.default_focus = self.book
end)

function BestiaryPopupScreen:OnDestroy()
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
        TheFrontEnd:PopScreen()
		
        return true
    end

	return false
end

return BestiaryPopupScreen