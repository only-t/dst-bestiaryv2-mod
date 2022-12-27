local Screen = require "widgets/screen"
local Image = require "widgets/image"
local BestiaryPage = require "widgets/bestiarypage"

local BestiaryPopupScreen = Class(Screen, function(self, owner)
    Screen._ctor(self, "BestiaryPopupScreen")
    
    self.owner = owner

    self.page = self:AddChild(Image("images/bestiary_page_bg.xml", "bestiary_page_bg.tex"))
    self.page:SetScaleMode(SCALEMODE_FILLSCREEN)
    self.page:SetVRegPoint(ANCHOR_MIDDLE)
    self.page:SetHRegPoint(ANCHOR_MIDDLE)
    self.page:SetVAnchor(ANCHOR_MIDDLE)
    self.page:SetHAnchor(ANCHOR_MIDDLE)

    self.bestiary = self:AddChild(BestiaryPage(self.owner, self.page))
    self.bestiary:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.bestiary:SetVAnchor(ANCHOR_MIDDLE)
    self.bestiary:SetHAnchor(ANCHOR_MIDDLE)

    local sw, sh = self.page:GetScaledSize()
    self.page:MoveTo(Vector3(0, -sh, 0), Vector3(0, 0, 0), 0.4)

	self.default_focus = self.bestiary
    
    -- SetAutopaused(true)
end)

function BestiaryPopupScreen:OnDestroy()
    POPUPS.BESTIARY:Close(self.owner)

    -- SetAutopaused(false)

    local sw, sh = self.page:GetScaledSize()
    self.bestiary:Close(sh)
    self.page:MoveTo(Vector3(0, 0, 0), Vector3(0, -sh, 0), 0.4, function()
        self:Kill()
    end)
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