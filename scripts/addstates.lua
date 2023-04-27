local State = _G.State
local TimeEvent = _G.TimeEvent
local EventHandler = _G.EventHandler
local FRAMES = _G.FRAMES


-- SERVER --

local SGwilson = require("stategraphs/SGwilson")

SGwilson.states["bestiary_open"] = State{
	name = "bestiary_open",
	tags = { "doing", "busy" },

	onenter = function(inst)
		inst.components.locomotor:StopMoving()
		inst.AnimState:PlayAnimation("action_uniqueitem_pre")
		inst.AnimState:OverrideSymbol("book_cook", "cookbook", "book_cook")
		inst.AnimState:PushAnimation("reading_in", false)
		inst.AnimState:PushAnimation("reading_loop", true)
	end,

	timeline = {
		TimeEvent(8*FRAMES, function(inst)
			inst:ShowPopUp(_G.POPUPS.BESTIARY, true)
			inst.SoundEmitter:PlaySound("dontstarve/common/use_book")
		end),
	},

	onupdate = function(inst)
		if not _G.CanEntitySeeTarget(inst, inst) then
			inst.sg:GoToState("bestiary_close")
		end
	end,
	
	events = {
		EventHandler("ms_closepopup", function(inst, data)
			if data.popup == _G.POPUPS.BESTIARY then
				inst.sg:GoToState("bestiary_close")
			end
		end)
	},

	onexit = function(inst)
		inst:ShowPopUp(_G.POPUPS.BESTIARY, false)
	end
}

SGwilson.states["bestiary_close"] = State{
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
				inst.sg:GoToState(inst.components.inventory:GetEquippedItem(_G.EQUIPSLOTS.HANDS) and "item_out" or "idle")
			end
		end)
	}
}


-- CLIENT --

local SGwilson_client = require("stategraphs/SGwilson_client")

local TIMEOUT = 2

SGwilson_client.states["bestiary_open"] = State{
	name = "bestiary_open",
	tags = { "doing", "busy" },
	server_states = { "bestiary_open" },

	onenter = function(inst)
		inst.components.locomotor:Stop()
		inst.AnimState:PlayAnimation("action_uniqueitem_pre")
		inst.AnimState:PushAnimation("action_uniqueitem_lag", false)

		inst:PerformPreviewBufferedAction()
		inst.sg:SetTimeout(TIMEOUT)
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