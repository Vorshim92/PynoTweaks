if not isClient() and not isServer() then return end

local PrituonnyOnInitGlobalModData = function(_module, _packet)
    ModData.getOrCreate("Prituonny")
    if isClient() then
        ModData.request("Prituonny")
    end
end

local PrituonnyOnReceiveGlobalModData = function(_module, _packet)
    if _module ~= "Prituonny" then return; end;
    -- print("SERVER" .. _module)
    if (not _packet) then
        print("aborted OnReceiveGlobalModData in trueClient "
            .. (_packet or "missing _packet."));
    else
        ModData.add(_module, _packet);
        if isServer() then
        ModData.transmit(_module); -- send to all clients when receive a new update from a player
        end
    end;
end

Events.OnInitGlobalModData.Add(PrituonnyOnInitGlobalModData);
Events.OnReceiveGlobalModData.Add(PrituonnyOnReceiveGlobalModData);