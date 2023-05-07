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
            player:Say("Lesgoo")
         end
    end
end


Events.OnServerCommand.Add(OnServerCommand)