require 'lua_server_commands'

LuaServerCommands.register('killyno', function(author, command, args)
    -- Check if the correct number of arguments are passed.
    if #args ~= 3 then
        return '/killyno [player] [kills] [hours]'
    end

    -- NOTE: The helper only becomes visible in global scope when the first lua server command is fired.
    --       Make sure to reference the helper inside of the command's handler function.
    local helper = LuaServerCommandHelper

    -- Check admin
    local admin = helper.getPlayerByUsername(author)
    if admin:getAccessLevel() ~= "Admin" then return 'Voleeeviii' end

    -- Attempt to resolve the player using the helper method.
    local username = args[1]
    local player = helper.getPlayerByUsername(username)
    if player == nil then return 'Player not found: '..tostring(username) end

    local kills = tonumber(args[2])
    if kills == nil or kills < 0 then return 'Invalid kills: '..tostring(args[2]) end
    local lifeTime = tonumber(args[3])
    if lifeTime == nil or lifeTime < 0 then return 'Invalid hours: '..tostring(args[3]) end
    local steamID = player:getSteamID()

    local packet = {}
    packet.kills = kills
    packet.hours = lifeTime
    packet.steamID = steamID
    sendServerCommand(player, "Pyno", "killyno", packet)

    return 'Kills and Survived hours set!'
end)