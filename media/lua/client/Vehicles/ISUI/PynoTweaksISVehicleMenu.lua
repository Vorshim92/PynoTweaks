require "Vehicles/ISUI/ISVehicleMenu"

local function predicateWeldingMask(item)
	return item:hasTag("WeldingMask") or item:getType() == "WeldingMask"
end

local function predicatePetrol(item)
	return (item:hasTag("Petrol") or item:getType() == "PetrolCan") and item:getUsedDelta() > 0
end

local function predicateEmptyPetrol(item)
	return item:hasTag("EmptyPetrol") or item:getType() == "EmptyPetrolCan"
end

local function predicatePetrolNotFull(item)
	return (item:hasTag("Petrol") or item:getType() == "PetrolCan") and item:getUsedDelta() < 1 
end

local function predicateBlowTorch(item)
	return (item:hasTag("BlowTorch") or item:getType() == "BlowTorch") and item:getDrainableUsesInt() >= 10
end

local function distanceToPassengerPosition(seat)
	local script = SORTVARS.vehicle:getScript()
	local outside = SORTVARS.vehicle:getPassengerPosition(seat, "outside")
	local worldPos = SORTVARS.vehicle:getWorldPos(outside:getOffset(), SORTVARS.pos)
	return SORTVARS.playerObj:DistTo(worldPos:x(), worldPos:y())
end

local function getClosestSeat(playerObj, vehicle, seats)
	if #seats == 0 then
		return nil
	end
	-- Sort by distance from the player to the 'outside' position.
	SORTVARS.playerObj = playerObj
	SORTVARS.vehicle = vehicle
	table.sort(seats, function(a,b)
		local distA = distanceToPassengerPosition(a)
		local distB = distanceToPassengerPosition(b)
		return distA < distB
	end)
	return seats[1]
end

function ISVehicleMenu.FillPartMenu(playerIndex, context, slice, vehicle)
	local playerObj = getSpecificPlayer(playerIndex);
	if playerObj:DistToProper(vehicle) >= 4 then
		return
	end
	local typeToItem = VehicleUtils.getItems(playerIndex)
	for i=1,vehicle:getPartCount() do
		local part = vehicle:getPartByIndex(i-1)
		if not vehicle:isEngineStarted() and part:isContainer() and part:getContainerContentType() == "Gasoline" then
			if playerObj:getInventory():containsEvalRecurse(predicatePetrol) and part:getContainerContentAmount() < part:getContainerCapacity() then
				if slice then
					slice:addSlice(getText("ContextMenu_VehicleAddGas"), getTexture("media/ui/vehicles/vehicle_add_gas.png"), ISVehiclePartMenu.onAddGasoline, playerObj, part)
				else
					ISVehiclePartMenu.doAddFuelMenu(playerObj, part, context)
					-- context:addOption(getText("ContextMenu_VehicleAddGas"), playerObj,ISVehiclePartMenu.onAddGasoline, part)
				end
			end
			if (ISVehiclePartMenu.getGasCanNotFull(playerObj, typeToItem) or playerObj:getInventory():containsEvalRecurse(predicateEmptyPetrol) or playerObj:getInventory():containsEvalRecurse(predicatePetrolNotFull)) 
			and part:getContainerContentAmount() > 0 then
				if slice then
					slice:addSlice(getText("ContextMenu_VehicleSiphonGas"), getTexture("media/ui/vehicles/vehicle_siphon_gas.png"), ISVehiclePartMenu.onTakeGasoline, playerObj, part)
				else
					ISVehiclePartMenu.doSiphonFuelMenu(playerObj, part, context)
					-- context:addOption(getText("ContextMenu_VehicleSiphonGas"), playerObj, ISVehiclePartMenu.doFillFuelMenu, part, context)
				end
			end
			local fuelStation = ISVehiclePartMenu.getNearbyFuelPump(vehicle)
			if fuelStation then
				local square = fuelStation:getSquare();
				if square and ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier)) then
					if square and part:getContainerContentAmount() < part:getContainerCapacity() then
						if slice then
                            if SandboxVars.PynoTweaks.FuelLimitationFactionTier > 0 then
                                local factions = playerObj:getModData().missionProgress.Factions
                                if not factions or not factions[1] or factions[1].tierlevel < SandboxVars.PynoTweaks.FuelLimitationFactionTier then
                                    return
                                end
                            end
                            slice:addSlice(getText("ContextMenu_VehicleRefuelFromPump"), getTexture("media/ui/vehicles/vehicle_refuel_from_pump.png"), ISVehiclePartMenu.onPumpGasoline, playerObj, part)
						else
							local option = context:addOption(getText("ContextMenu_VehicleRefuelFromPump"), playerObj, ISVehiclePartMenu.onPumpGasoline, part)
                            if SandboxVars.PynoTweaks.FuelLimitationFactionTier > 0 then
                                local factions = playerObj:getModData().missionProgress.Factions
                                if not factions or not factions[1] or factions[1].tierlevel < SandboxVars.PynoTweaks.FuelLimitationFactionTier then
                                    option.notAvailable = true
                                    local tooltip = ISWorldObjectContextMenu.addToolTip()
                                    local tiername = getText("IGUI_Factions_Template_Tier" .. SandboxVars.PynoTweaks.FuelLimitationFactionTier)
                                    tooltip:setName(getText("ContextMenu_FuelLimitationTitle"))
                                    tooltip.description = getText("ContextMenu_FuelLimitationDescriptionTier", tiername)
                                    option.toolTip = tooltip
                                    return
                                end
                            end
                        end
					end
				end
			end
		end
	end
end