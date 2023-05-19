local State = _G.State
local TimeEvent = _G.TimeEvent
local EventHandler = _G.EventHandler
local ActionHandler = _G.ActionHandler
local ACTIONS = _G.ACTIONS
local FRAMES = _G.FRAMES

AddAction("OPEN_BESTIARY", "Read", function(act)
	act.doer:ShowPopUp(_G.POPUPS.BESTIARY, true)
	act.doer.SoundEmitter:PlaySound("dontstarve/common/use_book")
    return true
end)


-- SERVER --

local SGwilson = require("stategraphs/SGwilson")

SGwilson.actionhandlers[ACTIONS.OPEN_BESTIARY] = ActionHandler(ACTIONS.OPEN_BESTIARY, function(inst)
    if not inst.sg:HasStateTag("busy") and (inst.components.health == nil or not inst.components.health:IsDead()) then
        return "bestiary_open"
    end
end)

SGwilson.states["bestiary_open"] = State{
	name = "bestiary_open",
	tags = { "doing", "busy" },

	onenter = function(inst)
		inst.components.locomotor:Stop()
		inst.components.locomotor:Clear()
		inst.AnimState:PlayAnimation("action_uniqueitem_pre")
		inst.AnimState:OverrideSymbol("book_cook", "bestiary_book", "bestiary_book")
		inst.AnimState:PushAnimation("reading_in", false)
		inst.AnimState:PushAnimation("reading_loop", true)
	end,

	timeline = {
		TimeEvent(8*FRAMES, function(inst)
			inst.sg:RemoveStateTag("busy")
			inst:PerformBufferedAction()
		end),
	},

	events = {
		EventHandler("ms_closepopup", function(inst, data)
			if data.popup == _G.POPUPS.BESTIARY then
				inst.sg:GoToState("bestiary_close")
			end
		end)
	},

	onupdate = function(inst)
		if not _G.CanEntitySeeTarget(inst, inst) then
			inst.sg:GoToState("bestiary_close")
		end
	end,

	onexit = function(inst)
		inst:ShowPopUp(_G.POPUPS.BESTIARY, false)
	end
}

SGwilson.states["bestiary_close"] = State{
	name = "bestiary_close",
	tags = { "idle", "nodangle" },

	onenter = function(inst)
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

SGwilson_client.actionhandlers[ACTIONS.OPEN_BESTIARY] = ActionHandler(ACTIONS.OPEN_BESTIARY, function(inst)
    if not inst.sg:HasStateTag("busy") and (inst.replica.health == nil or not inst.replica.health:IsDead()) then
        return "bestiary_open"
    end
end)

SGwilson_client.states["bestiary_open"] = State{
	name = "bestiary_open",
	server_states = { "bestiary_open" },
	forward_server_states = true,
	onenter = function(inst) inst.sg:GoToState("action_uniqueitem_busy") end
}