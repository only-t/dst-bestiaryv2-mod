local BestiaryPopupScreen = require "widgets/bestiarypopupscreen"
local Widget = require "widgets/widget"
local BestiaryButton = require "widgets/bestiarybutton"

AddClassPostConstruct("screens/playerhud", function(class)
	class.CloseBestiaryScreen = function(class)
		if class.bestiaryscreen then
			if class.bestiaryscreen.inst:IsValid() then
				_G.TheFrontEnd:PopScreen(class.bestiaryscreen)
			end
			
			class.bestiaryscreen = nil
		end
	end
	
	class.OpenBestiaryScreen = function(class)
		class:CloseBestiaryScreen()
		class.bestiaryscreen = BestiaryPopupScreen(class.owner)
		class:OpenScreenUnderPause(class.bestiaryscreen)
		
		return true
	end
end)

AddClassPostConstruct("widgets/controls", function(class)
	if _G.TheNet:GetServerGameMode() ~= "lavaarena" and _G.TheNet:GetServerGameMode() ~= "quagmire" then
		class.bottomleft_root = class:AddChild(Widget("bottomleft"))
		class.bottomleft_root:SetScaleMode(_G.SCALEMODE_PROPORTIONAL)
		class.bottomleft_root:SetHAnchor(_G.ANCHOR_LEFT)
		class.bottomleft_root:SetVAnchor(_G.ANCHOR_BOTTOM)
		class.bottomleft_root:SetMaxPropUpscale(_G.MAX_HUD_SCALE)
		class.bottomleft_root = class.bottomleft_root:AddChild(Widget("br_scale_root"))
		class.bottomleft_root:SetScale(_G.TheFrontEnd:GetHUDScale())

		class.bestiarybutton = class.bottomleft_root:AddChild(BestiaryButton(class.owner))
		class.bestiarybutton:SetPosition(90, 45, 0)
	end

	local old_SetHUDSize = class.SetHUDSize
	class.SetHUDSize = function(class)
		class.bottomleft_root:SetScale(_G.TheFrontEnd:GetHUDScale())

		old_SetHUDSize(class)
	end
end)