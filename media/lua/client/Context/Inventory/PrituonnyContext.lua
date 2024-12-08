local Commands = {}
Prituonny = {}
Prituonny.x = 19795
Prituonny.y = 15895
Prituonny.z = 0

Prituonny.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
    local playerObj = getSpecificPlayer(player)
    local clickedPlayer = nil
    if not playerObj:getAccessLevel() or playerObj:getAccessLevel() == "None" then return end
    for i,v in ipairs(worldobjects) do
        if v:getSquare() then
            for x=v:getSquare():getX()-1,v:getSquare():getX()+1 do
                for y=v:getSquare():getY()-1,v:getSquare():getY()+1 do
                    local sq = getCell():getGridSquare(x,y,v:getSquare():getZ());
                    if sq then
                        for i=0,sq:getMovingObjects():size()-1 do
                            local o = sq:getMovingObjects():get(i)
                            if instanceof(o, "IsoPlayer") and (o ~= playerObj) then
                                clickedPlayer = o
                            end
                        end
                    end
                end
            end
        end
    end

    if clickedPlayer and clickedPlayer ~= playerObj and isClient() then
        local prituonnyList = ModData.getOrCreate("Prituonny")
        if not prituonnyList[clickedPlayer:getOnlineID()] then
            local option = context:addOption(getText("ContextMenu_SendPrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onSendPrituonny)
        else 
            local option = context:addOption(getText("ContextMenu_RemovePrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onRemovePrituonny)
        end
    end
end

Prituonny.onSendPrituonny = function(clickedPlayer)
    sendClientCommand("Prituonny", "onSendPrituonny", {player = clickedPlayer:getOnlineID()})
end

Prituonny.onRemovePrituonny = function(clickedPlayer)
    sendClientCommand("Prituonny", "onRemovePrituonny", {player = clickedPlayer:getOnlineID()})
end

Prituonny.OnServerCommand = function(module, command, player, args)
    if module == 'Prituonny' and Commands[command] then
        args = args or {}
        Commands[command](player, args)
    end
end

Prituonny.OnCreatePlayer = function(playerIndex, player)
    local prituonnyList = ModData.getOrCreate("Prituonny")
    if prituonnyList[player:getOnlineID()] then
        player:setX(Prituonny.x)
        player:setY(Prituonny.y)
        player:setZ(Prituonny.z)
        player:setLx(Prituonny.x)
        player:setLy(Prituonny.y)
    end
end

function Commands.onSendPrituonny(player, args)
    local clickedPlayer = getPlayer()
    local prituonnyList = ModData.getOrCreate("Prituonny")
    clickedPlayer:setX(Prituonny.x)
    clickedPlayer:setY(Prituonny.y)
    clickedPlayer:setZ(Prituonny.z)
    clickedPlayer:setLx(Prituonny.x)
    clickedPlayer:setLy(Prituonny.y)
    print("[onSendPrituonny] IsPrituonny: " .. tostring(prituonnyList[clickedPlayer:getOnlineID()]))
end

function Commands.onRemovePrituonny(player, args)
    local clickedPlayer = getPlayer()
    local prituonnyList = ModData.getOrCreate("Prituonny")
    prituonnyList[clickedPlayer:getOnlineID()] = false
    ModData.add("Prituonny", prituonnyList)
    ModData.transmit("Prituonny")
    print("[onRemovePrituonny] IsPrituonny: " .. tostring(prituonnyList[clickedPlayer:getOnlineID()]))
end

Events.OnCreatePlayer.Add(Prituonny.OnCreatePlayer);
Events.OnFillWorldObjectContextMenu.Add(Prituonny.OnFillWorldObjectContextMenu)
Events.OnServerCommand.Add(Prituonny.OnServerCommand)