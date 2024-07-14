require("survivalRewards")

-- gestione dei comandi ricevuti dal server
local function OnServerCommand(module, command, arguments)
    if module == "Pyno" then
        if command == "killyno" then
            local kills = arguments.kills
            local hours = arguments.hours
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            player:setZombieKills(kills)
            player:setHoursSurvived(hours)
            if SandboxVars.PynoTweaks.SyncRewards then
                for i, v in ipairs(hourMilestones) do
                    if hours >= v then
                        player:getModData().milReached = i
                    end
                end

                for i, v in ipairs(killMilestones) do
                    if kills >= v then
                        player:getModData().kilMilReached = i
                    end
                end
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
                                            local removeClickEventValue = nil
                                            for j = 1, #oncompletedTable do
                                                if oncompletedTable[j] == "clickevent" then
                                                    removeClickEventValue = oncompletedTable[j + 2]
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
                                end
                                if task.unlocks then
                                    local convertedcondition = task.unlocks:gsub(":", ";");
                                    local unlocksTable = luautils.split(convertedcondition, ";");
                                    if #unlocksTable > 0 then
                                        for j = 1, #unlocksTable do
                                            if unlocksTable[j] == "killzombies" then
                                                if #player:getModData().missionProgress.ActionEvent > 0 then 
                                                    for k, v in pairs(player:getModData().missionProgress.ActionEvent) do
                                                        local commands = luautils.split(v.commands, ";");
                                                        for g = 1, #commands do
                                                            if commands[g] == task.guid then                                                          
                                                                table.remove(player:getModData().missionProgress.ActionEvent, k);
                                                                break;
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if unlocksTable[j] == "unlockworldevent" then
                                                print(unlocksTable[j] .. " ESISTE")
                                                local condition = unlocksTable[j+2]
                                                print(condition)
                                                if player:getModData().missionProgress.WorldEvent then
                                                    print("mission progress exist")
                                                    for k, v in pairs(player:getModData().missionProgress.WorldEvent) do
                                                        print(v.dialoguecode)
                                                        if v.dialoguecode == condition then
                                                            print("removing")
                                                            player:getModData().missionProgress.WorldEvent[k] = nil
                                                            -- table.remove(player:getModData().missionProgress.WorldEvent, k);
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                            if unlocksTable[j] == "clickevent" then
                                                removeClickEventValue = unlocksTable[j + 2]
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
                                                print(onObtainedTable[j] .. " ESISTE")
                                                local condition = onObtainedTable[j+2]
                                                print(condition)
                                                if player:getModData().missionProgress.WorldEvent then
                                                    print("mission progress exist")
                                                    for k, v in pairs(player:getModData().missionProgress.WorldEvent) do
                                                        print(v.dialoguecode)
                                                        if v.dialoguecode == condition then
                                                            print("removing")
                                                            player:getModData().missionProgress.WorldEvent[k] = nil
                                                            -- table.remove(player:getModData().missionProgress.WorldEvent, k);
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
                        end
                    end
                end   
                if done then
                SF_MissionPanel.instance.needsUpdate = true
                SF_MissionPanel.instance.needsBackup = true;
                end
            end

            player:Say("Missione aggiornata!")

        elseif command == "zombyno" then
            local command = arguments.command
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)
            if command == "conto" then
                if #player:getModData().missionProgress.ActionEvent == 0 then
                    player:Say("Non ho altri zombie da ammazzare.")
                end
                for k, v in pairs(player:getModData().missionProgress.ActionEvent) do
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
                SF_MissionPanel.instance.DailyEventReroll()
            elseif command == "lincolnreed" then
                local factions = player:getModData().missionProgress.Factions
                table.insert(factions, {factioncode = "LincolnReed", name = "IGUI_SFQuest_LincolnReed_Name", reputation = 99, repmax = 100, tierlevel = 3, tiername = "IGUI_SFQuest_Questyno_LincolnReed_Tier3", tiercolor = "green", itemindex = 41, height = 36, index = 41})
                player:getModData().missionProgress.Factions = factions
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
            end
        end
    end
end


Events.OnServerCommand.Add(OnServerCommand)