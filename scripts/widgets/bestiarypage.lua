local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local Image = require "widgets/image"
local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local TrueScrollArea = require "widgets/truescrollarea"
local TEMPLATES = require "widgets/redux/templates"

local BestiaryMonstersPage = Class(Widget, function(self, owner, parentpage)
	Widget._ctor(self, "BestiaryMonstersPage")

	self.owner = owner
	self.parentw, self.parenth = parentpage:GetScaledSize()

	self.mobgrid_root = self:AddChild(Widget("mobgrid"))
    self.mobgrid_root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.mobgrid_root:SetVAnchor(ANCHOR_MIDDLE)
    self.mobgrid_root:SetHAnchor(ANCHOR_LEFT)

	local old_OnWallUpdate = self.mobgrid_root.inst.components.uianim.OnWallUpdate
	self.mobgrid_root.inst.components.uianim.OnWallUpdate = function(component, dt)
		if not component.inst:IsValid() then
			component.inst:StopWallUpdatingComponent(component)

			return
		end

		old_OnWallUpdate(component, dt)

		if component.pos_t then
			self.mobgrid_root.grid:RefreshView()
		end
	end

	self.mobgrid_root.grid = self.mobgrid_root:AddChild(self:CreateMonsterGrid())

	local grid_w, grid_h = self.mobgrid_root.grid:GetScrollRegionSize()
	self.mobgrid_root.grid:SetScale(0.7, 0.7)
	self.mobgrid_root.grid:SetPosition(grid_w/2 - 40, -40, 0)

	self.parent_default_focus = self.mobgrid_root.grid
	self.focus_forward = self.mobgrid_root.grid

	self.mobinfo_root_xoffset = -340
	self.mobinfo_root = self:AddChild(Widget("mobinfo_root"))
    self.mobinfo_root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.mobinfo_root:SetVAnchor(ANCHOR_MIDDLE)
    self.mobinfo_root:SetHAnchor(ANCHOR_RIGHT)

	self.mobinfo_root.bg_decor = self.mobinfo_root:AddChild(Image("images/bestiary_mobinfo_bg.xml", "basic_unknown.tex"))
	self.mobinfo_root.bg_decor:SetPosition(self.mobinfo_root_xoffset + 10, 0, 0)
	self.mobinfo_root.bg_decor:ScaleToSize(128, 128)
	self.mobinfo_root.bg_decor:SetTint(1, 1, 1, 0.8)

	local outline_decor = self.mobinfo_root:AddChild(Image("images/options.xml", "panel_frame.tex"))
	outline_decor:SetPosition(self.mobinfo_root_xoffset + 20, 0, 0)
	outline_decor:SetSize(740, 600)
	outline_decor:SetRotation(90)

	self:Open()
end)

