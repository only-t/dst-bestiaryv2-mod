local BestiaryPopupScreen = require("widgets/bestiarypopupscreen")

AddClassPostConstruct("screens/playerhud", function(playerhud)
	playerhud.CloseBestiaryScreen = function(self)
		if self.bestiaryscreen then
			if self.bestiaryscreen.inst:IsValid() then
				GLOBAL.TheFrontEnd:PopScreen(self.bestiaryscreen)
			end
			
			self.bestiaryscreen = nil
		end
	end
	
	playerhud.OpenBestiaryScreen = function(self)
		self:CloseBestiaryScreen()
		self.bestiaryscreen = BestiaryPopupScreen(self.owner)
		self:OpenScreenUnderPause(self.bestiaryscreen)
		
		return true
	end
end)