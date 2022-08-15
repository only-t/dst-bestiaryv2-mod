local State = GLOBAL.State
local TimeEvent = GLOBAL.TimeEvent
local EventHandler = GLOBAL.EventHandler

local bestiary_openstate = State{
	name = "bestiary_open",
	tags = { "doing" },

	onenter = function(inst)
		inst.components.locomotor:StopMoving()
		inst.AnimState:PlayAnimation("action_uniqueitem_pre")
		inst.AnimState:OverrideSymbol("book_cook", "cookbook", "book_cook")
		inst.AnimState:PushAnimation("reading_in", false)
		inst.AnimState:PushAnimation("reading_loop", true)
	end,

	timeline = {
		TimeEvent(8*GLOBAL.FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve/common/use_book")
			inst:PerformBufferedAction()
		end),
	},

	onupdate = function(inst)
		if not GLOBAL.CanEntitySeeTarget(inst, inst) then
			inst.sg:GoToState("bestiary_close")
		end
	end,
	
	events = {
		EventHandler("ms_closepopup", function(inst, data)
			if data.popup == GLOBAL.POPUPS.BESTIARY then
				inst.sg:GoToState("bestiary_close")
			end
		end),
	},

	onexit = function(inst)
		inst:ShowPopUp(GLOBAL.POPUPS.BESTIARY, false)
	end,
}

local bestiary_closestate = State{
	name = "bestiary_close",
	tags = { "idle", "nodangle" },

	onenter = function(inst)
		inst.components.locomotor:StopMoving()
		inst.SoundEmitter:PlaySound("dontstarve/common/use_book")
		inst.AnimState:PlayAnimation("reading_pst")
	end,

	events = {
		EventHandler("animover", function(inst)
			if inst.AnimState:AnimDone() then
				inst.sg:GoToState(inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) and "item_out" or "idle")
			end
		end),
	},
}

local bestiary_open_clientstate = State{
	name = "bestiary_open",
	tags = { "doing" },

	onenter = function(inst)
		inst.components.locomotor:Stop()
		inst.AnimState:PlayAnimation("action_uniqueitem_pre")
		inst.AnimState:PushAnimation("action_uniqueitem_lag", false)

		inst:PerformPreviewBufferedAction()
		inst.sg:SetTimeout(2)
	end,

	onupdate = function(inst)
		if inst:HasTag("doing") then
			if inst.entity:FlattenMovementPrediction() then
				inst.sg:GoToState("idle", "noanim")
			end
		elseif inst.bufferedaction == nil then
			inst.sg:GoToState("idle")
		end
	end,

	ontimeout = function(inst)
		inst:ClearBufferedAction()
		inst.sg:GoToState("idle")
	end,
}

AddStategraphState("wilson", bestiary_openstate)
AddStategraphState("wilson", bestiary_closestate)
AddStategraphState("wilson_client", bestiary_open_clientstate)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.OPEN_BESTIARY, "bestiary_open"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.OPEN_BESTIARY, "bestiary_open"))