function BestiaryMonstersPage:CreateMonsterGrid()
	local width = 150
	local height = 150
	local mob_scale = 0.35
	local cell_scale = 0.9
	
	local function ScrollWidgetsCtor(context, index)
        local w = Widget("mob-cell-"..index)

		w.cell_root = w:AddChild(Widget("cell_root"))
		w.cell_root:SetScale(0.85, 0.85)

		w.cell_root.bg = w.cell_root:AddChild(ImageButton("images/mob_cellbasicbg.xml", "mob_cellbasicbg.tex"))
		w.cell_root.bg:SetScale(cell_scale, cell_scale, cell_scale)
		w.cell_root.bg.normal_scale = nil
		w.cell_root.bg.focus_scale = nil

		w.cell_root.mob_root = w.cell_root.bg:AddChild(Widget("mob_root"))
		w.cell_root.mob_root.mob = w.cell_root.mob_root:AddChild(UIAnim())
		w.cell_root.mob_root.mob:SetScale(mob_scale, mob_scale, mob_scale)
		w.cell_root.mob_root.mob:SetClickable(false)

		local cell_w, cell_h = w.cell_root.bg.image:GetSize()
		w.cell_root.mob_root.mob:SetPosition(0, -cell_h/3, 0)

		w.cell_root.bg.rim = w.cell_root.bg:AddChild(Image("images/mob_cellrim.xml", "mob_cellrim_normal.tex"))
		w.cell_root.bg.rim:SetClickable(false)

		w.cell_root.bg:SetOnClick(function()
			self:OpenNewMobInfo(w.data)

			w.cell_root.bg.pointer:SetPosition(50, -60, 0)
			w.cell_root.bg.pointer:SetRotation(110)
		end)
	
		w.cell_root.bg:SetOnGainFocus(function()
			self.mobgrid_root.grid:OnWidgetFocus(w)
			w.cell_root.mob_root.mob:GetAnimState():Resume()

			w.cell_root.bg.rim:SetTexture("images/mob_cellrim.xml", "mob_cellrim_focus.tex")

			if w.cell_root.bg.pointer == nil then
				w.cell_root.bg.pointer = w.cell_root.bg:AddChild(Image("images/bestiary_pointer.xml", "bestiary_pointer.tex"))
				w.cell_root.bg.pointer:SetScale(1.3, 1.3)
				w.cell_root.bg.pointer:SetRotation(130)

				w.cell_root.bg.pointer:MoveTo(Vector3(70, -80, 0), Vector3(50, -60, 0), 0.1)
				w.cell_root.bg.pointer:RotateTo(130, 110, 0.1)
				w.cell_root.bg.pointer:TintTo({ r = 1, g = 1, b = 1, a = 0 }, { r = 1, g = 1, b = 1, a = 1 }, 0.1)
			else
				w.cell_root.bg.pointer:CancelMoveTo()
				w.cell_root.bg.pointer:CancelRotateTo()
				w.cell_root.bg.pointer:CancelTintTo()
				w.cell_root.bg.pointer:MoveTo(w.cell_root.bg.pointer:GetPosition(), Vector3(50, -60, 0), 0.1)
				w.cell_root.bg.pointer:RotateTo(130, 110, 0.1)
				w.cell_root.bg.pointer:TintTo({ r = 1, g = 1, b = 1, a = 0 }, { r = 1, g = 1, b = 1, a = 1 }, 0.1)
			end
		end)

		w.cell_root.bg:SetOnLoseFocus(function()
			if w.data then
				w.cell_root.mob_root.mob:GetAnimState():PlayAnimation(w.data.anim_idle or w.data.forms[1].anim_idle, true)
				w.cell_root.mob_root.mob:GetAnimState():Pause()
			end

			w.cell_root.bg.rim:SetTexture("images/mob_cellrim.xml", "mob_cellrim_normal.tex")

			if w.cell_root.bg.pointer then
				w.cell_root.bg.pointer:CancelMoveTo()
				w.cell_root.bg.pointer:MoveTo(w.cell_root.bg.pointer:GetPosition(), Vector3(70, -80, 0), 0.1, function()
					w.cell_root.bg.pointer:Kill()
					w.cell_root.bg.pointer = nil
				end)
				
				w.cell_root.bg.pointer:CancelRotateTo()
				w.cell_root.bg.pointer:RotateTo(110, 130, 0.1)
				
				w.cell_root.bg.pointer:CancelTintTo()
				w.cell_root.bg.pointer:TintTo({ r = 1, g = 1, b = 1, a = 1 }, { r = 1, g = 1, b = 1, a = 0 }, 0.1)
			end
		end)

		w.cell_root.bg:SetOnDown(function()
			w.cell_root.bg.pointer:CancelMoveTo()
			w.cell_root.bg.pointer:CancelRotateTo()
			w.cell_root.bg.pointer:CancelTintTo()

			w.cell_root.bg.pointer:SetPosition(45, -50, 0)
			w.cell_root.bg.pointer:SetTint(1, 1, 1, 1)
			w.cell_root.bg.pointer:SetRotation(100)
		end)

		w.focus_forward = w.cell_root.bg
		w.cell_root.focus_forward = w.cell_root.bg

		return w
    end

	local function ScrollWidgetSetData(context, w, data, index)
		w.data = data

		if w.data then
			w.cell_root.bg:Show()
			w.cell_root.mob_root.mob:Show()

			w.cell_root.mob_root.mob:GetAnimState():SetBank(data.bank or data.forms[1].bank)
			w.cell_root.mob_root.mob:GetAnimState():SetBuild(data.build or data.forms[1].build)
			w.cell_root.mob_root.mob:GetAnimState():PlayAnimation(data.anim_idle or data.forms[1].anim_idle, true)
			w.cell_root.mob_root.mob:GetAnimState():Pause()

			w:Enable()
		else
			w.cell_root.bg:Hide()
			w.cell_root.mob_root.mob:Hide()

			w:Disable()
		end
    end

	local grid = TEMPLATES.ScrollingGrid(
		require("monsterinfo"),
		{
			context = {  },
			widget_width = width,
			widget_height = height,
			peek_percent = 0,
			allow_bottom_empty_row = true,
			num_visible_rows = 5,
			num_columns = 5,
			item_ctor_fn = ScrollWidgetsCtor,
			apply_fn = ScrollWidgetSetData,
			scrollbar_offset = 40,
			scrollbar_height_offset = -30
		}
	)

	grid.up_button:SetTextures("images/plantregistry.xml", "nutrient_neutral.tex")
	grid.up_button:SetScale(1)
	grid.up_button:Nudge(Vector3(0, -25, 0))

	grid.down_button:SetTextures("images/plantregistry.xml", "nutrient_neutral.tex")
	grid.down_button:SetScale(-1)
	grid.down_button:Nudge(Vector3(0, 25, 0))

	grid.scroll_bar_line:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex")
	grid.scroll_bar_line:SetScale(1, 1.7)

	grid.position_marker:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker.image:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker:SetScale(1)

	local grid_w, grid_h = grid:GetScrollRegionSize()
	local grid_boarder = grid:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
    grid_boarder:SetPosition(20, grid_h/2 + 2)
	grid_boarder:SetScale(1.5, 1.3)
	grid_boarder = grid:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
	grid_boarder:SetPosition(20, -grid_h/2 - 2)
	grid_boarder:SetScale(1.5, -1.3)

	grid.decor = grid:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_block.tex"))
	grid.decor:ScaleToSize(grid_w + 20, grid_h + 6)
	grid.decor:MoveToBack()

	local old_RefreshView = grid.RefreshView
	grid.RefreshView = function(self)
		old_RefreshView(self)

		for i = 1, self.items_per_view do
			local cellimagew, cellimageh = self.widgets_to_update[i].cell_root.bg.image:GetSize()
			local scroll_percent = self.current_scroll_pos%1
			local hoffset = 1 - math.clamp(scroll_percent + (-(1 - cell_scale) + (1 - cell_scale)*2*scroll_percent), 0, 1)

			if i >= 1 and i <= 5 then
				local x = -cellimagew/2
				local y = -cellimageh/2
				local w = cellimagew
				local h = cellimageh*hoffset

				self.widgets_to_update[i].cell_root.mob_root:SetScissor(x, y, w, h)
			elseif i >= 26 and i <= 30 then
				local x = -cellimagew/2
				local y = -cellimageh/2 + cellimageh*hoffset
				local w = cellimagew
				local h = cellimageh*(1 - hoffset)

				self.widgets_to_update[i].cell_root.mob_root:SetScissor(x, y, w, h)
			elseif i >= 31 and i <= 35 and self.current_scroll_pos < self.end_pos - 1 then
				self.widgets_to_update[i].cell_root.mob_root:SetScissor(0, 0, 0, 0)
			else
				local x = -cellimagew/2
				local y = -cellimageh/2
				local w = cellimagew
				local h = cellimageh

				self.widgets_to_update[i].cell_root.mob_root:SetScissor(x, y, w, h)
			end
		end
	end

	return grid
