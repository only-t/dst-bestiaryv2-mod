local BestiaryPopupScreen = require "widgets/bestiarypopupscreen"
local Widget = require "widgets/widget"
local BestiaryButton = require "widgets/bestiarybutton"

local PlayerHud = require("screens/playerhud")
PlayerHud.OpenBestiaryScreen = function(self)
	self:CloseBestiaryScreen()
	self.bestiaryscreen = BestiaryPopupScreen(self.owner)
	self:OpenScreenUnderPause(self.bestiaryscreen)
	
	return true
end

PlayerHud.CloseBestiaryScreen = function(self)
	if self.bestiaryscreen then
		if self.bestiaryscreen.inst:IsValid() then
			_G.TheFrontEnd:PopScreen(self.bestiaryscreen)
		end
		
		self.bestiaryscreen = nil
	end
end

local PlayerHud = require("screens/playerhud")
local old_PlayerHud_ctor = PlayerHud._ctor
PlayerHud._ctor = function(self, ...)
	old_PlayerHud_ctor(self, ...)

	if _G.TheNet:GetServerGameMode() ~= "lavaarena" and _G.TheNet:GetServerGameMode() ~= "quagmire" then
		self.bottomleft_root = self:AddChild(Widget("bottomleft"))
		self.bottomleft_root:SetScaleMode(_G.SCALEMODE_PROPORTIONAL)
		self.bottomleft_root:SetHAnchor(_G.ANCHOR_LEFT)
		self.bottomleft_root:SetVAnchor(_G.ANCHOR_BOTTOM)
		self.bottomleft_root:SetMaxPropUpscale(_G.MAX_HUD_SCALE)
		self.bottomleft_root = self.bottomleft_root:AddChild(Widget("br_scale_root"))
		self.bottomleft_root:SetScale(_G.TheFrontEnd:GetHUDScale())

		self.bestiarybutton = self.bottomleft_root:AddChild(BestiaryButton(self.owner))
		self.bestiarybutton:SetPosition(90, 45, 0)
	end
end

local old_PlayerHud_SetHUDSize = PlayerHud.SetHUDSize
PlayerHud.SetHUDSize = function(self, ...)
	self.bottomleft_root:SetScale(_G.TheFrontEnd:GetHUDScale())

	old_PlayerHud_SetHUDSize(self, ...)
end