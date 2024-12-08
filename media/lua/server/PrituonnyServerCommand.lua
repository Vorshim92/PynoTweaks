local Commands = {}
function Commands.onSendPrituonny(player, args)
    local clickedPlayer = getPlayerByOnlineID(args.player)
    local prituonnyList = ModData.getOrCreate("Prituonny")
    prituonnyList[clickedPlayer:getUsername()] = true
    ModData.add("Prituonny", prituonnyList)
    ModData.transmit("Prituonny")
    sendServerCommand(clickedPlayer, "Prituonny", "onSendPrituonny", args)
end

function Commands.onRemovePrituonny(player, args)
    local clickedPlayer = getPlayerByOnlineID(args.player)
    local prituonnyList = ModData.getOrCreate("Prituonny")
    prituonnyList[clickedPlayer:getUsername()] = false
    ModData.add("Prituonny", prituonnyList)
    ModData.transmit("Prituonny")
    sendServerCommand(clickedPlayer, "Prituonny", "onRemovePrituonny", args)
end

Events.OnClientCommand.Add(function(module, command, player, args)
	if module == 'Prituonny' and Commands[command] then
		args = args or {}
		Commands[command](player, args)
	end
end)