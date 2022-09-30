local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local Image = require "widgets/image"
local UIAnim = require "widgets/uianim"
local TEMPLATES = require "widgets/redux/templates"

local BestiaryMonstersPage = Class(Widget, function(self, owner, parentpage)
	Widget._ctor(self, "BestiaryMonstersPage")

	self.owner = owner

	self.monstergrid_root = self:AddChild(Widget("monstergrid"))
    self.monstergrid_root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.monstergrid_root:SetVAnchor(ANCHOR_MIDDLE)
    self.monstergrid_root:SetHAnchor(ANCHOR_LEFT)

	local sw, sh = parentpage:GetScaledSize()
    self.monstergrid_root:MoveTo(Vector3(0, -sh, 0), Vector3(0, 0, 0), 0.4)

	self.monstergrid_root.monstergrid = self.monstergrid_root:AddChild(self:CreateMonsterGrid())

	local grid_w, grid_h = self.monstergrid_root.monstergrid:GetScrollRegionSize()
	self.monstergrid_root.monstergrid:SetScale(0.7, 0.7)
	self.monstergrid_root.monstergrid:SetPosition(grid_w/2 - 40, -40, 0)

	local grid_boarder = self.monstergrid_root.monstergrid:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
    grid_boarder:SetPosition(20, grid_h/2 + 2)
	grid_boarder:SetScale(1.5, 1.3)
	grid_boarder = self.monstergrid_root.monstergrid:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
	grid_boarder:SetPosition(20, -grid_h/2 - 2)
	grid_boarder:SetScale(1.5, -1.3)

	self.monstergrid_root.monstergrid.decor = self.monstergrid_root.monstergrid:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_block.tex"))
	self.monstergrid_root.monstergrid.decor:ScaleToSize(grid_w + 20, grid_h)

	self.monstergrid_root.monstergrid.decor:MoveToBack()

	self.parent_default_focus = self.monstergrid_root.monstergrid
	self.focus_forward = self.monstergrid_root.monstergrid
end)

function BestiaryMonstersPage:CreateMonsterGrid()
	local width = 150
	local height = 150
	
	local function ScrollWidgetsCtor(context, index)
        local w = Widget("monster-cell-"..index)

		w.cell_root = w:AddChild(ImageButton("images/monstergrid_bg.xml", "monstergrid_bg.tex"))
		-- w.cell_root = w:AddChild(ImageButton(atlas, normal, focus, disabled, down, selected, scale, offset))
		w.cell_root.normal_scale = nil
		w.cell_root.focus_scale = nil
		w.cell_root:ForceImageSize(width, height)
		w.cell_root.image:SetTint(0.8, 0.8, 0.8, 1)

		w.cell_root.monster = w.cell_root.image:AddChild(UIAnim())

		w.cell_root:SetOnGainFocus(function()
			self.monstergrid_root.monstergrid:OnWidgetFocus(w)
			w.cell_root.monster:GetAnimState():Resume()
		end)

		w.cell_root:SetOnLoseFocus(function()
			if w.data then
				w.cell_root.monster:GetAnimState():PlayAnimation(w.data.anim_idle, true)
				w.cell_root.monster:GetAnimState():Pause()
			end
		end)

		w.focus_forward = w.cell_root

		return w
    end

	local function ScrollWidgetSetData(context, w, data, index)
		w.data = data

		if w.data then
			w.cell_root:Show()
			w.cell_root.monster:Show()

			w.cell_root.monster:GetAnimState():SetBank(data.bank)
			w.cell_root.monster:GetAnimState():SetBuild(data.build)
			w.cell_root.monster:GetAnimState():PlayAnimation(data.anim_idle, true)
			w.cell_root.monster:GetAnimState():Pause()
			w.cell_root.monster:SetClickable(false)

			w:Enable()
		else
			w.cell_root:Hide()
			w.cell_root.monster:Hide()

			w:Disable()
		end
    end

	local grid = TEMPLATES.ScrollingGrid(
		require("monsterinfo"),
		{
			context = {  },
			widget_width = width,
			widget_height = height,
			force_peek = true,
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

	local old_RefreshView = grid.RefreshView
	grid.RefreshView = function(self)
		old_RefreshView(self)

		for i = 1, self.items_per_view do
			local cellw, cellh = self.widgets_to_update[i].cell_root.image:GetSize() -- 171
			local scaled_cellw, scaled_cellh = self.widgets_to_update[i].cell_root.image:GetScaledSize() -- 136.8

			print(cellw)
			print(scaled_cellw)

			if i >= 1 and i <= 5 then
				local hoffset = (1 - self.current_scroll_pos%1)

				local x = -cellw/2 + 5
				local y = -cellh/2 + 5
				local w = cellw - 10
				local h = (cellh - 10)*hoffset

				self.widgets_to_update[i].cell_root.monster:SetScissor(x, y, w, h)
			elseif i >= 26 and i <= 35 then
				local x = -cellw/2 + 5
				local y = -cellh/2 + 5
				local w = cellw - 10
				local h = cellh - 10

				self.widgets_to_update[i].cell_root.monster:SetScissor(x, y, w, h)
			else
				local x = -cellw/2 + 5
				local y = -cellh/2 + 5
				local w = cellw - 10
				local h = cellh - 10

				self.widgets_to_update[i].cell_root.monster:SetScissor(x, y, w, h)
			end
		end
	end

	return grid
end

function BestiaryMonstersPage:Close(height)
    self.monstergrid_root:MoveTo(Vector3(0, 0, 0), Vector3(0, -height, 0), 0.4)
end

return BestiaryMonstersPage