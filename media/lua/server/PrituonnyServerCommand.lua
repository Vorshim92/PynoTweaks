if isClient() then return end
local Commands = {}
function Commands.onSendPrituonny(player, args)
    local clickedPlayer = getPlayerByOnlineID(args.player)
    ModData.getOrCreate("Prituonny")[clickedPlayer:getUsername()] = {super = false}
    ModData.transmit("Prituonny")
    sendServerCommand(clickedPlayer, "Prituonny", "onSendPrituonny", args)
end

function Commands.onRemovePrituonny(player, args)
    local clickedPlayer = getPlayerByOnlineID(args.player)
    local PriTuonnyMod = ModData.getOrCreate("Prituonny")
    if PriTuonnyMod[clickedPlayer:getUsername()].super == true then
        sendServerCommand(clickedPlayer, "Prituonny", "onRemoveSuperPrituonny", args)
    end
    PriTuonnyMod[clickedPlayer:getUsername()] = nil
    ModData.transmit("Prituonny")
    sendServerCommand(clickedPlayer, "Prituonny", "onRemovePrituonny", args)
end
function Commands.onSuperPrituonny(player, args)
    local clickedPlayer = getPlayerByOnlineID(args.player)
    ModData.getOrCreate("Prituonny")[clickedPlayer:getUsername()] = {super = true}
    ModData.transmit("Prituonny")
    sendServerCommand(clickedPlayer, "Prituonny", "onSuperPrituonny", args)
end
function Commands.onRemoveSuperPrituonny(player, args)
    local clickedPlayer = getPlayerByOnlineID(args.player)
    ModData.getOrCreate("Prituonny")[clickedPlayer:getUsername()] = {super = false}
    ModData.transmit("Prituonny")
    sendServerCommand(clickedPlayer, "Prituonny", "onRemoveSuperPrituonny", args)
end



Events.OnClientCommand.Add(function(module, command, player, args)
	if module == 'Prituonny' and Commands[command] then
		args = args or {}
		Commands[command](player, args)
	end
end)