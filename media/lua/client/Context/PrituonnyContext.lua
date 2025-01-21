local Commands = {}
local Prituonny = {}
Prituonny.CenterX = 19795
Prituonny.CenterY = 15895
Prituonny.Z = 0
local specificArea = SandboxVars.PynoTweaks.SpecificAreaXY ~= "" and luautils.split(SandboxVars.PynoTweaks.SpecificAreaXY, ";") or nil
Prituonny.Area = specificArea and {x1 = tonumber(specificArea[1]), y1 = tonumber(specificArea[2]), x2 = tonumber(specificArea[3]), y2 = tonumber(specificArea[4])} or {x1 = 19791, y1 = 15890, x2 = 19799, y2 = 15899}

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
        if not prituonnyList[clickedPlayer:getUsername()] then
            context:addOption(getText("ContextMenu_SendPrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onSendPrituonny)
            context:addOption(getText("ContextMenu_SuperPrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onSuperPrituonny)
        elseif prituonnyList[clickedPlayer:getUsername()].super == true then
            context:addOption(getText("ContextMenu_RemoveSuperPrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onRemoveSuperPrituonny)
            context:addOption(getText("ContextMenu_RemovePrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onRemovePrituonny)
        else 
            context:addOption(getText("ContextMenu_RemovePrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onRemovePrituonny)
            context:addOption(getText("ContextMenu_SuperPrituonny", clickedPlayer:getDisplayName()), clickedPlayer, Prituonny.onSuperPrituonny)
        end
    end
end

Prituonny.onSendPrituonny = function(clickedPlayer)
    sendClientCommand("Prituonny", "onSendPrituonny", {player = clickedPlayer:getOnlineID()})
end

Prituonny.onRemovePrituonny = function(clickedPlayer)
    sendClientCommand("Prituonny", "onRemovePrituonny", {player = clickedPlayer:getOnlineID()})
end
Prituonny.onSuperPrituonny = function(clickedPlayer)
    sendClientCommand("Prituonny", "onSuperPrituonny", {player = clickedPlayer:getOnlineID()})
end
Prituonny.onRemoveSuperPrituonny = function(clickedPlayer)
    sendClientCommand("Prituonny", "onRemoveSuperPrituonny", {player = clickedPlayer:getOnlineID()})
end



local function SuperPrituonny(tick)
    local player = getPlayer()
    local playerX, playerY = player:getX(), player:getY()
    -- se le coordinate del player risultano essere fuori le coordinate della prituonny lo ritippiamo dentro
    if (playerX < Prituonny.Area.x1) or (playerX > Prituonny.Area.x2) or (playerY < Prituonny.Area.y1) or (playerY > Prituonny.Area.y2) then
        Commands.onSendPrituonny(player)
        -- audio EH VOLEVI
        if Prituonny.zebbyno then
            Prituonny.zebbyno:stop();
        end
        Prituonny.zebbyno = getSoundManager():PlaySound("zebbyno", false, 1.0);
    end
end

Prituonny.OnCreatePlayer = function(playerIndex, player)
    local username = player:getUsername()
    local prituonnyList = ModData.getOrCreate("Prituonny")
    if prituonnyList[username] then
        player:setX(Prituonny.CenterX)
        player:setY(Prituonny.CenterY)
        player:setZ(Prituonny.Z)
        player:setLx(Prituonny.CenterX)
        player:setLy(Prituonny.CenterY)
        if prituonnyList[username].super == true then
            Events.OnTick.Add(SuperPrituonny)
        end
    end
end

function Commands.onSendPrituonny(args)
    local clickedPlayer = getPlayer()
    -- local prituonnyList = ModData.getOrCreate("Prituonny")
    clickedPlayer:setX(Prituonny.CenterX)
    clickedPlayer:setY(Prituonny.CenterY)
    clickedPlayer:setZ(Prituonny.Z)
    clickedPlayer:setLx(Prituonny.CenterX)
    clickedPlayer:setLy(Prituonny.CenterY)
    -- print("[onSendPrituonny] IsPrituonny: " .. tostring(prituonnyList[clickedPlayer:getUsername()]))
end

function Commands.onRemovePrituonny(args)
    -- local clickedPlayer = player
    -- local prituonnyList = ModData.getOrCreate("Prituonny")
    -- prituonnyList[clickedPlayer:getUsername()] = false
    -- ModData.transmit("Prituonny")
    -- print("[onRemovePrituonny] IsPrituonny: " .. tostring(prituonnyList[clickedPlayer:getUsername()]))
    getPlayer():Say("SONO LIBEROOOOOO!!!!")
end



function Commands.onRemoveSuperPrituonny(args)
    -- local clickedPlayer = player
    -- local prituonnyList = ModData.getOrCreate("Prituonny")
    -- prituonnyList[clickedPlayer:getUsername()] = false
    -- ModData.transmit("Prituonny")
    -- print("[onRemovePrituonny] IsPrituonny: " .. tostring(prituonnyList[clickedPlayer:getUsername()]))
    getPlayer():Say("SONO SUPER LIBEROOOOOO!!!!")
    Events.OnTick.Remove(SuperPrituonny)
end


function Commands.onSuperPrituonny(args)
    Events.OnTick.Add(SuperPrituonny)
end

Prituonny.OnServerCommand = function(module, command, args)
    if module == 'Prituonny' and Commands[command] then
        args = args or {}
        Commands[command](args)
    end
end
Events.OnCreatePlayer.Add(Prituonny.OnCreatePlayer);
Events.OnFillWorldObjectContextMenu.Add(Prituonny.OnFillWorldObjectContextMenu)
Events.OnServerCommand.Add(Prituonny.OnServerCommand)