AddAction("OPEN_BESTIARY", "Open", function(act)
	local target = act.target or act.invobject

	if target and act.doer and target.components.bestiary then
		act.doer:ShowPopUp(GLOBAL.POPUPS.BESTIARY, true)

		return true
	end
end)

AddComponentAction("INVENTORY", "bestiary", function(inst, doer, actions)
	if doer:HasTag("player") then
		table.insert(actions, GLOBAL.ACTIONS.OPEN_BESTIARY)
	end
end)