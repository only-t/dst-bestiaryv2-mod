local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local Image = require "widgets/image"
local UIAnim = require "widgets/uianim"
local TEMPLATES = require "widgets/redux/templates"

local BestiaryMonstersPage = Class(Widget, function(self, owner, parentpage)
	Widget._ctor(self, "BestiaryMonstersPage")

	self.owner = owner

	self.mobgrid_root = self:AddChild(Widget("grid"))
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

	local sw, sh = parentpage:GetScaledSize()
    self.mobgrid_root:MoveTo(Vector3(0, -sh, 0), Vector3(0, 0, 0), 0.4, function()
		self.mobgrid_root.grid:RefreshView()
	end)

	self.parent_default_focus = self.mobgrid_root.grid
	self.focus_forward = self.mobgrid_root.grid
end)

function BestiaryMonstersPage:CreateMonsterGrid()
	local width = 150
	local height = 150
	local mob_scale = 0.25
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

		w.cell_root.bg.rim = w.cell_root.bg:AddChild(Image("images/mob_cellrim.xml", "mob_cellrim_normal.tex"))
		w.cell_root.bg.rim:SetClickable(false)
	
		w.cell_root.bg:SetOnGainFocus(function()
			self.mobgrid_root.grid:OnWidgetFocus(w)
			w.cell_root.mob_root.mob:GetAnimState():Resume()

			w.cell_root.bg.rim:SetTexture("images/mob_cellrim.xml", "mob_cellrim_focus.tex")
		end)

		w.cell_root.bg:SetOnLoseFocus(function()
			if w.data then
				w.cell_root.mob_root.mob:GetAnimState():PlayAnimation(w.data.anim_idle, true)
				w.cell_root.mob_root.mob:GetAnimState():Pause()
			end

			w.cell_root.bg.rim:SetTexture("images/mob_cellrim.xml", "mob_cellrim_normal.tex")
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

			w.cell_root.mob_root.mob:GetAnimState():SetBank(data.bank)
			w.cell_root.mob_root.mob:GetAnimState():SetBuild(data.build)
			w.cell_root.mob_root.mob:GetAnimState():PlayAnimation(data.anim_idle, true)
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
			scrollbar_height_offset = -150
		}
	)

	grid.up_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.up_button:SetScale(1)

	grid.down_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.down_button:SetScale(-1)
	grid.down_button:SetPosition(2, -grid.scrollbar_height/2 - 5)

	grid.scroll_bar_line:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex")
	grid.scroll_bar_line:SetScale(1, 1.5)

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

function BestiaryMonstersPage:Close(height)
    self.mobgrid_root:MoveTo(Vector3(0, 0, 0), Vector3(0, -height, 0), 0.4)
end

return BestiaryMonstersPage