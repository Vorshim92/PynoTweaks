require "ISUI/ISModalDialog"
require "luautils"

if not PynoTweaks then PynoTweaks = {} end
if not PynoTweaks.UI then PynoTweaks.UI = {} end

-- ------------------------------------------------------
-- Copy of the same functions from ISBlacksmithMenu
-- for compatibility reasons
-- ------------------------------------------------------

local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

local function predicateDrainableUsesInt(item, count)
    return item:getDrainableUsesInt() >= count
end

local function getBlowTorchWithMostUses(container)
    return container:getBestTypeEvalRecurse("Base.BlowTorch", comparatorDrainableUsesInt)
end

local function getFirstBlowTorchWithUses(container, uses)
    return container:getFirstTypeEvalArgRecurse("Base.BlowTorch", predicateDrainableUsesInt, uses)
end

-- ------------------------------------------------------
-- The mod's functions
-- ------------------------------------------------------

local function onPynoTweaksAux(player, button, vehicle, propaneNeeded)
    if button.internal == "NO" then return end

    if luautils.walkAdj(player, vehicle:getSquare()) then
        local blowTorch = getFirstBlowTorchWithUses(player:getInventory(), propaneNeeded)
        ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), blowTorch, true);
        local mask = player:getInventory():getFirstTypeRecurse("WeldingMask")
        if mask then
            ISInventoryPaneContextMenu.wearItem(mask, player:getPlayerNum())
        end
        ISTimedActionQueue.add(PynoTweaksAction:new(player, vehicle, propaneNeeded))
    end
end

local function onPynoTweaks(player, vehicle, propaneNeeded)
    local message = getText("IGUI_PynoTweaks_ConfirmDialog_Vehicle")
    if vehicle:getScript():getName():find("Trailer") then
        message = getText("IGUI_PynoTweaks_ConfirmDialog_Trailer")
    end

    local playerNum = player:getPlayerNum()
    local modal = ISModalDialog:new(0, 0, 350, 150, message, true, player, onPynoTweaksAux, playerNum, vehicle, propaneNeeded)
    modal:initialise();
    modal:addToUIManager();
end

