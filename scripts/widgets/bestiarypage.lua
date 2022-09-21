local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require("widgets/imagebutton")
local UIAnim = require("widgets/uianim")
local Grid = require("widgets/grid")
local TEMPLATES = require("widgets/redux/templates")

local BestiaryMonstersPage = Class(Widget, function(self, owner)
	Widget._ctor(self, "BestiaryMonstersPage")

	self.owner = owner

	self:SetScale(0.8, 0.8)
	self.page_h = 570
	self.page_w = 970

	self.page = self:AddChild(Image("images/bestiary_page.xml", "bestiary_page.tex"))
	self.page:SetSize(self.page_w, self.page_h)
	self.page:SetPosition(0, 40)

	self.gridroot = self:AddChild(Widget("grid_root"))
	self.gridroot:SetPosition(0, 10)

	local decor_area = self.gridroot:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_block.tex"))

	self.all_monsters = require("monsterinfo")
	self.filtered_monsters = {  }

    self.monster_grid = self.gridroot:AddChild(self:CreateMonsterGrid())
	self.monster_grid:SetItemsData(self.all_monsters)

	local grid_w, grid_h = self.monster_grid:GetScrollRegionSize()
	decor_area:SetPosition(0, -1)
	decor_area:ScaleToSize(grid_w + 20, grid_h + 2)

	local grid_w, grid_h = self.monster_grid:GetScrollRegionSize()
	local grid_boarder = self.gridroot:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
    grid_boarder:SetPosition(0, grid_h/2 + 1)
	grid_boarder:SetScale(1.35, 1)
	grid_boarder = self.gridroot:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line.tex"))
	grid_boarder:SetPosition(0, -grid_h/2 - 2)
	grid_boarder:SetScale(1.35, -1)

	self.options = self:AddChild(self:CreateOptions())
	self.options:SetPosition(0, 585)
end)

