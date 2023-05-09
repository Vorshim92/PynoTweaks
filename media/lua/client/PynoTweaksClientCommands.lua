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
         end
    end
end


Events.OnServerCommand.Add(OnServerCommand)