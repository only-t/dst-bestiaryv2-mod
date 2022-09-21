local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local Image = require "widgets/image"
local TEMPLATES = require "widgets/redux/templates"

local BestiaryMonstersPage = Class(Widget, function(self, owner)
	Widget._ctor(self, "BestiaryMonstersPage")

	self.owner = owner

	self.monstergrid_root = self:AddChild(Widget("monstergrid"))

	self.monstergrid_root.monstergrid = self.monstergrid_root:AddChild(self:CreateMonsterGrid())

	local w, h = self.monstergrid_root.monstergrid:GetScrollRegionSize()
	self.monstergrid_root.decor = self.monstergrid_root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_block.tex"))
	self.monstergrid_root.decor:ScaleToSize(w, h)

	self.monstergrid_root.monstergrid:MoveToFront()
end)

function BestiaryMonstersPage:CreateMonsterGrid()
	local row_w = 150
    local row_h = 150
	local framescale = 0.8

	local function ScrollWidgetsCtor(context, index)
        local w = Widget("monster-cell-"..index)

		w.cell_root = w:AddChild(ImageButton("images/monstergrid_bg.xml", "monstergrid_bg.tex"))
		w.cell_root:SetNormalScale(framescale, framescale)
		w.cell_root:SetFocusScale(framescale + 0.02, framescale + 0.02)
		w.cell_root.image:SetTint(0.8, 0.8, 0.8, 1)

		w.focus_forward = w.cell_root

		return w
    end

	local function ScrollWidgetSetData(context, w, data, index)
		w.data = data

		if w.data then
			w.cell_root:Show()

			w:Enable()
		else
			w:Disable()
			w.cell_root:Hide()
		end
    end

	local grid = TEMPLATES.ScrollingGrid(
		require("monsterinfo"),
		{
			context = {  },
			widget_width = row_w,
			widget_height = row_h,
			force_peek = true,
			num_visible_rows = 5,
			num_columns = 5,
			item_ctor_fn = ScrollWidgetsCtor,
			apply_fn = ScrollWidgetSetData,
			scrollbar_offset = 20,
			scrollbar_height_offset = -100
		}
	)

	grid.up_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.up_button:SetScale(0.7)

	grid.down_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.down_button:SetScale(-0.7)

	grid.scroll_bar_line:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex")
	grid.scroll_bar_line:SetScale(1, 1.1)

	grid.position_marker:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker.image:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker:SetScale(0.8)

	return grid
end

return BestiaryMonstersPage