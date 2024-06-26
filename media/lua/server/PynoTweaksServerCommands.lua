require 'lua_server_commands'
require "Server"

LuaServerCommands.register('killyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args ~= 3 then
        return '/luacmd killyno [player] [kills] [hours]'
    end

    -- NOTE: The helper only becomes visible in global scope when the first lua server command is fired.
    --       Make sure to reference the helper inside of the command's handler function.
    local helper = LuaServerCommandHelper

    -- Check admin
    local admin = helper.getPlayerByUsername(author)
    if admin:getAccessLevel() ~= "Admin" then return 'Tonno cattivo' end

    -- Attempt to resolve the player using the helper method.
    local username = args[1]
    local player = helper.getPlayerByUsername(username)
    if player == nil then return 'Player not found: ' .. tostring(username) end

    local kills = tonumber(args[2])
    if kills == nil or kills < 0 then return 'Invalid kills: ' .. tostring(args[2]) end
    local lifeTime = tonumber(args[3])
    if lifeTime == nil or lifeTime < 0 then return 'Invalid hours: ' .. tostring(args[3]) end
    local steamID = player:getOnlineID()

    local packet = {}
    packet.kills = kills
    packet.hours = lifeTime
    packet.steamID = steamID
    sendServerCommand(player, "Pyno", "killyno", packet)

    return 'Kills and Survived hours set!'
end)

LuaServerCommands.register('reppyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args ~= 4 then
        return '/luacmd reppyno [player] [set/add/remove] [factioncode] [amount]'
    end

    local helper = LuaServerCommandHelper

    -- Check admin
    local admin = helper.getPlayerByUsername(author)
    if admin:getAccessLevel() ~= "Admin" then return 'Tonno cattivo' end

    local username = args[1]
    local player = helper.getPlayerByUsername(username)

    if player == nil then return 'Player not found: ' .. tostring(username) end
    --local access_level = player:getAccessLevel()
    --if access_level ~= "Admin" then return 'Voleeeviii' end

    local setOrAdd = args[2]
    if setOrAdd ~= "set" and setOrAdd ~= "add" and setOrAdd ~= "remove" then
        return 'Invalid set/add/remove: ' ..
            tostring(setOrAdd)
    end

    local factioncode = args[3]
    if factioncode == nil then return 'Invalid factioncode' end

    local amount = tonumber(args[4])
    if amount == nil or amount < 0 then return 'Invalid amount: ' .. tostring(args[3]) end

    local packet = {}
    packet.setOrAdd = setOrAdd
    packet.factioncode = factioncode
    packet.amount = amount
    packet.steamID = player:getOnlineID()
    sendServerCommand(player, "Pyno", "reppyno", packet)

    return 'EDDAAJEE GIUSEPPEEE!!1!11!!11+1=1!1=1+11!!!'
end)

LuaServerCommands.register('questyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args ~= 3 then
        return '/luacmd questyno [player] [add/complete/backup/remove] [questID]'
    end

    local helper = LuaServerCommandHelper

    -- Check admin
    local admin = helper.getPlayerByUsername(author)
    if admin:getAccessLevel() ~= "Admin" then return 'Tonno cattivo' end

    local username = args[1]
    local player = helper.getPlayerByUsername(username)

    if player == nil then return 'Player not found: ' .. tostring(username) end
    --local access_level = player:getAccessLevel()
    --if access_level ~= "Admin" then return 'Voleeeviii' end

    local addOrComplete = args[2]
    if addOrComplete ~= "add" and addOrComplete ~= "complete" and addOrComplete ~= "backup" and addOrComplete  ~= "remove" then
        return
            'Invalid add/complete/backup/remove: ' .. tostring(addOrComplete)
    end

    local questID = args[3]
    if questID == nil then return 'Invalid questID' end

    local packet = {}
    packet.addOrComplete = addOrComplete
    packet.questID = questID
    packet.steamID = player:getOnlineID()
    sendServerCommand(player, "Pyno", "questyno", packet)

    return 'EDDAAJEE GIUSEPPEEE!!1!11!!11+1=1!1=1+11!!!'
end)

LuaServerCommands.register('fixxyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args < 2 then
        return '/luacmd fixxyno [player] [command]'
    end

    local helper = LuaServerCommandHelper

    -- Check admin
    local admin = helper.getPlayerByUsername(author)
    if admin:getAccessLevel() ~= "Admin" then return 'Tonno cattivo' end

    local username = args[1]
    local player = helper.getPlayerByUsername(username)

    if player == nil then return 'Player not found: ' .. tostring(username) end
    --local access_level = player:getAccessLevel()
    --if access_level ~= "Admin" then return 'Voleeeviii' end
    if args[2] == "loadbackup" then
        local id = player:getUsername()
        print("[Commands.sendData] zSOUL QUEST SYSTEM - Forcing loading backup for Player ID: " .. id);
        local filepath = "/Backup/SFQuest_" .. id .. ".txt";
        local filereader = getFileReader(filepath, false);
        if filereader then
            local temp = {};
            local line = filereader:readLine();
            while line ~= nil do
                table.insert(temp, line);
                line = filereader:readLine();
            end
            filereader:close();
            local newargs = { id = id, data = temp, checkDefaults = true };
            print("[Commands.sendData] zSOUL QUEST SYSTEM - Requested quest data for player " .. id .. " sent.");
            sendServerCommand('SFQuest', "setProgress", newargs);
        end;
    elseif args[2] == "rerolldaily" then
        local packet = {}
        packet.steamID = player:getOnlineID()
        packet.command = "rerolldaily"
        sendServerCommand(player, "Pyno", "fixxyno", packet)
    elseif args[2] == "lincolnreed" then
        local packet = {}
        packet.steamID = player:getOnlineID()
        packet.command = "lincolnreed"
        sendServerCommand(player, "Pyno", "fixxyno", packet)
    elseif args[2] == "updatefrequency" then
        if #args ~= 4 then
            return '/luacmd fixxyno [player] [updatefrequency] [oldfrequency] [newfrequency]'
        end
        local packet = {}
        packet.steamID = player:getOnlineID()
        packet.command = "updatefrequency"
        packet.oldfrequency = args[3]
        packet.newfrequency = args[4]
        sendServerCommand(player, "Pyno", "fixxyno", packet)
    end
    return 'Fixxyno fixxano ano fixato!'
end)

-- player cmd, kill zombies count
LuaServerCommands.register('zombyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args ~= 1 then
        return '/luacmd zombyno [conto]'
    end

    local helper = LuaServerCommandHelper

    local player = helper.getPlayerByUsername(author)

    if player == nil then return 'Player not found: ' .. tostring(author) end

    local packet = {}
    packet.command = args[1]
    packet.steamID = player:getOnlineID()
    sendServerCommand(player, "Pyno", "zombyno", packet)

    return 'Comando eseguito.'
end)