end

local function CreateMobCell(width, height)
	local root = Widget("mob_cell_root")

	local page_decor = root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_block.tex"))
	page_decor:SetPosition(0, 0, 0)
	page_decor:SetScale(1.6, 0.85)

	root.mob_bg = root:AddChild(Image("images/bestiary_mob_bg.xml", "bestiary_mob_bg.tex"))
	root.mob_bg:SetPosition(3, -50, 0)
	root.mob_bg:SetScale(0.8, 1)

	root.mob = root:AddChild(UIAnim())
	root.mob:SetPosition(0, -170, 0)
	root.mob:SetClickable(false)

	local mobframe = root:AddChild(Image("images/bestiary_mobframe.xml", "bestiary_mobframe.tex"))
	mobframe:SetPosition(0, -50, 0)
	mobframe:SetScale(0.8, 1)

	local w, h = page_decor:GetSize()
	root.cell_height = h

	local details_decor = root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_corner_decoration.tex"))
	details_decor:SetPosition(-300, 200)
	details_decor:SetScale(1, -1)
	details_decor = root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_corner_decoration.tex"))
	details_decor:SetPosition(300, 200)
	details_decor:SetScale(-1, -1)

	local decor_line = root:AddChild(Image("images/ui.xml", "line_horizontal_white.tex"))
    decor_line:SetTint(unpack(BROWN))
	decor_line:SetPosition(0, h/2 - 160, 0)
	decor_line:ScaleToSize(500, 5)

	root.mobname = root:AddChild(Text(TALKINGFONT_WORMWOOD, 86, nil, UICOLOURS.WHITE))
	root.mobname:SetPosition(0, h/2 - 135, 0)

	return root
