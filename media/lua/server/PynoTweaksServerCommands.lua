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
    --if admin:getAccessLevel() ~= "Admin" then return 'Voleeeviii' end

    -- Attempt to resolve the player using the helper method.
    local username = args[1]
    local player = helper.getPlayerByUsername(username)
    if player == nil then return 'Player not found: '..tostring(username) end

    local kills = tonumber(args[2])
    if kills == nil or kills < 0 then return 'Invalid kills: '..tostring(args[2]) end
    local lifeTime = tonumber(args[3])
    if lifeTime == nil or lifeTime < 0 then return 'Invalid hours: '..tostring(args[3]) end
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
    if #args ~= 3 then
        return '/luacmd reppyno [player] [set/add] [amount]'
    end

    local helper = LuaServerCommandHelper
    local username = args[1]
    local player = helper.getPlayerByUsername(username)

    if player == nil then return 'Player not found: '..tostring(username) end

    local setOrAdd = args[2]
    if setOrAdd ~= "set" and setOrAdd ~= "add" then return 'Invalid set/add: '..tostring(setOrAdd) end

    local amount = tonumber(args[3])
    if amount == nil or amount < 0 then return 'Invalid amount: '..tostring(args[3]) end

    local packet = {}
    packet.setOrAdd = setOrAdd
    packet.amount = amount
    packet.steamID = player:getOnlineID()
    sendServerCommand(player, "Pyno", "reppyno", packet)

    return 'EDDAAJEE GIUSEPPEEE!!1!11!!11+1=1!1=1+11!!!'
end)

LuaServerCommands.register('questyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args ~= 3 then
        return '/luacmd questyno [player] [add/complete] [questID]'
    end

    local helper = LuaServerCommandHelper
    local username = args[1]
    local player = helper.getPlayerByUsername(username)

    if player == nil then return 'Player not found: '..tostring(username) end

    local addOrComplete = args[2]
    if addOrComplete ~= "add" and addOrComplete ~= "complete" then return 'Invalid add/complete: '..tostring(addOrComplete) end

    local questID = args[3]
    if questID == nil then return 'Invalid questID: '.. args[3] end

    local packet = {}
    packet.addOrComplete = addOrComplete
    packet.questID = questID
    packet.steamID = player:getOnlineID()
    sendServerCommand(player, "Pyno", "questyno", packet)

    return 'EDDAAJEE GIUSEPPEEE!!1!11!!11+1=1!1=1+11!!!'
end)