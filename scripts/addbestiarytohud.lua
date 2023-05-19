local BestiaryPopupScreen = require "widgets/bestiarypopupscreen"
local BestiaryButton = require "widgets/bestiarybutton"
local Text = require "widgets/text"

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
			TheFrontEnd:PopScreen(self.bestiaryscreen)
		end
		
		self.bestiaryscreen = nil
	end
end

local Inv = require("widgets/inventorybar")
local old_Inv_Rebuild = Inv.Rebuild
Inv.Rebuild = function(self, ...)
	old_Inv_Rebuild(self, ...)

	self.bestiarybutton = self.toprow:AddChild(BestiaryButton(self.owner))

	if _G.TheInput:ControllerAttached() then
		self.bestiarybutton:SetScale(1.3, 1.3)
		self.bestiarybutton:SetPosition(-830, -40)
		self.bestiarybutton:HideBackground()
	else
		self.bestiarybutton:SetScale(1.75, 1.75)
		self.bestiarybutton:SetPosition(-930, -20)
		self.bestiarybutton:ShowBackground()
	end
end

Inv.OpenBestiaryButton = function(self, ...)
	self.bestiarybutton:ScaleTo(1.3, 1.8, 0.2)
	self.bestiarybutton:MoveTo(_G.Vector3(-830, -40, 0), _G.Vector3(-850, 40, 0), 0.2)
	self.bestiarybutton.button.image:SetTexture(self.bestiarybutton.button.atlas, self.bestiarybutton.button.image_focus)

	if self.openbestiaryhint then
		self.openbestiaryhint:Kill()
	end

	self.openbestiaryhint = self.bestiarybutton:AddChild(Text(_G.UIFONT, 18))
    self.openbestiaryhint:SetRegionSize(300, 60)
	self.openbestiaryhint:SetString(_G.TheInput:GetLocalizedControl(_G.TheInput:GetControllerID(), _G.CONTROL_CONTROLLER_ALTACTION).." Open Bestiary")
end

Inv.CloseBestiaryButton = function(self, ...)
	self.bestiarybutton:ScaleTo(1.8, 1.3, 0.2)
	self.bestiarybutton:MoveTo(_G.Vector3(-850, 40, 0), _G.Vector3(-830, -40, 0), 0.2)
	self.bestiarybutton.button.image:SetTexture(self.bestiarybutton.button.atlas, self.bestiarybutton.button.image_normal)

	if self.openbestiaryhint then
		self.openbestiaryhint:Kill()
	end
end

local old_Inv_OpenControllerInventory = Inv.OpenControllerInventory
Inv.OpenControllerInventory = function(self, ...)
	old_Inv_OpenControllerInventory(self, ...)

	self:CancelScaleTo()
	self:ScaleTo(self.base_scale, self.selected_scale - 0.05, 0.2)

	local current_pos = self:GetPosition()
	self:MoveTo(current_pos, _G.Vector3(current_pos.x + 50, current_pos.y, current_pos.z), 0.2)

	for _, v in pairs(self.owner.HUD.controls.containers) do
		v:CancelScaleTo()
		v:ScaleTo(self.base_scale, self.selected_scale - 0.05, 0.2)
	end

	self:OpenBestiaryButton()
end

local old_Inv_CloseControllerInventory = Inv.CloseControllerInventory
Inv.CloseControllerInventory = function(self, ...)
	old_Inv_CloseControllerInventory(self, ...)

	self:CancelScaleTo()
	self:ScaleTo(self.selected_scale - 0.05, self.base_scale, 0.2)

	local current_pos = self:GetPosition()
	self:MoveTo(current_pos, _G.Vector3(current_pos.x - 50, current_pos.y, current_pos.z), 0.2)

	for _, v in pairs(self.owner.HUD.controls.containers) do
		v:CancelScaleTo()
		v:ScaleTo(self.selected_scale - 0.05, self.base_scale, 0.2)
	end

	self:CloseBestiaryButton()
end

local old_Inv_OnControl = Inv.OnControl
Inv.OnControl = function(self, control, down, ...)
    if Inv._base.OnControl(self, control, down) then
        return true
    elseif not self.open then
        return
    end

    if down then
        return
    end

    local active_item = self.owner.replica.inventory:GetActiveItem()

	if control == _G.CONTROL_CONTROLLER_ALTACTION and active_item == nil then
		self:CloseControllerInventory()
		self.bestiarybutton.onclick()
		return true
	end

	old_Inv_OnControl(self, ...)
end