end

local function CreateMobPage(self) -- Work on proper scroll and display
	self.mobinfo_root.mobinfopage = self.mobinfo_root:AddChild(Image("images/mobinfopage.xml", "mobinfopage.tex"))
	self.mobinfo_root.mobinfopage:SetScale(0.68, 0.6)

	local page_info = Widget("page_info")

	local width = 800
	local height = 0
	local padding = 5
	local max_visible_height = 1100
	local section_space = 30
	
	local mob_cell = page_info:AddChild(CreateMobCell(width, height))
	mob_cell:SetPosition(width/2, height - mob_cell.cell_height/2 + 20, 0)
	height = height - mob_cell.cell_height - section_space + 20

	local decor_line = page_info:AddChild(Image("images/ui.xml", "line_horizontal_white.tex"))
    decor_line:SetTint(unpack(BROWN))
	decor_line:SetPosition(width/2, height + 30, 0)
	decor_line:ScaleToSize(800, 5)
	height = height - section_space + 30

	-- Health Damage Speed --

	local separation_dist = 233
	local badge_size = 150

	local health = page_info:AddChild(Image("images/global_redux.xml", "status_health.tex"))
	health:SetPosition(width/2 - separation_dist, height - badge_size/2, 0)
	health:ScaleToSize(badge_size, badge_size)
	
	local damage = page_info:AddChild(Image("images/global_redux.xml", "status_health.tex"))
	damage:SetPosition(width/2, height - badge_size/2, 0)
	damage:ScaleToSize(badge_size, badge_size)

	local speed = page_info:AddChild(Image("images/global_redux.xml", "status_health.tex"))
	speed:SetPosition(width/2 + separation_dist, height - badge_size/2, 0)
	speed:ScaleToSize(badge_size, badge_size)
	height = height - badge_size - section_space


	local health_value = page_info:AddChild(Text(HEADERFONT, 96, nil, UICOLOURS.BROWN_DARK))
	local w, h = health_value:GetRegionSize()
	health_value:SetPosition(width/2 - separation_dist, height - h/2, 0)

	local damage_value = page_info:AddChild(Text(HEADERFONT, 96, nil, UICOLOURS.BROWN_DARK))
	local w, h = damage_value:GetRegionSize()
	damage_value:SetPosition(width/2, height - h/2, 0)

	local speed_value = page_info:AddChild(Text(HEADERFONT, 96, nil, UICOLOURS.BROWN_DARK))
	local w, h = speed_value:GetRegionSize()
	speed_value:SetPosition(width/2 + separation_dist, height - h/2, 0)
	height = height - h - section_space

	-- Health Damage Speed --

	local filler = page_info:AddChild(Text(HEADERFONT, 96, "filler__", UICOLOURS.BROWN_DARK))
	local w, h = filler:GetRegionSize()
	filler:SetPosition(width/2, height - h/2, 0)
	height = height - h - section_space

	filler = page_info:AddChild(Text(HEADERFONT, 96, "filler__", UICOLOURS.BROWN_DARK))
	local w, h = filler:GetRegionSize()
	filler:SetPosition(width/2, height - h/2, 0)
	height = height - h - section_space

	filler = page_info:AddChild(Text(HEADERFONT, 96, "filler__", UICOLOURS.BROWN_DARK))
	local w, h = filler:GetRegionSize()
	filler:SetPosition(width/2, height - h/2, 0)
	height = height - h - section_space

	filler = page_info:AddChild(Text(HEADERFONT, 96, "filler__", UICOLOURS.BROWN_DARK))
	local w, h = filler:GetRegionSize()
	filler:SetPosition(width/2, height - h/2, 0)
	height = height - h - section_space

	height = math.abs(height)
	local top = math.min(height, max_visible_height)/2 - padding

	local scissor_data = { x = 0, y = -max_visible_height/2, width = width, height = max_visible_height }
	local context = { widget = page_info, offset = { x = 0, y = top }, size = { w = width, height = height + padding } }
	local scrollbar = { scroll_per_click = 12*3, v_offset = -50 }
	self.mobinfo_root.mobinfopage.scrollarea = self.mobinfo_root.mobinfopage:AddChild(TrueScrollArea(context, scissor_data, scrollbar))
	self.mobinfo_root.mobinfopage.scrollarea:SetPosition(-width/2, 0)

	self.mobinfo_root.mobinfopage.scrollarea.up_button:Kill()
	self.mobinfo_root.mobinfopage.scrollarea.down_button:Kill()

	self.mobinfo_root.mobinfopage.scrollarea.scroll_bar_line:SetTexture("images/global_redux.xml", "scrollbar_bar.tex")
	self.mobinfo_root.mobinfopage.scrollarea.scroll_bar_line:ScaleToSize(20, max_visible_height - 90)

	self.mobinfo_root.mobinfopage.scrollarea.position_marker:SetScale(0.8)

	self.mobinfo_root.mobinfopage.scrollarea.mob_cell = mob_cell
	self.mobinfo_root.mobinfopage.scrollarea.health = health_value
	self.mobinfo_root.mobinfopage.scrollarea.damage = damage_value
	self.mobinfo_root.mobinfopage.scrollarea.speed = speed_value

	local old_RefreshView = self.mobinfo_root.mobinfopage.scrollarea.RefreshView -- Fix scissoring
	self.mobinfo_root.mobinfopage.scrollarea.RefreshView = function(self)
		old_RefreshView(self)

		local w, h = self.mob_cell.mob_bg:GetScaledSize()
		self.mob_cell.mob:SetScissor(-w/2 + 3, -h/2 + 120, w, h)

		-- for i = 1, self.items_per_view do
		-- 	local cellimagew, cellimageh = self.widgets_to_update[i].cell_root.bg.image:GetSize()
		-- 	local scroll_percent = self.current_scroll_pos%1
		-- 	local hoffset = 1 - math.clamp(scroll_percent + (-(1 - 1) + (1 - 1)*2*scroll_percent), 0, 1)

		-- 	if i >= 1 and i <= 5 then
		-- 		local x = -cellimagew/2
		-- 		local y = -cellimageh/2
		-- 		local w = cellimagew
		-- 		local h = cellimageh*hoffset

		-- 		self.widgets_to_update[i].cell_root.mob_root:SetScissor(x, y, w, h)
		-- 	elseif i >= 26 and i <= 30 then
		-- 		local x = -cellimagew/2
		-- 		local y = -cellimageh/2 + cellimageh*hoffset
		-- 		local w = cellimagew
		-- 		local h = cellimageh*(1 - hoffset)

		-- 		self.widgets_to_update[i].cell_root.mob_root:SetScissor(x, y, w, h)
		-- 	elseif i >= 31 and i <= 35 and self.current_scroll_pos < self.end_pos - 1 then
		-- 		self.widgets_to_update[i].cell_root.mob_root:SetScissor(0, 0, 0, 0)
		-- 	else
		-- 		local x = -cellimagew/2
		-- 		local y = -cellimageh/2
		-- 		local w = cellimagew
		-- 		local h = cellimageh

		-- 		self.widgets_to_update[i].cell_root.mob_root:SetScissor(x, y, w, h)
		-- 	end
		-- end
	end
