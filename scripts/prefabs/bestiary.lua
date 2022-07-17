local assets = {
    Asset("ANIM", "anim/bestiary.zip"),
	Asset("ATLAS", "images/bestiary.xml"),
	Asset("IMAGE", "images/bestiary.tex")
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.2, 1)
	
    inst.AnimState:SetBank("bestiary")
    inst.AnimState:SetBuild("bestiary")
    inst.AnimState:PlayAnimation("idle")
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "bestiary"
	inst.components.inventoryitem.atlasname = "images/bestiary.xml"
	
	-- inst:AddComponent("bestiary")
	
    inst:AddComponent("inspectable")

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("bestiary", fn, assets)