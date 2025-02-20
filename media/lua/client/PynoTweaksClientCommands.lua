-- local characterManagement = {}
local pageBook = {}
-- local activityCalendar = {}
local playerBkp = {}
if getActivatedMods():contains("Erase&Rewind_RPGbyVorshim") then
-- characterManagement = require('character/CharacterManagement')
pageBook = require('book/PageBook')
-- activityCalendar = require('lib/ActivityCalendar')
    if getActivatedMods():contains("Erase&Rewind_BKP") then
        playerBkp = require('CharacterPlayer')
    end
end

local isSurvivalRewards = getActivatedMods():contains("SurvivalRewards");

-- gestione dei comandi ricevuti dal server
local function OnServerCommand(module, command, arguments)
    if module == "Pyno" then
        if command == "killyno" then
            local kills = arguments.kills
            local hours = arguments.hours
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            if kills >= 0 then
                if isSurvivalRewards then
                player:setZombieKills(0)
                player:getModData().kilMilReached = 0;
                for i, v in ipairs(killMilestones) do
                        if kills >= v then
                            player:getModData().kilMilReached = i
                        end
                    end
                end
                player:setZombieKills(kills)
                
            end
            if hours >= 0 then
                if isSurvivalRewards then
                player:setHoursSurvived(0)    
                player:getModData().milReached = 0    
                for i, v in ipairs(hourMilestones) do
                        if hours >= v then
                            player:getModData().milReached = i
                        end
                    end
                end
                player:setHoursSurvived(hours)
            end
            player:Say("Lesgoo") 
        elseif command == "reppyno" then
            local setOrAdd = arguments.setOrAdd
            local factioncode = arguments.factioncode
            local amount = arguments.amount
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)

            if setOrAdd == "set" then
                player:getModData().missionProgress.Factions[1].reputation = amount
                SF_MissionPanel.instance.needsUpdate = true
                SF_MissionPanel.instance.needsBackup = true
            elseif setOrAdd == "add" then
                SF_MissionPanel:awardReputation(factioncode, amount)
            elseif setOrAdd == "remove" then
                SF_MissionPanel:removeReputation(factioncode, amount)
            end
            
            player:Say("Reputazione aggiornata!")
        elseif command == "questyno" then
            local addOrComplete = arguments.addOrComplete
            local questID = arguments.questID
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)

            if addOrComplete == "add" then
                SF_MissionPanel:unlockQuest(questID)
            elseif addOrComplete == "complete" then
                SF_MissionPanel:completeQuest(player, questID)
            elseif addOrComplete == "backup" then
                SF_MissionPanel:forceBackupData()
            elseif addOrComplete == "remove" then
                SF_MissionPanel.Commands.removequest(questID) -- use this after questyno 2.0 
            end

            player:Say("Missione aggiornataaa!!")
        elseif command == "fixxyno" then
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            command = arguments.command
            if command == "rerolldaily" then
                SF_MissionPanel.instance.DailyEventReroll() --Expanded

            elseif command == "loadbackup" then
                local player = getPlayerByOnlineID(steamID)
                getPlayer():Say("Backup caricato per " .. player:getUsername())
            elseif command == "lincolnreed" then
                local factions = player:getModData().missionProgress.Factions
                table.insert(factions, {factioncode = "LincolnReed", name = "IGUI_SFQuest_Questyno_LincolnReed_Name", reputation = 99, repmax = 100, tierlevel = 2, tiername = "IGUI_Factions_Daily_Tier2", tiercolor = "blue", itemindex = 41, height = 36, index = 41})
                player:getModData().missionProgress.Factions = factions
                SF_MissionPanel:unlockQuest("Questyno_LincolnReed_Intro")
                SF_MissionPanel.instance.needsUpdate = true
                SF_MissionPanel.instance.needsBackup = true
            elseif command == "updatefrequency" then
                local oldfrequency = tonumber(arguments.oldfrequency)
                local newfrequency = tonumber(arguments.newfrequency)
                local dailyEvents = player:getModData().missionProgress.DailyEvent
                for k, v in pairs(dailyEvents) do
                    if v.frequency == oldfrequency then
                        v.frequency = newfrequency
                    end
                end
                player:getModData().missionProgress.DailyEvent = dailyEvents
                SF_MissionPanel.instance.needsUpdate = true
                SF_MissionPanel.instance.needsBackup = true
            elseif command == "changefrequency" then
                local dailycode = tonumber(arguments.oldfrequency)
                local newfrequency = tonumber(arguments.newfrequency)
                SF_MissionPanel.instance:updateFrequency(dailycode, newfrequency)
            elseif command == "zombyno" then
                if #player:getModData().missionProgress.ActionEvent == 0 then
                    player:Say("Non ho altri zombie da ammazzare.")
                end
                for i, v in ipairs(player:getModData().missionProgress.ActionEvent) do
                    local zcount = tonumber(luautils.split(v.condition, ";")[2])
                    local npcname = luautils.split(v.commands, ";")[2]
                    -- trim numbers at the end of the string and add _Name
                    npcname = "IGUI_SFQuest_" .. string.gsub(npcname, "%d+$", "") .. "_Name"
                    local count = player:getZombieKills()
                    local toKill = zcount - count
                    npcname = getText(npcname)
                    player:Say("Devo uccidere altri " .. toKill .. " zombie per " .. npcname .. ".")
                end
            end
        elseif command == "libryno" then
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            print("command " .. arguments.command .. " steamID " .. steamID .. " player " .. player:getUsername())
            local bookType = arguments.bookType
            print("bookType: " .. tostring(bookType))

            local modData_Table = nil
            local modData_Name = arguments.modDataName
            if bookType == "READ_ONCE_BOOK" then
                modData_Table = pageBook.ReadOnceBook
            elseif bookType == "TIMED_BOOK" then
                modData_Table = pageBook.TimedBook
            elseif bookType == "BKP_MOD_1" then
                modData_Table = playerBkp.BKP_1
            elseif bookType == "BKP_MOD_2" then
                modData_Table = playerBkp.BKP_2
            else
                print("Errore: modData_Table non riconosciuto - " .. tostring(bookType))
                return
            end

            local subCommand = arguments.command
            if subCommand == "delete" or subCommand == "remove" then
                local message = nil
                if arguments.done then
                    message = "Il backup " .. bookType .. " è stato cancellato per il player " .. player:getUsername()
                elseif not arguments.done then
                    message = "Il libro non esiste " .. bookType .. " per il player " .. player:getUsername()
                end
                getPlayer():Say(message)

            elseif subCommand == "restore" then
                -- characterManagement.requestBackupData(modData_Name)
                if arguments.done then
                    getPlayer():Say("Il backup " .. bookType .. " è stato ripristinato per il player " .. player:getUsername())
                else
                    getPlayer():Say("Il libro  " .. bookType .. " non è stato ripristinato per il player " .. player:getUsername())
                end
            elseif subCommand == "backup" then
                -- characterManagement.writeBook(player, modData_Table, modData_Name)
            if arguments.success then
                getPlayer():Say("Il backup " .. bookType .. " è stato salvato per il player " .. player:getUsername())
            else 
                getPlayer():Say("Il libro  " .. bookType .. " non è stato salvato per il player " .. player:getUsername())
            end
            elseif subCommand == "check" then
                local message = nil
                if arguments.exists then
                    message = "Il backup " .. bookType .. " esiste per il player " .. player:getUsername()
                elseif not arguments.exists then
                    message = "Il libro non esiste " .. bookType .. " per il player " .. player:getUsername()
                end
                getPlayer():Say(message)
            else
                print("Errore: comando non riconosciuto - " .. tostring(subCommand))
            end
        elseif command == "eventyno" then --sezione per gli eventi vari (WIP)
            local event = arguments.event
            local command = arguments.command
            if event == "Fortnite" then -- sezione per il Battle Royale
                if command == "reset" then
                    if arguments.success then
                        if ModData.exists("BattleRoyale") then
                            ModData.remove("BattleRoyale")
                        end
                        getPlayer():Say("Il Battle Royale è stato resettato")
                    else
                        getPlayer():Say("Il Battle Royale non è stato resettato")
                    end
                elseif command == "stop" then
                    if arguments.success then
                        getPlayer():Say("Il Battle Royale è stato stoppato")
                    else
                        getPlayer():Say("Il Battle Royale non è stato stoppato")
                    end
                end
            end
        elseif command == "playeryno" then
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            print("command " .. arguments.command .. " steamID " .. steamID .. " player " .. player:getUsername())
            
            local subCommand = arguments.command
            if subCommand == "additems" then
                local inv = player:getInventory();
                local items = luautils.split(arguments.items, ",") --example: Base.Axe;1,Base.GarbageBag

                for _, item in ipairs(items) do
                    local itemName = luautils.split(item, ";")[1]
                    -- la quantity non ï¿½ obbligatoria, l'item potrebbe non avere la quantity specificata tipo Base.GarbageBag nell'example sopra
                    local quantity = tonumber(luautils.split(item, ";")[2]) or 1
                    inv:AddItems(itemName, quantity)
                end
            else
                print("Errore: comando non riconosciuto - " .. tostring(subCommand))
            end
        end
    end
end


Events.OnServerCommand.Add(OnServerCommand)