end

function BestiaryMonstersPage:OpenNewMobInfo(data)
	if self.mobinfo_root.mobinfopage and self.mobinfo_root.mobinfopage.is_loading == true then
		return
	end

	TheFocalPoint.SoundEmitter:PlaySound("dontstarve/characters/actions/page_turn") -- Only works if not auto-paused

	if self.mobinfo_root.mobinfopage then
		local rot = self.mobinfo_root.mobinfopage.inst.UITransform:GetRotation()
		local pagew, pageh = self.mobinfo_root.mobinfopage:GetSize()

		self.mobinfo_root.mobinfopage:MoveTo(Vector3(-pagew/2 + 150, 0, 0), Vector3(pagew, 0, 0), 0.2)
		self.mobinfo_root.mobinfopage:RotateTo(rot, 20, 0.2, function()
			self:UpdateMobInfo(data)

			self.mobinfo_root.mobinfopage:MoveTo(Vector3(pagew, 0, 0), Vector3(-pagew/2 + 140, 0, 0), 0.2)
			self.mobinfo_root.mobinfopage:RotateTo(20, 0, 0.2, function()
				if math.random() <= 0.02 then
					self.mobinfo_root.bg_decor:SetTexture("images/bestiary_mobinfo_bg.xml", "secret_"..math.random(11)..".tex")
				elseif self.mobinfo_root.bg_decor.texture ~= "basic_unknown.tex" then
					self.mobinfo_root.bg_decor:SetTexture("images/bestiary_mobinfo_bg.xml", "basic_unknown.tex")
				end

				self.mobinfo_root.mobinfopage.is_loading = false
			end)
		end)
		
		self.mobinfo_root.mobinfopage.is_loading = true

		return
	end

	if self.mobinfo_root.mobinfopage == nil then
		CreateMobPage(self)

		local pagew, pageh = self.mobinfo_root.mobinfopage:GetSize()

		self.mobinfo_root.mobinfopage:MoveTo(Vector3(pagew, 0, 0), Vector3(-pagew/2 + 150, 0, 0), 0.2)
		self.mobinfo_root.mobinfopage:RotateTo(20, 0, 0.2, function()
			self.mobinfo_root.mobinfopage.is_loading = false
		end)

		self.mobinfo_root.mobinfopage.is_loading = true

		self:UpdateMobInfo(data)
	end