function PynoTweaks.UI.addOptionToMenuOutsideVehicle(player, context, vehicle)
    --if PynoTweaks.Utils.isBurnt(vehicle) and not PynoTweaksOptions.overrideBurnt then return end
    --if PynoTweaks.Utils.isSmashed(vehicle) and not PynoTweaksOptions.overrideSmashed then return end
    if not PynoTweaks.Utils.isBurnt(vehicle) and not PynoTweaks.Utils.isSmashed(vehicle) then
        if not player:getInventory():containsTypeRecurse("BlowTorch") then return end

        local hasPassengers
        for i = 0, vehicle:getMaxPassengers() - 1 do
            if vehicle:getCharacter(i) then
                hasPassengers = true
                break
            end
        end
        if hasPassengers then
            local option = context:addOption(getText("ContextMenu_PynoTweaks_RemoveVehicle"), nil, nil)
            local toolTip = ISToolTip:new()
            toolTip:initialise()
            toolTip:setVisible(false)
            option.toolTip = toolTip
            toolTip.description = getText("Tooltip_PynoTweaks_Passengers")
            option.notAvailable = true
            return
        end
    end

    local propaneNeeded = 0
    for i = 1, vehicle:getPartCount() do
        local part = vehicle:getPartByIndex(i - 1)
        local partId = part:getId()

        if not (part:getItemType() and not part:getItemType():isEmpty() and not part:getInventoryItem()) then
            if not (partId:find("Wind") or partId:find("Headlight") or partId:find("TruckBed")
                    or partId:find("GloveBox") or partId:find("Engine") or partId:find("Heater")
                    or partId:find("PassengerCompartment") or partId == "TrunkDoorWreck") then
                propaneNeeded = propaneNeeded + 0.065
            end
        end
    end

    propaneNeeded = math.ceil(propaneNeeded) + PynoTweaks.Utils.getBaseArea(vehicle)

    -- TODO: temporary fix for cases when more than one propane torch (>100 units) needed
    if propaneNeeded > 10 then
        propaneNeeded = 10
    end

    local optionText = getText("ContextMenu_PynoTweaks_RemoveVehicle")
    if vehicle:getScript():getName():find("Trailer") then
        optionText = getText("ContextMenu_PynoTweaks_RemoveTrailer")
    end

    local option
    -- Override the vanilla implementation for burnt or smashed vehicles
    --if PynoTweaksOptions.overrideBurnt and PynoTweaks.Utils.isBurnt(vehicle) then
    if PynoTweaks.Utils.isBurnt(vehicle) then
        option = context:getOptionFromName(getText("ContextMenu_RemoveBurntVehicle"))
    end
    --if PynoTweaksOptions.overrideSmashed and PynoTweaks.Utils.isSmashed(vehicle) then
    if PynoTweaks.Utils.isSmashed(vehicle) then
        option = context:getOptionFromName(getText("ContextMenu_RemoveBurntVehicle"))
    end

    if option then
        option.name = optionText
        option.target = player
        option.onSelect = onPynoTweaks
        option.param1 = vehicle
        option.param2 = propaneNeeded
    else
        option = context:addOption(optionText, player, onPynoTweaks, vehicle, propaneNeeded)
    end

    local toolTip = ISToolTip:new()
    toolTip:initialise()
    toolTip:setVisible(false)
    toolTip:setName(optionText)
    option.toolTip = toolTip

    local text = getText("Tooltip_PynoTweaks") .. " <LINE> "
    local notAvailable = false


    if player:getInventory():containsTypeRecurse("WeldingMask") then
        text = text .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.WeldingMask")
    else
        text = text .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingMask")
        notAvailable = true
    end

    local blowTorch = getBlowTorchWithMostUses(player:getInventory())
    if blowTorch then
        local blowTorchUsesLeft = blowTorch:getDrainableUsesInt()
        if blowTorchUsesLeft >= propaneNeeded then
            text = text .. " <LINE> <RGB:0,1,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUsesLeft .. "/" .. propaneNeeded
        else
            text = text .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUsesLeft .. "/" .. propaneNeeded
            notAvailable = true
        end
    else
        text = text .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0/" .. propaneNeeded
        notAvailable = true
    end

    if SandboxVars.PynoTweaks.UninstallParts then
        local partsToRemove = {}
        for i = 1, vehicle:getPartCount() do
            local part = vehicle:getPartByIndex(i - 1)
            local partId = part:getId()
            -- Looking for all windows, doors (including engine and trunk doors), seats
            if partId:find("^Wind") or partId:find("Door") or partId:find("Seat") then
                if part:getItemType() and not part:getItemType():isEmpty() and part:getInventoryItem() then
                    table.insert(partsToRemove, partId)
                end
            end
        end

        if #partsToRemove > 0 then
            text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_PynoTweaks_Uninstall")
            for _, part in ipairs(partsToRemove) do
                text = text .. " <LINE> <RGB:1,0,0> " .. getText("IGUI_VehiclePart" .. part)
            end
            notAvailable = true
        end
    end

	if CarClampStorageExists(vehicle) and CarClampStorage.Data.CarClamp[tostring(GetCarClampIdByVehicle(vehicle))] then
        text = text .. " <LINE> <LINE> <RGB:1,0,0> " .. getText("Tooltip_PynoTweaks_CarClampUninstall")
        notAvailable = true
    end
    -- che for metal wielding level
    level = player:getPerkLevel(Perks.MetalWelding)
    if level < 2 then
        text = text .. " <LINE> <RGB:1,0,0> " .. getText("Tooltip_PynoTweaks_MetalWeldingLevel" , level)
        notAvailable = true
    else
        text = text .. " <LINE> <RGB:0,1,0> " .. getText("Tooltip_PynoTweaks_MetalWeldingLevel" , level)
    end

    -- check for player survival time (96 h)
    if player:getHoursSurvived() < SandboxVars.PynoTweaks.UninstallPartsHoursSurvived then
        text = text .. " <LINE> <RGB:1,0,0> " .. getText("Tooltip_PynoTweaks_SurvivalTime" , math.floor(player:getHoursSurvived()/24))
        notAvailable = true
    else
        text = text .. " <LINE> <RGB:0,1,0> " .. getText("Tooltip_PynoTweaks_SurvivalTime" , math.floor(player:getHoursSurvived()/24))
    end

    -- check for player is not melting a claimed vehicle (AVCS mod)
	local checkResult = AVCS.checkPermission(player, vehicle)
	if type(checkResult) ~= "boolean" then
	    if checkResult.permissions == false then
            text = text .. " <LINE> <RGB:1,0,0> " .. getText("Tooltip_PynoTweaks_VehicleClaimed")
            notAvailable = true
        end
    end

    toolTip.description = text
    option.notAvailable = notAvailable
