if isServer() then
        require 'LuaCommands/LuaCommands';
        require "Server"
        require("BattleRoyaleSharedZone")
        local json = require("dkjson")

        -- add filepath as a parameter to make function usable also for questsystem
        local function fetchJsonBkp(filepath)
            
            -- Read the JSON backup file
            local content = ""
            local filereader = getFileReader(filepath.."json", false)
            if filereader then
                local lines = {};
                local line = filereader:readLine();
                while line ~= nil do
                    table.insert(lines, line);
                    line = filereader:readLine();
                end
                filereader:close();
            
                content = table.concat(lines, "\n");
                -- Parse the JSON data
                local backupData, pos, err = json.decode(content)
                if err then
                    print("[Commands.fetchJsonBkp] Error parsing JSON: " .. err)
                    return
                end
                local isJson = true
                return backupData, isJson
            else
                print("[Commands.fetchJsonBkp] Unable to find json file, searching for a txt version.");
                local filepath = filepath.."txt"
                local filereader = getFileReader(filepath, false);
                if filereader then
                    print("[Commands.fetchJsonBkp] Located txt backup file " );
                    local temp = {};
                    local line = filereader:readLine();
                    while line ~= nil do
                        table.insert(temp, line);
                        line = filereader:readLine();
                    end
                    filereader:close();
                    local isJson = false
                    return temp, isJson
                else
                    print("[Commands.fetchJsonBkp] Unable to locate txt backup file" );
                end
            end
            return nil
        end

        --
    
        --

        local function saveJsonBkp(filepath, backupData)
            local done = false
            local serializedData = json.encode(backupData, { indent = true })
            local filewriter = getFileWriter(filepath, false, false) -- true, false maybe?
            if filewriter then
                filewriter:write(serializedData)
                filewriter:close()
                print("Backup file updated successfully.")
                done = true
            else
                print("Unable to open file for writing.")
            end
            return done
        end

    -- Command: killyno
    local CMD_NAME_killyno = 'killyno';

    local function onServerCommand_killyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args ~= 3 then
            return '/luacmd killyno [player] [kills] [hours]'
        end

        -- Reference the helper inside the command's handler function.
        local helper = LuaServerCommandHelper

        
        -- Attempt to resolve the player using the helper method.
        local username = args[1]
        local player = helper.getPlayerByUsername(username)
        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local kills = tonumber(args[2])
        if kills == nil then
            return 'Invalid kills: ' .. tostring(args[2])
        end
        local lifeTime = tonumber(args[3])
        if lifeTime == nil then
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

        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local admin = helper.getPlayerByUsername(author)
        local commandArg = args[2]

        if commandArg == "loadbackup" then
            local id = player:getUsername()
            print("[Commands.loadbackup] zSOUL QUEST SYSTEM - Forcing loading backup for Player ID: " .. id)
            local filepath = "/Backup/SFQuest_" .. id .. "."
            local bkp, isJson = fetchJsonBkp(filepath)
            local packet = {}
            packet.command = "loadbackup"
            packet.steamID = player:getOnlineID()
            local newargs = { id = id , data = bkp, checkDefaults = true };
            --mettere un controllo su bkp per essere sicuri di mandare un backup non vuoto?
            if isJson then
                sendServerCommand(player, 'SFQuest', "setProgress", newargs);
                print("[Commands.loadbackup] zSOUL QUEST SYSTEM - Requested JSON quest data for player " .. id .. " sent.")
            else
                sendServerCommand(player, 'SFQuest', "setProgress", newargs);
                print("[Commands.loadbackup] zSOUL QUEST SYSTEM - Requested TXT quest data for player " .. id .. " sent.")
            end
            
            if admin then
                sendServerCommand(admin, "Pyno", "fixxyno", packet)
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
        elseif commandArg == "changefrequency" then
            if #args ~= 4 then
                return '/luacmd fixxyno [player] [changefrequency] [dailycode] [newfrequency]'
            end
            local packet = {}
            packet.steamID = player:getOnlineID()
            packet.command = "changefrequency"
            packet.dailycode = args[3]
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
            return '/luacmd libryno [player] [restore/delete or remove/backup/check] [readonce/timed/bkp1/bkp2]'
        end

        local helper = LuaServerCommandHelper
        local admin = helper.getPlayerByUsername(author)
        

        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local commandArg = args[2]

            -- Definisci le opzioni valide per bookType
        local validModDataNames = {
            readonce = true,
            timed = true,
            bkp1 = true,
            bkp2 = true
        }
        if not validModDataNames[args[3]] then
            return '/luacmd libryno [player] [restore/delete or remove/backup/check] [readonce/timed/bkp1/bkp2]'
        end

        local bookType
        local modData_Name
        if args[3] == "readonce" then
            bookType = "READ_ONCE_BOOK"
            modData_Name = "ReadOnceBook"
        elseif args[3] == "timed" then
            bookType = "TIMED_BOOK"
            modData_Name = "TimedBook"
        elseif args[3] == "bkp1" then
            bookType = "BKP_MOD_1"
            modData_Name = "BKP_1"
        elseif args[3] == "bkp2" then
            bookType = "BKP_MOD_2"
            modData_Name = "BKP_2"
        else
            print("Errore: bookType non riconosciuto - " .. tostring(args[3]))
            return
        end

        local packet = {}
            packet.steamID = player:getOnlineID()
            packet.command = commandArg
            packet.bookType = bookType
            packet.modDataName = modData_Name
            local id = player:getUsername()
        if commandArg == "restore" then
            if #args ~= 3 then
                return '/luacmd libryno [player] [restore/delete or remove/backup/check] [readonce/timed/bkp1/bkp2]'
            end
            -- Aggiungi debug per verificare il contenuto del pacchetto
            print("Invio comando 'libryno' a " .. player:getUsername())
            print("Packet:", "steamID=" .. tostring(packet.steamID), "command=" .. packet.command, "bookType=" .. packet.bookType)
            local filepath = "/Backup/EraseBackup/PlayerBKP_" .. id .. "."
            local backupData = fetchJsonBkp(filepath)

            if not backupData[modData_Name] then
                packet.done = false
            else

                packet.done = true
                sendServerCommand(player, "Vorshim", "restoreBackup", { tableName = modData_Name, data = backupData[modData_Name] })
            end
            
            if admin then
                sendServerCommand(admin, "Pyno", "libryno", packet)
            end


        elseif commandArg == "backup" then
            if #args ~= 3 then
                return '/luacmd libryno [player] [restore/delete or remove/backup/check] [readonce/timed/bkp1/bkp2]'
            end
            sendServerCommand(player, "Vorshim", "attemptTranscribeBookResponse", {
                success = true,
                message = "il tuo libro " .. bookType .. " è stato salvato per ordine di Pyno",
                bookType = bookType,
                item = nil,
                extra = nil
            })
            packet.success = true
            if admin then
                sendServerCommand(admin, "Pyno", "libryno", packet)
            end

        elseif commandArg == "check" then
            if #args ~= 3 then
                return '/luacmd libryno [player] [restore/delete or remove/backup/check] [readonce/timed/bkp1/bkp2]'
            end
            
            -- Aggiungi debug per verificare il contenuto del pacchetto
            print("Invio comando 'libryno' a " .. player:getUsername())
            print("Packet:", "steamID=" .. tostring(packet.steamID), "command=" .. packet.command, "bookType=" .. packet.bookType)
            local filepath = "/Backup/EraseBackup/PlayerBKP_" .. id .. "."    
            local backupData = fetchJsonBkp(filepath)
            -- Check if the book can be transcribed
            packet.exists = false
            if not backupData[bookType] then
                -- The player hasn't transcribed this book yet
                packet.exists = false
            else
                -- The player has already transcribed this book
                packet.exists = true
            end

            if admin then
                sendServerCommand(admin, "Pyno", "libryno", packet)
            end
        elseif commandArg == "delete" or commandArg == "remove" then
            if #args ~= 3 then
                return '/luacmd libryno [player] [restore/delete or remove/backup/check] [readonce/timed/bkp1/bkp2]'
            end
            -- Aggiungi debug per verificare il contenuto del pacchetto
            print("Invio comando 'libryno' a " .. player:getUsername())
            print("Packet:", "steamID=" .. tostring(packet.steamID), "command=" .. packet.command, "bookType=" .. packet.bookType)
        
            packet.done = false
            local filepath = "/Backup/EraseBackup/PlayerBKP_" .. id .. "."
            local backupData = fetchJsonBkp(filepath)
            if not backupData[bookType] and not backupData[modData_Name] then
                packet.done = false
            else
                backupData[bookType] = nil
                backupData[modData_Name] = nil
                packet.done = saveJsonBkp(filepath, backupData)
            end

            if admin then
                sendServerCommand(admin, "Pyno", "libryno", packet)
            end
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
            return '/luacmd zombyno [player]'
        end

        local helper = LuaServerCommandHelper
        local username = args[1]
        local player = helper.getPlayerByUsername(username)

        if player == nil then
            return 'Player not found: ' .. tostring(username)
        end

        local packet = {}
        packet.command = "conto"
        packet.steamID = player:getOnlineID()
        sendServerCommand(player, "Pyno", "zombyno", packet)

        return 'Command executed.'
    end

    LuaCommands.register(CMD_NAME_zombyno, function(author, command, args)
        return onServerCommand_zombyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_zombyno);
    
    
    -- Command: eventyno
    local CMD_NAME_eventyno = 'eventyno';

    local function onServerCommand_eventyno(author, args)
        -- Check if the correct number of arguments are passed.
        if #args ~= 2 then
            return '/luacmd eventyno [nome evento] [command]'
        end

        local helper = LuaServerCommandHelper

        local admin = helper.getPlayerByUsername(author)


        local isDone = false
        if args[1] == "Fortnite" then
            local command = args[2]
            if command == "reset" then
                if ModData.exists("BattleRoyale") then
                    ModData.remove("BattleRoyale")
                    local md = ModData.getOrCreate("BattleRoyale")
                    md = {}
                    triggerEvent("BattleRoyale_onZoneDefinitionChange");
                    print("EVENTO RESETTATO")
                    isDone = true
                end
            elseif command == "stop" then
                if ModData.exists("BattleRoyale") then
                    local sandboxOptions = SandboxOptions.getInstance();
                    if sandboxOptions then
                        local option = sandboxOptions:getOptionByName("BattleRoyale.NBPlayers")
                        if option then
                            option:setValue(99)
                        end
                    end
                    
                    local zone = BattleRoyale.getZoneDef()
                    zone.isInit = false
                    triggerEvent("BattleRoyale_onZoneDefinitionChange");
                    print("EVENTO STOPPATO")
                    isDone = true
                end
            end
        end

        local packet = {}
        packet.event = args[1]
        packet.command = args[2]
        packet.success = isDone
        sendServerCommand(admin, "Pyno", "eventyno", packet)

        return 'Command executed.'
    end

    LuaCommands.register(CMD_NAME_eventyno, function(author, command, args)
        return onServerCommand_eventyno(author, args)
    end)
    print('Registered LuaCommand: ' .. CMD_NAME_eventyno);

end