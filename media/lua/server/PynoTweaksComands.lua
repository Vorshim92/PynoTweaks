function killyno(player, args)
    if not isServerAdmin(player) then return end
    local name = args[1]
    local target = getPlayerByUserNameForCommand(name)
    local kills = args[2]
    local lifeTime = args[3]
    target:setZombieKills(kills)
    target:setHoursSurvived(lifeTime)
end

function registerkillyno()
    registerCommand("killyno", killyno)
end

function registerCommand(commandName, commandFunction)
    Commands[commandName] = commandFunction
  end
  
Events.OnGameStart.Add(registerkillyno)