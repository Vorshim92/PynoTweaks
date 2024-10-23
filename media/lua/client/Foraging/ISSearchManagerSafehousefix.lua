local original_ISSearchManager_createIconsForWorldItems = ISSearchManager.createIconsForWorldItems
function ISSearchManager:createIconsForWorldItems(_square)
    if isClient() and SafeHouse.isSafeHouse(_square, getPlayer():getUsername(), true) then
        --SafehouseAllowLoot allows picking, placing, rotating
        if not getServerOptions():getBoolean("SafehouseAllowLoot") then
            return
        end;
    end;
    original_ISSearchManager_createIconsForWorldItems(self, _square)
end




