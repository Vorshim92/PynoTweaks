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
            local amount = arguments.amount
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)

            if setOrAdd == "set" then
                player:getModData().missionProgress.Factions[1].reputation = amount
            elseif setOrAdd == "add" then
                SF_MissionPanel:awardReputation("LaResistenza", amount)
            elseif setOrAdd == "remove" then
                SF_MissionPanel:removeReputation("LaResistenza", -amount)
            end
            
            player:Say("Reputazione aggiornata! Nuovo totale: "..player:getModData().missionProgress.Factions[1].reputation.."!")
            SF_MissionPanel.instance.needsUpdate = true
            SF_MissionPanel.instance.needsBackup = true
        elseif command == "questyno" then
            local addOrComplete = arguments.addOrComplete
            local questID = arguments.questID
            local steamID = arguments.steamID
            local player = getPlayerByOnlineID(steamID)

            if addOrComplete == "add" then
                SF_MissionPanel:unlockQuest(questID)
            else
                SF_MissionPanel:completeQuest(player, questID)
            end

            player:Say("Missione aggiornata!")
        end
    end
end


Events.OnServerCommand.Add(OnServerCommand)