ISInventoryMenuElements = ISInventoryMenuElements or {};

function ISInventoryMenuElements.ContextReadme()
    local self 					= ISMenuElement.new();
    self.invMenu			    = ISContextManager.getInstance().getInventoryMenu();

    function self.init()
    end

    function self.createMenu( _item )
        if _item:getType() == "Readme" then
            if _item:getContainer() ~= self.invMenu.inventory then
                return;
			end
            local player = getPlayer()
			local subOption= self.invMenu.context:addOption(getText("ContextMenu_Remove"), player, self.removeItem);
        end
    end

    function self.removeItem( _p)
        local item = self.invMenu.inventory:getItemFromType("PynoTweaks.Readme")
		if item == nil then return end
        _p:getInventory():Remove(item)
	end
	return self;
end