Prituonny = {}
Prituonny.x = 19795
Prituonny.y = 15895
Prituonny.z = 0
Prituonny.OnFillInventoryObjectContextMenu = function(player, context, worldobjects, test)
    local playerObj = getSpecificPlayer(player)
    if not playerObj:getAccessLevel() or playerObj:getAccessLevel() == "None" then return end

    if instanceof(worldobjects, "IsoPlayer") and (worldobjects ~= playerObj) then
        clickedPlayer = v;
    end

    if clickedPlayer and clickedPlayer ~= playerObj and isClient() then
        if not clickedPlayer:getModData().IsPrituonny then
            local option = context:addOption(getText("ContextMenu_SendPrituonny", clickedPlayer:getDisplayName()), Prituonny.onSendPrituonny, clickedPlayer)
        else 
            local option = context:addOption(getText("ContextMenu_RemovePrituonny", clickedPlayer:getDisplayName()), Prituonny.onRemovePrituonny, clickedPlayer)
        end
    end
end

Prituonny.onSendPrituonny = function(player, clickedPlayer)
    clickedPlayer:getModData().IsPrituonny = true
    clickedPlayer:setX(Prituonny.x)
    clickedPlayer:setY(Prituonny.y)
    clickedPlayer:setZ(Prituonny.z)
end

Prituonny.onRemovePrituonny = function(player, clickedPlayer)
    clickedPlayer:getModData().IsPrituonny = false
end

Prituonny.OnCreatePlayer = function(playerIndex, player)
    if player:getModData().IsPrituonny then
        player:setX(Prituonny.x)
        player:setY(Prituonny.y)
        player:setZ(Prituonny.z)
    end
end

Events.OnCreatePlayer.Add(Prituonny.OnCreatePlayer);
Events.OnFillWorldObjectContextMenu.Add(Prituonny.OnFillWorldObjectContextMenu)