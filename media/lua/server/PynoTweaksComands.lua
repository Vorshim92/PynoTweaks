require 'lua_server_commands'

LuaServerCommands.register('killyno', function(author, command, args)
--not isAdmin() and
    if  not author:getAccessLevel() ~= "None" then return 'usable only by adminos' end
    -- Check if the correct number of arguments are passed.
    if #args ~= 2 then
        return '/killyno [kills] [hours]'
    end

    -- NOTE: The helper only becomes visible in global scope when the first lua server command is fired.
    --       Make sure to reference the helper inside of the command's handler function.
    local helper = LuaServerCommandHelper

    -- Attempt to resolve the player using the helper method.
    local username = args[1]
    local player = helper.getPlayerByUsername(username)
    if player == nil then return 'Player not found: '..tostring(username) end
    local kills = tonumber(args[2])
    local lifeTime = tonumber(args[3])
    player:setZombieKills(kills)
    player:setHoursSurvived(lifeTime)
    player:Say("Daghe")

    return 'Kills and Survived time setted!'
end)