if isServer() then
        require 'LuaCommands/LuaCommands';
        require "Server"

    -- Command: killyno
    local CMD_NAME_killyno = 'killyno';

    local function onServerCommand_killyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args ~= 3 then
            return '/luacmd killyno [player] [kills] [hours]'
        end

        -- Reference the helper inside the command's handler function.
        local helper = LuaServerCommandHelper

        -- Check admin
        local admin = helper.getPlayerByUsername(author)
        if admin:getAccessLevel() ~= "Admin" then
            return 'Tonno cattivo'
        end

        -- Attempt to resolve the player using the helper method.
        local username = args[1]
        local player = helper.getPlayerByUsername(username)
        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local kills = tonumber(args[2])
        if kills == nil or kills < 0 then
            return 'Invalid kills: ' .. tostring(args[2])
        end
        local lifeTime = tonumber(args[3])
        if lifeTime == nil or lifeTime < 0 then
            return 'Invalid hours: ' .. tostring(args[3])
        end
        local steamID = player:getOnlineID()

        local packet = {}
        packet.kills = kills
        packet.hours = lifeTime
        packet.steamID = steamID
        sendServerCommand(player, "Pyno", "killyno", packet)

        return 'Kills and Survived hours set!'
    end

    LuaCommands.register(CMD_NAME_killyno, function(author, command, args)
        return onServerCommand_killyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_killyno);


    -- Command: reppyno
    local CMD_NAME_reppyno = 'reppyno';

    local function onServerCommand_reppyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args ~= 4 then
            return '/luacmd reppyno [player] [set/add/remove] [factioncode] [amount]'
        end

        local helper = LuaServerCommandHelper

        -- Check admin
        local admin = helper.getPlayerByUsername(author)
        if admin:getAccessLevel() ~= "Admin" then
            return 'Tonno cattivo'
        end

        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local setOrAdd = args[2]
        if setOrAdd ~= "set" and setOrAdd ~= "add" and setOrAdd ~= "remove" then
            return 'Invalid set/add/remove: ' .. tostring(setOrAdd)
        end

        local factioncode = args[3]
        if factioncode == nil then
            return 'Invalid factioncode'
        end

        local amount = tonumber(args[4])
        if amount == nil or amount < 0 then
            return 'Invalid amount: ' .. tostring(args[4])
        end

        local packet = {}
        packet.setOrAdd = setOrAdd
        packet.factioncode = factioncode
        packet.amount = amount
        packet.steamID = player:getOnlineID()
        sendServerCommand(player, "Pyno", "reppyno", packet)

        return 'EDDAAJEE GIUSEPPEEE!!1!11!!11+1=1!1=1+11!!!'
    end

    LuaCommands.register(CMD_NAME_reppyno, function(author, command, args)
        return onServerCommand_reppyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_reppyno);


    -- Command: questyno
    local CMD_NAME_questyno = 'questyno';

    local function onServerCommand_questyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args ~= 3 then
            return '/luacmd questyno [player] [add/complete/backup/remove] [questID]'
        end

        local helper = LuaServerCommandHelper

        -- Check admin
        local admin = helper.getPlayerByUsername(author)
        if admin:getAccessLevel() ~= "Admin" then
            return 'Tonno cattivo'
        end

        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local addOrComplete = args[2]
        if addOrComplete ~= "add" and addOrComplete ~= "complete" and addOrComplete ~= "backup" and addOrComplete ~= "remove" then
            return 'Invalid add/complete/backup/remove: ' .. tostring(addOrComplete)
        end

        local questID = args[3]
        if questID == nil then
            return 'Invalid questID'
        end

        local packet = {}
        packet.addOrComplete = addOrComplete
        packet.questID = questID
        packet.steamID = player:getOnlineID()
        sendServerCommand(player, "Pyno", "questyno", packet)

        return 'EDDAAJEE GIUSEPPEEE!!1!11!!11+1=1!1=1+11!!!'
    end

    LuaCommands.register(CMD_NAME_questyno, function(author, command, args)
        return onServerCommand_questyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_questyno);


    -- Command: fixxyno
    local CMD_NAME_fixxyno = 'fixxyno';

    local function onServerCommand_fixxyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args < 2 then
            return '/luacmd fixxyno [player] [command]'
        end

        local helper = LuaServerCommandHelper

        -- Check admin
        local admin = helper.getPlayerByUsername(author)
        if admin:getAccessLevel() ~= "Admin" then
            return 'Tonno cattivo'
        end

        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local commandArg = args[2]

        if commandArg == "loadbackup" then
            local id = player:getUsername()
            print("[Commands.sendData] zSOUL QUEST SYSTEM - Forcing loading backup for Player ID: " .. id)
            local filepath = "/Backup/SFQuest_" .. id .. ".txt"
            local filereader = getFileReader(filepath, false)
            if filereader then
                local temp = {}
                local line = filereader:readLine()
                while line ~= nil do
                    table.insert(temp, line)
                    line = filereader:readLine()
                end
                filereader:close()
                local newargs = { id = id, data = temp, checkDefaults = true }
                print("[Commands.sendData] zSOUL QUEST SYSTEM - Requested quest data for player " .. id .. " sent.")
                sendServerCommand('SFQuest', "setProgress", newargs)
            end
        elseif commandArg == "rerolldaily" then
            local packet = {}
            packet.steamID = player:getOnlineID()
            packet.command = "rerolldaily"
            sendServerCommand(player, "Pyno", "fixxyno", packet)
        elseif commandArg == "lincolnreed" then
            local packet = {}
            packet.steamID = player:getOnlineID()
            packet.command = "lincolnreed"
            sendServerCommand(player, "Pyno", "fixxyno", packet)
        elseif commandArg == "updatefrequency" then
            if #args ~= 4 then
                return '/luacmd fixxyno [player] [updatefrequency] [oldfrequency] [newfrequency]'
            end
            local packet = {}
            packet.steamID = player:getOnlineID()
            packet.command = "updatefrequency"
            packet.oldfrequency = args[3]
            packet.newfrequency = args[4]
            sendServerCommand(player, "Pyno", "fixxyno", packet)
        else
            return 'Invalid command: ' .. tostring(commandArg)
        end

        return 'Fixxyno command executed!'
    end

    LuaCommands.register(CMD_NAME_fixxyno, function(author, command, args)
        return onServerCommand_fixxyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_fixxyno);



    --Command: libryno
    local CMD_NAME_libryno = 'libryno';

    local function onServerCommand_libryno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args < 3 then
            return '/luacmd libryno [player] [restore/delete/backup/check] [readOnce/timed/bkp1/bkp2]'
        end

        local helper = LuaServerCommandHelper
        local admin = helper.getPlayerByUsername(author)
        if admin:getAccessLevel() ~= "Admin" then
            return 'Tonno cattivo'
        end

        


        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local commandArg = args[2]

            -- Definisci le opzioni valide per modData_name
        local validModDataNames = {
            readOnce = true,
            timed = true,
            bkp1 = true,
            bkp2 = true
        }
        if not validModDataNames[args[3]] then
            return '/luacmd libryno [player] [restore/delete/backup/check] [readOnce/timed/bkp1/bkp2]'
        end

        if commandArg == "restore" or commandArg == "delete" or commandArg == "backup" or commandArg == "check" then
            if #args ~= 3 then
                return '/luacmd libryno [player] [restore/delete/backup/check] [readOnce/timed/bkp1/bkp2]'
            end
            local packet = {}
            packet.steamID = player:getOnlineID()
            packet.command = commandArg
            packet.modData_name = args[3]
            -- Aggiungi debug per verificare il contenuto del pacchetto
            print("Invio comando 'libryno' a " .. player:getUsername())
            print("Packet:", "steamID=" .. tostring(packet.steamID), "command=" .. packet.command, "modData_name=" .. packet.modData_name)
        
            sendServerCommand(player, "Pyno", "libryno", packet)
        else
            return 'Invalid command: ' .. tostring(commandArg)
        end
        return 'Libryno command executed!'
    end

    LuaCommands.register(CMD_NAME_libryno, function(author, command, args)
        return onServerCommand_libryno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_libryno);



    -- Command: zombyno
    local CMD_NAME_zombyno = 'zombyno';

    local function onServerCommand_zombyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args ~= 1 then
            return '/luacmd zombyno [conto]'
        end

        local helper = LuaServerCommandHelper

        local player = helper.getPlayerByUsername(author)

        if player == nil then
            return 'Player not found: ' .. tostring(author)
        end

        local packet = {}
        packet.command = args[1]
        packet.steamID = player:getOnlineID()
        sendServerCommand(player, "Pyno", "zombyno", packet)

        return 'Command executed.'
    end

    LuaCommands.register(CMD_NAME_zombyno, function(author, command, args)
        return onServerCommand_zombyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_zombyno);

end