end

function PynoTweaks.UI.changeFillFuelMenu(source, player, context)
    if not SandboxVars.PynoTweaks.EnableFuelLimitation then return end
    local option = context:getOptionFromName(getText("ContextMenu_TakeGasFromPump"))
    if not option then return end

    if SandboxVars.PynoTweaks.FuelLimitationFactionTier > 0 then
        local factions = player:getModData().missionProgress.Factions
        if not factions or not factions[1] or factions[1].tierlevel < SandboxVars.PynoTweaks.FuelLimitationFactionTier then
            option.subOption = nil
            option.notAvailable = true
            local tooltip = ISWorldObjectContextMenu.addToolTip()
            local tiername = getText("IGUI_Factions_Resistenza_Tier" .. SandboxVars.PynoTweaks.FuelLimitationFactionTier)
            tooltip:setName(getText("ContextMenu_FuelLimitationTitle"))
            tooltip.description = getText("ContextMenu_FuelLimitationDescriptionTier", tiername)
            option.toolTip = tooltip
            return
        end
    end
    
    if SandboxVars.PynoTweaks.FuelLimitationFactionName == "off" then return end

    local faction = Faction.getPlayerFaction(player)
    if not faction or faction:getName() ~= SandboxVars.PynoTweaks.FuelLimitationFactionName then
        option.subOption = nil
        option.notAvailable = true
        local tooltip = ISWorldObjectContextMenu.addToolTip()
        tooltip:setName(getText("ContextMenu_FuelLimitationTitle"))
        tooltip.description = getText("ContextMenu_FuelLimitationDescription", SandboxVars.PynoTweaks.FuelLimitationFactionName)
        option.toolTip = tooltip
        return
    end
end

-- Wrap the original function
if not PynoTweaks.UI.defaultMenuOutsideVehicle then
    PynoTweaks.UI.defaultMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle
end

if not PynoTweaks.UI.defaultDoFillFuelMenu then
    PynoTweaks.UI.defaultDoFillFuelMenu = ISWorldObjectContextMenu.doFillFuelMenu
end

-- Override the original function
function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
    PynoTweaks.UI.defaultMenuOutsideVehicle(player, context, vehicle, test)
    PynoTweaks.UI.addOptionToMenuOutsideVehicle(getSpecificPlayer(player), context, vehicle)
end

function ISWorldObjectContextMenu.doFillFuelMenu(source, playerNum, context)
    PynoTweaks.UI.defaultDoFillFuelMenu(source, playerNum, context)
    PynoTweaks.UI.changeFillFuelMenu(source, getSpecificPlayer(playerNum), context)
end

function CarClampStorageExists(vehicle)
    if not vehicle then return false end
	if CarClampStorage.Data.CarClamp == nil then return false end
	if CarClampStorage.Data.CarClamp == {} then return false end
	if type(CarClampStorage.Data.CarClamp) ~= "table" then return false end
    return true
end