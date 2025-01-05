local base_ISVehicleMenu_showRadialMenuOutside = ISVehicleMenu.showRadialMenuOutside

updateTime = 0

CarClampStorage = CarClampStorage or {};
CarClampStorage.Data = CarClampStorage.Data or {};
CarClampStorage.ServerCommands = CarClampStorage.ServerCommands or {}

carClampEventHandler = {}

function ISVehicleMenu.onSendCommandAddCarClamp(playerObj, vehicleInfo)
	playerObj:getInventory():RemoveOneOf("CarClamp");
	local keys = playerObj:getInventory():AddItems("Base.KeyPadlock", 1);

	for i=0,keys:size()-1 do
		keys:get(i):setKeyId(vehicleInfo.CarClampId);
	end

    print("Sending command ISVehicleMenu.onAddCarClamp")

    playerObj:Say("Adding car clamp...")
    sendClientCommand(playerObj, 'CarClamp', 'onAddCarClamp', vehicleInfo)
end

function ISVehicleMenu.onSendCommandRemoveCarClamp(playerObj, vehicleInfo)
	local usedKey = playerObj:getInventory():haveThisKeyId(vehicleInfo.CarClampId)
	playerObj:getInventory():Remove(usedKey);
	playerObj:getInventory():AddItems("PynoTweaks.CarClamp", 1);

    print("Sending command ISVehicleMenu.onRemoveCarClamp")

    playerObj:Say("Removing car clamp...")

    sendClientCommand(playerObj, 'CarClamp', 'onRemoveCarClamp', vehicleInfo)
end

function ISVehicleMenu.onSendCommandNoKeyCarClamp(playerObj, vehicleInfo)
    print("No key")
end

function ISVehicleMenu.onSendCommandCheatCarClampGetKey(playerObj, vehicleInfo)
    print("onSendCommandCheatCarClampGetKey")

	local keys = playerObj:getInventory():AddItems("Base.KeyPadlock", 1);

	for i=0,keys:size()-1 do
		keys:get(i):setKeyId(vehicleInfo.CarClampId);
	end
end

function ISVehicleMenu.onSendCommandCheatClearCarClampModData(playerObj, vehicleInfo)
    print("onSendCommandCheatClearCarClampModData")

	sendClientCommand(playerObj, 'CarClamp', 'onSendCommandCheatClearCarClampModData', vehicleInfo)
end

function ISVehicleMenu.showRadialMenuOutside(playerObj)
	base_ISVehicleMenu_showRadialMenuOutside(playerObj)
    if playerObj:getVehicle() then return end

	local playerIndex = playerObj:getPlayerNum()
	local menu = getPlayerRadialMenu(playerIndex)

	local vehicle = ISVehicleMenu.getVehicleToInteractWith(playerObj)

	if vehicle then
		local carClampTable = CarClampStorage.Data.CarClamp

		local vehicleId = vehicle:getId()
		local vehicleInfo = { ClientId = vehicleId, CarClampId = GetCarClampIdByVehicle(vehicle) }

		local playerHasCarClamp = playerObj:getInventory():contains("CarClamp")
		local vehicleHasInstalledCarClamp = carClampTable[tostring(vehicleInfo.CarClampId)]
		if playerHasCarClamp and not vehicleHasInstalledCarClamp then
        	menu:addSlice("Add CarClamp", getTexture("media/textures/item_CarClamp.png"), ISVehicleMenu.onSendCommandAddCarClamp, playerObj, vehicleInfo)
		end

		local usedKey = playerObj:getInventory():haveThisKeyId(vehicleInfo.CarClampId)

		if vehicleHasInstalledCarClamp and (ISVehicleMechanics.cheat or playerObj:getAccessLevel() ~= "None") then
			menu:addSlice("CHEAT Get Car Clamp Key", getTexture("media/ui/Admin_Icon_On.png"), ISVehicleMenu.onSendCommandCheatCarClampGetKey, playerObj, vehicleInfo)
			menu:addSlice("CHEAT Clean Car Clamp Global ModData", getTexture("media/ui/BugIcon.png"), ISVehicleMenu.onSendCommandCheatClearCarClampModData, playerObj, vehicleInfo)
		end

		if vehicleHasInstalledCarClamp and usedKey then
			menu:addSlice("Remove CarClamp", getTexture("media/textures/item_RemoveCarClamp.png"), ISVehicleMenu.onSendCommandRemoveCarClamp, playerObj, vehicleInfo)
		end

		if vehicleHasInstalledCarClamp and not usedKey then
			menu:addSlice("No key for this CarClamp", getTexture("media/textures/item_NoKeyCarClamp.png"), ISVehicleMenu.onSendCommandNoKeyCarClamp, playerObj, vehicleInfo)
		end
	end
