require "Vehicles/ISUI/ISVehicleMenu"
local oldFillPartMenu = ISVehicleMenu.FillPartMenu
local function Set (list)
	local set = {}
	for _, l in ipairs(list) do set[l] = true end
	return set
  end
  
-- menu:deleteMultiSliceTsar({getText("ContextMenu_Unlock_Doors"), getText("ContextMenu_Unlock_Doors"), getText("ContextMenu_Lock_Doors"), getText("ContextMenu_VehicleHeaterOn"), getText("ContextMenu_VehicleHeaterOff"), getText("ContextMenu_VehicleMechanics")})
function ISRadialMenu:deleteMultiSlice(textTableForDelete)
	if type(textTableForDelete) == "table" then
		local textTableForDeleteSet = Set(textTableForDelete)
		local oldSlices = self.slices
		self.slices = {}
		if self.javaObject then
			self.javaObject:clear()
		end
		for sliceIndex, oldSlice in ipairs(oldSlices) do
			if not textTableForDeleteSet[oldSlice.text] then
				local slice = {}
				slice.text = oldSlice.text
				slice.texture = oldSlice.texture
				slice.command = oldSlice.command
				table.insert(self.slices, slice)
				if self.javaObject then
					self.javaObject:addSlice(oldSlice.text, oldSlice.texture)
				end
			end
		end
	end
end


function ISVehicleMenu.FillPartMenu(playerIndex, context, slice, vehicle)
    -- Richiamiamo la funzione originale così riempie il menu come al solito
    oldFillPartMenu(playerIndex, context, slice, vehicle)

    -- Ora possiamo aggiungere/controllare/opzionalmente rimuovere alcune voci dal 'context' o dal 'slice'

    local playerObj = getSpecificPlayer(playerIndex)
    if not playerObj then return end

    -- Esempio: se vuoi applicare la “limitation” di carburante
    if SandboxVars.PynoTweaks and SandboxVars.PynoTweaks.FuelLimitationFactionTier 
       and SandboxVars.PynoTweaks.FuelLimitationFactionTier > 0 then
       
        local factions = playerObj:getModData().missionProgress 
                         and playerObj:getModData().missionProgress.Factions
        local tierRequired = SandboxVars.PynoTweaks.FuelLimitationFactionTier

        if not factions or not factions[1] or (factions[1].tierlevel < tierRequired) then
            -- Se NON soddisfiamo il livello di fazione, disabilitiamo per esempio
            -- l’opzione “Refuel From Pump” nel menu contestuale (context)
            local refuelText = getText("ContextMenu_VehicleRefuelFromPump")
            if context then
                for i, option in ipairs(context.options) do
                    if option.name == refuelText then
                        -- Disabilitiamo l’opzione con un tooltip
                        option.notAvailable = true
                        local tooltip = ISWorldObjectContextMenu.addToolTip()
                        local tierName = getText("IGUI_Factions_Resistenza_Tier" .. tierRequired)
                        tooltip:setName(getText("ContextMenu_FuelLimitationTitle"))
                        tooltip.description = getText("ContextMenu_FuelLimitationDescriptionTier", tierName)
                        option.toolTip = tooltip
                    end
                end
            end

			if slice then
				-- Se NON soddisfiamo il livello di fazione, disabilitamo anche l'eventuale slice se presente con deleteMultiSlice
				slice:deleteMultiSlice({refuelText})
			end
        end
    end
end