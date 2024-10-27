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
                -- SF_MissionPanel.Commands.removequest(questID) -- use this after questyno 2.0
                -- super funzione per rimuovere coattamente una quest e tutte le relative sottofunzioni aggiunte (se presenti)
                local player = getPlayer();
                local currentTasks = player:getModData().missionProgress.Category2
                local done = false
                if #currentTasks > 0 then
                    for i = #currentTasks, 1, -1 do
                        if currentTasks[i].guid == questID then
                            local task = currentTasks[i]
                            if task then
                                -- rimozione di eventuali clickevent degli obiettivi (se presenti)
                                if task.objectives and #task.objectives > 0 then
                                    for k=1,#task.objectives do
                                        if task.objectives[k].oncompleted then
                                            local oncompletedTable = luautils.split(task.objectives[k].oncompleted, ";");
                                            for j = 1, #oncompletedTable do
                                                if oncompletedTable[j] == "removeclickevent" then
                                                    local removeClickEventValue = oncompletedTable[j + 1]
                                                    for c=1,#player:getModData().missionProgress.ClickEvent do
                                                        local event = player:getModData().missionProgress.ClickEvent[c];
                                                        if event.address and event.address == removeClickEventValue then
                                                            table.remove(player:getModData().missionProgress.ClickEvent, c);
                                                            break;
                                                        end
                                                    end
                                                end
                                                if oncompletedTable[j] == "unlockworldevent" then
                                                    local condition = oncompletedTable[j+2]
                                                    if player:getModData().missionProgress.WorldEvent then
                                                        for k, v in pairs(player:getModData().missionProgress.WorldEvent) do
                                                            if v.dialoguecode == condition then
                                                                if player:getModData().missionProgress.WorldEvent[k].marker             then
                                                                    player:getModData().missionProgress.WorldEvent[k].          marker:remove();
                                                                end
                                                                player:getModData().missionProgress.WorldEvent[k] = nil
                                                                break;
                                                            end
                                                        end
                                                    end
                                                end
                                                if oncompletedTable[j] == "clickevent" then
                                                    local removeClickEventValue = oncompletedTable[j + 2]
                                                    for c=1,#player:getModData().missionProgress.ClickEvent do
                                                        local event = player:getModData().missionProgress.ClickEvent[c];
                                                        if event.address and event.address == removeClickEventValue then
                                                            table.remove(player:getModData().missionProgress.ClickEvent, c);
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        if task.objectives[k].onobtained then
                                            local onObtainedTable = luautils.split(task.objectives[k].onobtained, ";");
                                            if #onObtainedTable > 0 then
                                                for j = 1, #onObtainedTable do
                                                    if onObtainedTable[j] == "unlockworldevent" then
                                                        local condition = onObtainedTable[j+2]
                                                        if player:getModData().missionProgress.WorldEvent then
                                                            for k, v in pairs(player:getModData().missionProgress.          WorldEvent) do
                                                                if v.dialoguecode == condition then
                                                                    if player:getModData().missionProgress.WorldEvent[k].           marker then
                                                                        player:getModData().missionProgress.WorldEvent[k].          marker:remove();
                                                                    end
                                                                    player:getModData().missionProgress.WorldEvent[k] = nil
                                                                    break;
                                                                end
                                                            end
                                                        end
                                                    end
                                                    if onObtainedTable[j] == "clickevent" then
                                                        local removeClickEventValue = onObtainedTable[j + 2]
                                                        for c=1,#player:getModData().missionProgress.ClickEvent do
                                                            local event = player:getModData().missionProgress.ClickEvent[c];
                                                            if event.address and event.address == removeClickEventValue then
                                                                table.remove(player:getModData().missionProgress.ClickEvent,            c);
                                                                break;
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if task.unlocks then
                                    local convertedcondition = task.unlocks:gsub(":", ";");
                                    local unlocksTable = luautils.split(convertedcondition, ";");
                                    if #unlocksTable > 0 then
                                        for j = 1, #unlocksTable do
                                            if unlocksTable[j] == "killzombies" then
                                                if player:getModData().missionProgress.ActionEvent and #player:getModData().            missionProgress.ActionEvent > 0 then
                                                    local actionevent = player:getModData().missionProgress.ActionEvent; 
                                                    for a=#actionevent,1,-1 do
                                                        local commands = luautils.split(actionevent[a].commands, ";");
                                                        if commands[1] == "killzombies" and commands[2] == task.guid            then                                                        
                                                            table.remove(player:getModData().missionProgress.ActionEvent, a);
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                            if unlocksTable[j] == "unlockworldevent" then
                                                local condition = unlocksTable[j+2]
                                                if player:getModData().missionProgress.WorldEvent then
                                                    for k, v in pairs(player:getModData().missionProgress.WorldEvent) do
                                                        if v.dialoguecode == condition then
                                                            if player:getModData().missionProgress.WorldEvent[k].marker then
                                                                player:getModData().missionProgress.WorldEvent[k].          marker:remove();
                                                            end
                                                            player:getModData().missionProgress.WorldEvent[k] = nil
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                            if unlocksTable[j] == "clickevent" then
                                                local removeClickEventValue = unlocksTable[j + 2]
                                                for c=1,#player:getModData().missionProgress.ClickEvent do
                                                    local event = player:getModData().missionProgress.ClickEvent[c];
                                                    if event.address and event.address == removeClickEventValue then
                                                        table.remove(player:getModData().missionProgress.ClickEvent, c);
                                                        break;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if task.onobtained then
                                    local onObtainedTable = luautils.split(task.onobtained, ";");
                                    if #onObtainedTable > 0 then
                                        for j = 1, #onObtainedTable do
                                            if onObtainedTable[j] == "unlockworldevent" then
                                                local condition = onObtainedTable[j+2]
                                                if player:getModData().missionProgress.WorldEvent then
                                                    for k, v in pairs(player:getModData().missionProgress.WorldEvent) do
                                                        if v.dialoguecode == condition then
                                                            if player:getModData().missionProgress.WorldEvent[k].marker then
                                                                player:getModData().missionProgress.WorldEvent[k].          marker:remove();
                                                            end
                                                            player:getModData().missionProgress.WorldEvent[k] = nil
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                -- check sullo status della quest, se COMPLETED viene spostato nella categoria 1
                                if task.status == "Completed" then
                                    table.insert(player:getModData().missionProgress.Category1, task);
                                end
                                -- rimozione coatta dalle quest attive xD
                                table.remove(player:getModData().missionProgress.Category2, i);
                                done = true;
                            end
                            break
                        end
                    end
                end   
                if done then
                SF_MissionPanel.instance.needsUpdate = true
                SF_MissionPanel.instance.needsBackup = true;
                end
            end

            player:Say("Missione aggiornataaa!!")

        elseif command == "zombyno" then
            local command = arguments.command
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            if command == "conto" then
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
                    message = "Il backup " .. bookType .. " eÌ€ stato cancellato per il player " .. player:getUsername()
                elseif not arguments.done then
                    message = "Il libro non esiste " .. bookType .. " per il player " .. player:getUsername()
                end
                getPlayer():Say(message)

            elseif subCommand == "restore" then
                -- characterManagement.requestBackupData(modData_Name)
                if arguments.done then
                    getPlayer():Say("Il backup " .. bookType .. " eÌ€ stato ripristinato per il player " .. player:getUsername())
                else
                    getPlayer():Say("Il libro  " .. bookType .. " non Ã¨ stato ripristinato per il player " .. player:getUsername())
                end
            elseif subCommand == "backup" then
                -- characterManagement.writeBook(player, modData_Table, modData_Name)
            if arguments.success then
                getPlayer():Say("Il backup " .. bookType .. " eÌ€ stato salvato per il player " .. player:getUsername())
            else 
                getPlayer():Say("Il libro  " .. bookType .. " non Ã¨ stato salvato per il player " .. player:getUsername())
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
                        getPlayer():Say("Il Battle Royale eÌ€ stato resettato")
                    else
                        getPlayer():Say("Il Battle Royale non Ã¨ stato resettato")
                    end
                elseif command == "stop" then
                    if arguments.success then
                        getPlayer():Say("Il Battle Royale eÌ€ stato stoppato")
                    else
                        getPlayer():Say("Il Battle Royale non Ã¨ stato stoppato")
                    end
                end
            end
        end
    end
end


Events.OnServerCommand.Add(OnServerCommand)