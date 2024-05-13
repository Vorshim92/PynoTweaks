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
                    for i = 1, #currentTasks do
                        if currentTasks[i].guid == questID then
                            local task = currentTasks[i]
                            if task then
                                if task.objectives and #task.objectives > 0 then
                                    for k=1,#task.objectives do
                                        if task.objectives[k].oncompleted then
                                            local oncompletedTable = luautils.split(task.objectives[k].oncompleted, ";");
                                            local removeClickEventValue = nil
                                            for j = 1, #oncompletedTable do
                                                if oncompletedTable[j] == "removeclickevent" then
                                                    removeClickEventValue = oncompletedTable[j + 1]
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
                                            local unlocksTable = luautils.split(task.unlocks, ";");
                                            local removeClickEventValue = nil
                                            for j = 1, #unlocksTable do
                                                if unlocksTable[j] == "unlockworldevent" then
                                                    removeClickEventValue = unlocksTable[j + 2]
                                                    for c=1,#player:getModData().missionProgress.WorldEvent do
                                                        local event = player:getModData().missionProgress.WorldEvent[c];
                                                        if event.dialoguecode and event.dialoguecode == removeClickEventValue then
                                                            table.remove(player:getModData().missionProgress.WorldEvent, c);
                                                            break;
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                if task.status == "Completed" then
                                    table.insert(player:getModData().missionProgress.Category1, task);
                                end
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