end

function BestiaryMonstersPage:UpdateMobInfo(data)
	self.mobinfo_root.mobinfopage.scrollarea.mob_cell.mobname:SetMultilineTruncatedString(data.name or data.forms[1].name, 1, 500, nil, nil, true)
	self.mobinfo_root.mobinfopage.scrollarea.mob_cell.mob:GetAnimState():SetBank(data.bank or data.forms[1].bank)
	self.mobinfo_root.mobinfopage.scrollarea.mob_cell.mob:GetAnimState():SetBuild(data.build or data.forms[1].build)
	self.mobinfo_root.mobinfopage.scrollarea.mob_cell.mob:GetAnimState():PlayAnimation(data.anim_idle or data.forms[1].anim_idle, true)

	self.mobinfo_root.mobinfopage.scrollarea.health:SetMultilineTruncatedString(tostring(data.stats and data.stats.health or data.forms[1].stats.health), 1, 200, nil, nil, true)
	self.mobinfo_root.mobinfopage.scrollarea.damage:SetMultilineTruncatedString(tostring(data.stats and data.stats.damage or data.forms[1].stats.damage), 1, 200, nil, nil, true)
	self.mobinfo_root.mobinfopage.scrollarea.speed:SetMultilineTruncatedString(tostring(data.stats and data.stats.speed or data.forms[1].stats.speed), 1, 200, nil, nil, true)
end

function BestiaryMonstersPage:Close(height)
	self.mobgrid_root:MoveTo(Vector3(0, 0, 0), Vector3(0, -height, 0), 0.4)
	self.mobinfo_root:MoveTo(Vector3(0, 0, 0), Vector3(0, -height, 0), 0.4)
end

function BestiaryMonstersPage:Open()
	self.mobgrid_root:MoveTo(Vector3(0, -self.parenth, 0), Vector3(0, 0, 0), 0.4, function()
		self.mobgrid_root.grid:RefreshView()
	end)

	self.mobinfo_root:MoveTo(Vector3(0, -self.parenth, 0), Vector3(0, 0, 0), 0.4)
end

return BestiaryMonstersPage