function BestiaryMonstersPage:CreateMonsterGrid()
	local row_w = 180
    local row_h = 140
	local framescale = 0.5

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
				self.gridroot:Hide()
				self.options:Hide()

				self.page:AddChild(self:PopulateMonsterPage(widget.data))
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
				widget.cell_root.monster:GetAnimState():SetTime(time) -- And apply it to the new cell to make the transition smooooth
				widget.cell_root.monster:SetClickable(false)
				widget.cell_root.monster:SetScale(data.scale and data.scale*TUNING.MONSTER_SMALL_SCALING or 1, data.scale and data.scale*TUNING.MONSTER_SMALL_SCALING or 1)
				widget.cell_root.monster:SetPosition(0, -40)

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
			num_visible_rows = 3,
			num_columns = 4,
			item_ctor_fn = ScrollWidgetsCtor,
			apply_fn = ScrollWidgetSetData,
			scrollbar_offset = 30,
			scrollbar_height_offset = -100
		}
	)

	grid.up_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.up_button:SetScale(0.8)
	grid.up_button.image:SetTint(0.9, 0.9, 0.9, 1)

	grid.down_button:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_arrow_hover.tex")
	grid.down_button:SetScale(-0.8)
	grid.down_button.image:SetTint(0.9, 0.9, 0.9, 1)

	grid.scroll_bar_line:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex")
	grid.scroll_bar_line:SetScale(0.8, 0.7)

	grid.position_marker:SetTextures("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker.image:SetTexture("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_handle.tex")
	grid.position_marker:SetScale(0.8)
	grid.down_button.image:SetTint(0.9, 0.9, 0.9, 1)

	return grid
end

function BestiaryMonstersPage:CreateOptions()
	local root = self:AddChild(Widget("root"))

	local options_button_scale = 0.5
	root.options_button = root:AddChild(UIAnim())
	root.options_button:GetAnimState():SetBank("bestiary_options_button")
	root.options_button:GetAnimState():SetBuild("bestiary_options_button")
	root.options_button:GetAnimState():PlayAnimation("idle_closed")
	root.options_button:SetScale(options_button_scale)
	root.options_button.is_closed = true

	root.options_button.clickable = root.options_button:AddChild(ImageButton("images/bestiary_options_button.xml", "bestiary_options_button.tex"))
	root.options_button.clickable.image:SetTint(1, 1, 1, 0)
	root.options_button.clickable:SetNormalScale(1, 1, 1)
	root.options_button.clickable:SetFocusScale(1, 1, 1)
	root.options_button.clickable:SetOnClick(function()
		if root.options_button.is_closed then
			root.options_button:GetAnimState():PlayAnimation("open")
			root.options_button:GetAnimState():PushAnimation("idle_opened")

			root.options_button.clickable:SetClickable(false)
			self.options:MoveTo(Vector3(0, 585, 0), Vector3(0, 585 - 400, 0), 0.4, function()
				root.options_button.clickable:SetClickable(true)
				root.options_button.is_closed = false
			end)
		else
			root.options_button:GetAnimState():PlayAnimation("close")
			root.options_button:GetAnimState():PushAnimation("idle_closed")

			root.options_button.clickable:SetClickable(false)
			self.options:MoveTo(Vector3(0, 585 - 400, 0), Vector3(0, 585, 0), 0.4, function()
				root.options_button.clickable:SetClickable(true)
				root.options_button.is_closed = true
			end)
		end
	end)

	root.options_button.OnGainFocus = function()
		local pos = root.options_button:GetPosition()
		root.options_button:SetPosition(pos.x, pos.y - 5)
	end

	root.options_button.OnLoseFocus = function()
		local pos = root.options_button:GetPosition()
		root.options_button:SetPosition(pos.x, pos.y + 5)
	end
	
	root.options_button:SetPosition(0, -280)

	root.bg = root:AddChild(Image("images/bestiary_options_bg.xml", "bestiary_options_bg.tex"))
	root.bg:SetScale(0.5)

	-- local sorts = {
	-- 	{ text = "Sort: Alphabetically", data = "alphabetical", atlas = "images/button_icons.xml", image = "sort_name.tex" },
	-- 	{ text = "Sort: Reversed Alphabetically", data = "alphabetical_rev", atlas = "images/sort_rev_name.xml", image = "sort_rev_name.tex"  },
	-- 	{ text = "Sort: By Health", data = "health", atlas = "images/sort_health.xml", image = "sort_health.tex" },
	-- 	{ text = "Sort: By Damage", data = "damage", atlas = "images/sort_dmg.xml", image = "sort_dmg.tex" },
	-- 	{ text = "Sort: By Speed", data = "speed", atlas = "images/sort_speed.xml", image = "sort_speed.tex" },
	-- }

	-- local sort_index = 1
	-- local sort_button = root:AddChild(TEMPLATES.IconButton(sorts[1].atlas, sorts[1].image))
	-- sort_button:SetHoverText(sorts[1].text)
	-- -- sort_button:SetPosition(64, -5)
	-- sort_button:ForceImageSize(80, 80)
	-- sort_button:SetTextSize(math.ceil(50*0.45))
	-- sort_button:SetOnClick(function()
	-- 	sort_index = sort_index + 1

	-- 	if sort_index > #sorts then
	-- 		sort_index = 1
	-- 	end

	-- 	self.sort = sorts[sort_index].data
	-- 	self:ApplySort(self.sort)
	-- 	sort_button:SetHoverText(sorts[sort_index].text)

	-- 	sort_button.icon:SetTexture(sorts[sort_index].atlas, sorts[sort_index].image)
	-- end)

	-- local filter_buttons = root:AddChild(self:CreateFilterButtons())

	return root
end

-- function BestiaryMonstersPage:CreateFilterButtons()
-- 	local root = Widget("filter_buttons_root")
-- 	root.grid = root:AddChild(Grid())

-- 	local size = 28

-- 	local filter_buttons = {  }

-- 	local filters = {
-- 		{ text = "Everything", data = "all", atlas = CRAFTING_ICONS_ATLAS, image = "filter_none.tex" },
-- 		{ text = "Intent: Neutral", data = STRINGS.BESTIARY_NEUTRAL, atlas = "images/intent_neutral.xml", image = "intent_neutral.tex" },
-- 		{ text = "Intent: Passive", data = STRINGS.BESTIARY_PASSIVE, atlas = "images/intent_passive.xml", image = "intent_passive.tex" },
-- 		{ text = "Intent: Aggressive", data = STRINGS.BESTIARY_AGGRESSIVE, atlas = "images/intent_aggressive.xml", image = "intent_aggressive.tex" },
-- 		{ text = "Type: Animal", data = STRINGS.BESTIARY_ANIMAL, atlas = "images/type_animal.xml", image = "type_animal.tex" },
-- 		{ text = "Type: Monster", data = STRINGS.BESTIARY_MONSTER, atlas = "minimap/minimap_data.xml", image = "spiderden.png" },
-- 		{ text = "Type: Boss", data = STRINGS.BESTIARY_BOSS, atlas = "images/type_boss.xml", image = "type_boss.tex" },
-- 		{ text = "Type: Raid Boss", data = STRINGS.BESTIARY_RAIDBOSS, atlas = "minimap/minimap_data.xml", image = "crabking.png" },
-- 	}

-- 	root.grid:InitSize(8, 1, size*1.2, size*1.2)
-- 	root.grid:UseNaturalLayout()

-- 	for i, filter in ipairs(filters) do
-- 		local button = ImageButton(CRAFTING_ATLAS, "filterslot_frame.tex", "filterslot_frame_highlight.tex", nil, nil, "filterslot_frame_select.tex")
-- 		button.image:ScaleToSize(size, size)
-- 		button:SetHoverText(filter.text, { offset_y = 30 })

-- 		button.filter_bg = button:AddChild(Image(CRAFTING_ATLAS, i == 1 and "filterslot_bg_highlight.tex" or "filterslot_bg.tex"))
-- 		button.filter_bg:ScaleToSize(size + 6, size + 6)
-- 		button.filter_bg:MoveToBack()

-- 		button.filter_img = button:AddChild(Image(filter.atlas, filter.image))
-- 		button.filter_img:ScaleToSize(size - size/10, size - size/10)

-- 		button:SetOnClick(function()
-- 			self:ApplyFilters(filter.data, self.search_text)

-- 			for i, filter_btn in ipairs(filter_buttons) do
-- 				filter_btn.filter_bg:SetTexture(CRAFTING_ATLAS, "filterslot_bg.tex")
-- 			end

-- 			button.filter_bg:SetTexture(CRAFTING_ATLAS, "filterslot_bg_highlight.tex")
-- 		end)

-- 		button = root.grid:AddItem(button, i, 1)
-- 		local pos = button:GetPosition()

-- 		if i < 2 then
-- 			button:SetPosition(pos.x - 15, 0)
-- 		elseif i < 5 then
-- 			button:SetPosition(pos.x - 5, 0)
-- 		else
-- 			button:SetPosition(pos.x + 5, 0)
-- 		end

-- 		table.insert(filter_buttons, button)
-- 	end

-- 	return root
-- end

-- function BestiaryMonstersPage:ApplySort(selected)
-- 	local sortby = selected or "alphabetical"

-- 	local function alphabetical(a, b)
-- 		if type(a.name) == "function" then
-- 			if type(b.name) == "function" then
-- 				return ((a.name() < b.name()) and not (a.name() > b.name()))
-- 			else
-- 				return ((a.name() < b.name) and not (a.name() > b.name))
-- 			end
-- 		else
-- 			if type(b.name) == "function" then
-- 				return ((a.name < b.name()) and not (a.name > b.name()))
-- 			else
-- 				return ((a.name < b.name) and not (a.name > b.name))
-- 			end
-- 		end
-- 	end

-- 	local function alphabetical_rev(a, b)
-- 		if type(a.name) == "function" then
-- 			if type(b.name) == "function" then
-- 				return ((a.name() > b.name()) and not (a.name() < b.name()))
-- 			else
-- 				return ((a.name() > b.name) and not (a.name() < b.name))
-- 			end
-- 		else
-- 			if type(b.name) == "function" then
-- 				return ((a.name > b.name()) and not (a.name < b.name()))
-- 			else
-- 				return ((a.name > b.name) and not (a.name < b.name))
-- 			end
-- 		end
-- 	end

-- 	local function checkType(string)
-- 		if type(string) == "number" then
-- 			return string
-- 		end

-- 		local start, finish = string.match(string, "(.*)%-(.*)")

-- 		if finish then
-- 			return tonumber(finish)
-- 		elseif start then
-- 			return tonumber(start)
-- 		end
-- 	end

-- 	table.sort(self.filtered_monsters,
-- 		sortby == "alphabetical"		and function(a, b) return a.is_discovered and not b.is_discovered or (a.is_discovered and b.is_discovered and alphabetical(a, b)) end
-- 		or sortby == "alphabetical_rev"		and function(a, b) return a.is_discovered and not b.is_discovered or (a.is_discovered and b.is_discovered and alphabetical_rev(a, b)) end
-- 		or sortby == "health"				and function(a, b) return a.is_discovered and not b.is_discovered or (a.is_discovered and b.is_discovered and ((checkType(a.stats.health) > checkType(b.stats.health)) or (checkType(a.stats.health) == checkType(b.stats.health) and alphabetical(a, b)))) end
-- 		or sortby == "damage"				and function(a, b) return a.is_discovered and not b.is_discovered or (a.is_discovered and b.is_discovered and ((checkType(a.stats.damage) > checkType(b.stats.damage)) or (checkType(a.stats.damage) == checkType(b.stats.damage) and alphabetical(a, b)))) end
-- 		or sortby == "speed"				and function(a, b) return a.is_discovered and not b.is_discovered or (a.is_discovered and b.is_discovered and ((checkType(a.stats.speed) > checkType(b.stats.speed)) or (checkType(a.stats.speed) == checkType(b.stats.speed) and alphabetical(a, b)))) end
-- 	)

--     self.monster_grid:SetItemsData(self.filtered_monsters)
-- end

-- function BestiaryMonstersPage:ApplyFilters(selected, text)
-- 	local filterby = selected or "all"
	
-- 	self.filtered_monsters = {  }

-- 	for i, data in ipairs(self.all_monsters) do
-- 		if filterby == "all" or data.intent == filterby or data.type == filterby then
-- 			if text then
-- 				if string.find(string.lower(data.name), string.lower(text)) then
-- 					table.insert(self.filtered_monsters, data)
-- 				end
-- 			else
-- 				table.insert(self.filtered_monsters, data)
-- 			end
-- 		end
-- 	end

-- 	self:ApplySort(self.sort)
-- end

function BestiaryMonstersPage:PopulateMonsterPage(monsterdata)
	local root = self:AddChild(Widget("monsterdataroot"))

	

	return root
end

return BestiaryMonstersPage