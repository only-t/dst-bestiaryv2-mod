local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require("widgets/imagebutton")
local UIAnim = require("widgets/uianim")
local TEMPLATES = require("widgets/redux/templates")

local BestiaryMonstersPage = Class(Widget, function(self, owner)
	Widget._ctor(self, "BestiaryMonstersPage")

	self.parent_screen = owner

	self.page = self:AddChild(Image("images/bestiary_page.xml", "bestiary_page.tex"))
	self.page:SetSize(970, 570)
	self.page:SetPosition(0, 40)

	self.gridroot = self:AddChild(Widget("grid_root"))
    self.gridroot:SetPosition(0, -10)

    self.monster_grid = self.gridroot:AddChild(self:CreateMonsterGrid())

	local grid_w, grid_h = self.monster_grid:GetScrollRegionSize()
	local grid_boarder = self.gridroot:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
    grid_boarder:SetPosition(0, grid_h/2)
	grid_boarder:SetScale(1.45, 1)
	grid_boarder = self.gridroot:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
	grid_boarder:SetPosition(0, -grid_h/2 - 2)
	grid_boarder:SetScale(1.45, -1)

	self.monster_grid:SetItemsData(require("monsterinfo"))
end)

function BestiaryMonstersPage:CreateMonsterGrid()
	local row_w = 200
    local row_h = 160
	local framescale = 0.60

	local function ScrollWidgetsCtor(context, index)
        local w = Widget("monster-cell-"..index)

		w.cell_root = w:AddChild(ImageButton("images/monstergrid_bg_basic.xml", "monstergrid_bg_basic.tex"))
		w.cell_root:SetNormalScale(framescale, framescale)
		w.cell_root:SetFocusScale(framescale + 0.02, framescale + 0.02)
		w.cell_root.image:SetTint(0.8, 0.8, 0.8, 1)

		w.cell_root.monster = w.cell_root:AddChild(UIAnim())

		w.focus_forward = w.cell_root

		w.cell_root.ongainfocusfn = function()
			w.cell_root.monster:GetAnimState():Resume()

			self.monster_grid:OnWidgetFocus(w)
		end

		return w
    end

	local function ScrollWidgetSetData(context, widget, data, index)
		widget.data = data

		if data then
			widget.cell_root:Show()
			widget.cell_root.monster:Show()

			if widget.data.images then
				widget.cell_root:SetTextures(widget.data.images.grid_atlas, widget.data.images.grid_image)
			end

			widget.cell_root:SetOnClick(function()
				
			end)

			if widget.cell_root.monster:GetAnimState():GetBuild() ~= data.build then -- Change the whole UIAnim only at the last frame as it needs to replace the old one
				local time = widget.cell_root.monster:GetAnimState():GetCurrentAnimationTime() 	-- Since re-creating the UIAnim resets the animation it makes it look a bit... weird
																								-- We'll get the current animation time (from the last widget)
				widget.cell_root.monster:Kill() -- There is some serious tom foolery going on with the widgets data and it messes up things that it shouldn't even be able to access
				widget.cell_root.monster = widget:AddChild(UIAnim()) -- So we'll just re-create the UIAnim

				widget.cell_root.monster:GetAnimState():SetBank(data.bank)
				widget.cell_root.monster:GetAnimState():SetBuild(data.build)
				widget.cell_root.monster:SetFacing(data.rotations and data.rotations[1] or FACING_NONE)
				widget.cell_root.monster:GetAnimState():PlayAnimation(data.anim_idle, true)
				widget.cell_root.monster:GetAnimState():Pause()
				widget.cell_root.monster:GetAnimState():SetTime(time)-- And apply it to the new cell to make the transition smooooth
				widget.cell_root.monster:SetClickable(false)
				widget.cell_root.monster:SetScale(data.scale and data.scale*TUNING.MONSTER_SMALL_SCALING or 1, data.scale and data.scale*TUNING.MONSTER_SMALL_SCALING or 1)
				widget.cell_root.monster:SetPosition(0, -55)

				widget.cell_root.onlosefocusfn = function()
					widget.cell_root.monster:GetAnimState():PlayAnimation(data.anim_idle, true)
					widget.cell_root.monster:GetAnimState():Pause() -- Pause here to stop at the first frame
				end

				if widget.data.form_override_fn then
					widget.data.form_override_fn(widget.cell_root.monster:GetAnimState(), widget.data)
				end
			end

			widget:Enable()
		else
			widget:Disable()
			widget.cell_root:Hide()
			widget.cell_root.monster:Hide()
		end
    end

	local grid = TEMPLATES.ScrollingGrid(
		{  },
		{
			context = {  },
			widget_width = row_w,
			widget_height = row_h,
			force_peek = true,
			num_visible_rows = 2,
			num_columns = 4,
			item_ctor_fn = ScrollWidgetsCtor,
			apply_fn = ScrollWidgetSetData,
			scrollbar_offset = 20,
			scrollbar_height_offset = -100
		}
	)

	grid.up_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.up_button:SetScale(0.7)
	grid.up_button.image:SetTint(0.7, 0.7, 0.7, 1)

	grid.down_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.down_button:SetScale(-0.7)
	grid.down_button.image:SetTint(0.7, 0.7, 0.7, 1)

	grid.scroll_bar_line:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex")
	grid.scroll_bar_line:SetScale(1, 0.5)

	grid.position_marker:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker.image:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker:SetScale(0.8)

	return grid
end

-- function BestiaryMonstersPage:AddSearch()
--     local searchbox = Widget("search")
--     searchbox.textbox_root = searchbox:AddChild(TEMPLATES.StandardSingleLineTextEntry(nil, 500, 60, nil, 40))
--     searchbox.textbox = searchbox.textbox_root.textbox
--     searchbox.textbox:SetTextLengthLimit(50)
--     searchbox.textbox:SetForceEdit(true)
--     searchbox.textbox:EnableWordWrap(false)
--     searchbox.textbox:EnableScrollEditWindow(true)
--     searchbox.textbox:SetHelpTextEdit("")
--     searchbox.textbox:SetHelpTextApply("Search")
--     searchbox.textbox:SetTextPrompt("Search", UICOLOURS.GREY)
--     searchbox.textbox.prompt:SetHAlign(ANCHOR_MIDDLE)
--     searchbox.textbox.OnTextInputted = function()
-- 		self.search_text = searchbox.textbox:GetLineEditString()
-- 		self:ApplyFilters(self.filter, self.search_text)
--     end

--     searchbox:SetOnGainFocus(function() searchbox.textbox:OnGainFocus() end)
--     searchbox:SetOnLoseFocus(function() searchbox.textbox:OnLoseFocus() end)

--     searchbox.focus_forward = searchbox.textbox

--     return searchbox
-- end

return BestiaryMonstersPage