local BestiaryPopupScreen = require("widgets/bestiarypopupscreen")
local BestiaryButton = require("widgets/bestiarybutton")
local Widget = require("widgets/widget")

AddClassPostConstruct("screens/playerhud", function(class)
	class.CloseBestiaryScreen = function(self)
		if self.bestiaryscreen then
			if self.bestiaryscreen.inst:IsValid() then
				GLOBAL.TheFrontEnd:PopScreen(self.bestiaryscreen)
			end
			
			self.bestiaryscreen = nil
		end
	end
	
	class.OpenBestiaryScreen = function(self)
		self:CloseBestiaryScreen()
		self.bestiaryscreen = BestiaryPopupScreen(self.owner)
		self:OpenScreenUnderPause(self.bestiaryscreen)
		
		return true
	end
end)

AddClassPostConstruct("widgets/controls", function(class)
	if GLOBAL.TheNet:GetServerGameMode() ~= "lavaarena" and GLOBAL.TheNet:GetServerGameMode() ~= "quagmire" then
		class.bottomleft_root = class:AddChild(Widget("bottomleft"))
		class.bottomleft_root:SetScaleMode(GLOBAL.SCALEMODE_PROPORTIONAL)
		class.bottomleft_root:SetHAnchor(GLOBAL.ANCHOR_LEFT)
		class.bottomleft_root:SetVAnchor(GLOBAL.ANCHOR_BOTTOM)
		class.bottomleft_root:SetMaxPropUpscale(GLOBAL.MAX_HUD_SCALE)

		class.bottomleft_root = class.bottomleft_root:AddChild(Widget("br_scale_root"))

		class.bestiarybutton = class.bottomleft_root:AddChild(BestiaryButton(class.owner))
		class.bestiarybutton:SetPosition(135, 50, 0)
	end

	local old_SetHUDSize = class.SetHUDSize
	class.SetHUDSize = function(self)
		self.bottomleft_root:SetScale(GLOBAL.TheFrontEnd:GetHUDScale())

		old_SetHUDSize(self)
	end
end)