end

function CarClampStorage.ServerCommands.UpdateCarClampData(args)
	print("Updating car clamp data...")
    CarClampStorage.Data.CarClamp[args.key] = args.value;
end

carClampEventHandler.OnReceiveGlobalModData = function(tableName, data)
	if CarClampStorage.Data[tableName] and type(data) == "table" then
        if #data > 0 then
            -- if the received data is an array table
            for _, value in ipairs(data) do
                table.insert(CarClampStorage.Data[tableName], value);
            end
        else
            -- if the received data is a key/value table
            for key, value in pairs(data) do
				if key ~= nil then
                	CarClampStorage.Data[tableName][tostring(key)] = value;
				end
            end
        end
    end
end

Events.OnReceiveGlobalModData.Add(carClampEventHandler.OnReceiveGlobalModData);

local function receiveServerCommand(module, command, args)
    if module ~= "CarClamp" then return; end
    if CarClampStorage.ServerCommands[command] then
        CarClampStorage.ServerCommands[command](args);
    end
end

Events.OnServerCommand.Add(receiveServerCommand);

local function initGlobalModData(isNewGame)
    -- clear only if its a client, if it's single-player we dont need to clear
    if isClient() and ModData.exists("CarClamp") then
        -- clear the current copy for a client cause it might be outdated
        ModData.remove("CarClamp");
    end

	ModData.request("CarClamp")
    CarClampStorage.Data.CarClamp = ModData.getOrCreate("CarClamp");
	
	updateTime = getTimestampMs()
end

Events.OnInitGlobalModData.Add(initGlobalModData);

local function processCarClampConstraints(vehicle, shouldPrintOutput)
	updateTime = getTimestampMs()

	if CarClampStorage.Data.CarClamp == nil then return false end
	if CarClampStorage.Data.CarClamp == {} then return false end
	if type(CarClampStorage.Data.CarClamp) ~= "table" then return false end

	if CarClampStorage.Data.CarClamp[tostring(GetCarClampIdByVehicle(vehicle))] then
		if shouldPrintOutput then print("Lock vehicle engine.") end
		vehicle:setMass(constants.vehicleLockMass)
		return true
	else
		local vehicleTowing = vehicle:getVehicleTowing()
		if vehicleTowing and CarClampStorage.Data.CarClamp[tostring(GetCarClampIdByVehicle(vehicleTowing))] then
			if shouldPrintOutput then print("Lock vehicle engine.") end
			vehicle:setMass(constants.vehicleLockMass)
			return true
		else
			if shouldPrintOutput then print("Unlock vehicle engine.") end
			vehicle:setMass(vehicle:getInitialMass())
			vehicle:updateTotalMass()
		end
		return false
	end
end

function onEnterVehicle(character)
	Events.OnPlayerUpdate.Add(onPlayerUpdate)
end

function onExitVehicle(character)
	Events.OnPlayerUpdate.Remove(onPlayerUpdate)
end

Events.OnEnterVehicle.Add(onEnterVehicle)

function onPlayerUpdate(playerObj)
	if updateTime + 150 < getTimestampMs() then
		local vehicle = playerObj:getVehicle()
		if vehicle and vehicle:getSpeed2D() > 0.1 then
			processCarClampConstraints(vehicle, false)
		end
	end	
end