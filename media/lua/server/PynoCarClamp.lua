--if isClient() then return end

CarClampStorage = CarClampStorage or {};
CarClampStorage.Data = CarClampStorage.Data or {};

local CarClampCommands = {}
local Commands = {}

function Commands.onSendCommandCheatClearCarClampModData(player, vehicleInfo)
	for key, value in pairs(CarClampStorage.Data.CarClamp) do
		if key ~= nil then
			CarClampStorage.Data.CarClamp[key] = false;
		end
	end
	ModData.add("CarClamp", CarClampStorage.Data.CarClamp)
	ModData.transmit("CarClamp")
end

function Commands.onAddCarClamp(player, vehicleInfo)
	print("Adding car clamp")
	local vehicle = getVehicleById(vehicleInfo.ClientId)
	local commandArgs = { key = tostring(vehicleInfo.CarClampId), value = true }
	CarClampStorage.Data.CarClamp[vehicleInfo.CarClampId] = commandArgs.value
	sendServerCommand("CarClamp", "UpdateCarClampData", commandArgs)
	ModData.add("CarClamp", CarClampStorage.Data.CarClamp)
	ModData.transmit("CarClamp")
	vehicle:shutOff()
end

function Commands.onRemoveCarClamp(player, vehicleInfo)
	print("Removing car clamp")
	local vehicle = getVehicleById(vehicleInfo.ClientId)
	local commandArgs = { key = tostring(vehicleInfo.CarClampId), value = false }
	CarClampStorage.Data.CarClamp[vehicleInfo.CarClampId] = commandArgs.value
	sendServerCommand("CarClamp", "UpdateCarClampData", commandArgs)
	ModData.add("CarClamp", CarClampStorage.Data.CarClamp)
	ModData.transmit("CarClamp")
	vehicle:shutOff()
end

CarClampCommands.OnClientCommand = function(module, command, player, args)
	if module == 'CarClamp' and Commands[command] then
		Commands[command](player, args)
	end
end

Events.OnClientCommand.Add(CarClampCommands.OnClientCommand)

local function initGlobalModData(isNewGame)
    CarClampStorage.Data.CarClamp = ModData.getOrCreate("CarClamp");
	ModData.transmit("CarClamp")
end

Events.OnInitGlobalModData.Add(initGlobalModData);