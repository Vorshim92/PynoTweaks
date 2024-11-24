-- VORSHIM --
-- Loot Zombie Distributions overwrite --

require 'Items/SuburbsDistributions'
SuburbsDistributions = SuburbsDistributions or {};

-- fix vanilla ReplaceItemInDistribution
function ReplaceItemInDistribution(_dist, _item, _chance, _replacement, _replaceChance, _dorecursive)
    local recursive = (_dorecursive == nil) or _dorecursive
    local doChance = type(_chance) == "number"
    local doReplaceChance = type(_replaceChance) == "number"

    for k, v in pairs(_dist) do
        if type(_dist[k]) == "table" then
            if type(k) == "string" and k == "items" then
                local itemsList = _dist[k]
                -- Loop through the items in steps of 2 (item name and its chance)
                for i = 1, #itemsList, 2 do
                    local itemName = itemsList[i]
                    local itemChance = itemsList[i + 1]
                    -- Check if the item matches
                    if itemName == _item and (not doChance or itemChance == _chance) then
                        -- Replace the item name
                        itemsList[i] = _replacement
                        -- Replace the chance if specified
                        if doReplaceChance then
                            itemsList[i + 1] = _replaceChance
                        end
                    end
                end
            else
                if recursive then
                    -- Recursively process nested tables
                    ReplaceItemInDistribution(_dist[k], _item, _chance, _replacement, _replaceChance, _dorecursive)
                end
            end
        end
    end
end

-- fix vanilla RemoveItemFromDistribution
-- Optionally set 'chance' to false if you want to omit it but do want to set dorecursive
function RemoveItemFromDistribution(_dist, _item, _chance, _dorecursive)
    local recursive = (_dorecursive == nil) or _dorecursive
    local doChance = type(_chance) == "number"

    for k, v in pairs(_dist) do
        if type(_dist[k]) == "table" then
            if type(k) == "string" and k == "items" then
                local itemsList = _dist[k]
                -- Loop through the items in reverse, stepping by -2 (since each item is a pair of name and chance)
                for i = #itemsList, 2, -2 do
                    local itemName = itemsList[i - 1]
                    local itemChance = itemsList[i]
                    -- Check if the item matches
                    if itemName == _item and (not doChance or itemChance == _chance) then
                        -- Remove the item and its chance
                        table.remove(itemsList, i)       -- Remove chance
                        table.remove(itemsList, i - 1)   -- Remove item name
                    end
                end
            else
                if recursive then
                    RemoveItemFromDistribution(_dist[k], _item, _chance, _dorecursive)
                end
            end
        end
    end
end


-- VANILLA FEMALE ZOMBIE LOOTS
-- inventoryfemale = {
--     rolls = 1,
--     items = {
--         "BluePen", 1,
--         "CameraDisposable", 0.05,
--         "Camera", 0.03,
--         "CameraExpensive", 0.001,
--         "Cigarettes", 0.5,
--         "Comb", 1,
--         "CreditCard", 1,
--         "Doll", 0.5,
--         "Earbuds", 1,
--         "Lighter", 0.5,
--         "Lipstick", 1,
--         "Locket", 1,
--         "LouisvilleMap1", 0.1,
--         "LouisvilleMap2", 0.1,
--         "LouisvilleMap3", 0.1,
--         "LouisvilleMap4", 0.1,
--         "LouisvilleMap5", 0.1,
--         "LouisvilleMap6", 0.1,
--         "LouisvilleMap7", 0.1,
--         "LouisvilleMap8", 0.1,
--         "LouisvilleMap9", 0.1,
--         "Magazine", 1,
--         "MakeupEyeshadow", 1,
--         "MakeupFoundation", 1,
--         "MarchRidgeMap", 0.1,
--         "Matches", 0.5,
--         "MuldraughMap", 0.1,
--         "Newspaper", 1,
--         "Notebook", 1,
--         "Pen", 1,
--         "Pencil", 1,
--         "Perfume", 0.5,
--         "Pills", 0.1,
--         "PillsAntiDep", 0.1,
--         "PillsBeta", 0.1,
--         "PillsVitamins", 0.1,
--         "Radio.WalkieTalkie1", 0.05,
--         "Radio.WalkieTalkie2", 0.03,
--         "Radio.WalkieTalkie3", 0.001,
--         "RedPen", 1,
--         "RiversideMap", 0.1,
--         "RosewoodMap", 0.1,
--         "WestpointMap", 0.1,
--     },
--     junk = {
--         rolls= 1,
--         items = {
            
--         }
--     }
-- },
-- VANILLA MALE ZOMBIE LOOTS
-- inventorymale = {
--     rolls = 1,
--     items = {
--         "BluePen", 1,
--         "CameraDisposable", 0.05,
--         "Camera", 0.03,
--         "CameraExpensive", 0.001,
--         "Cigarettes", 0.5,
--         "Cologne", 0.5,
--         "Comb", 1,
--         "CreditCard", 1,
--         "Earbuds", 1,
--         "Lighter", 0.5,
--         "Locket", 1,
--         "LouisvilleMap1", 0.1,
--         "LouisvilleMap2", 0.1,
--         "LouisvilleMap3", 0.1,
--         "LouisvilleMap4", 0.1,
--         "LouisvilleMap5", 0.1,
--         "LouisvilleMap6", 0.1,
--         "LouisvilleMap7", 0.1,
--         "LouisvilleMap8", 0.1,
--         "LouisvilleMap9", 0.1,
--         "Magazine", 1,
--         "MarchRidgeMap", 0.1,
--         "Matches", 0.5,
--         "MuldraughMap", 0.1,
--         "Newspaper", 1,
--         "Notebook", 1,
--         "Pen", 1,
--         "Pencil", 1,
--         "Pills", 0.1,
--         "PillsAntiDep", 0.1,
--         "PillsBeta", 0.1,
--         "PillsVitamins", 0.1,
--         "Radio.WalkieTalkie1", 0.05,
--         "Radio.WalkieTalkie2", 0.03,
--         "Radio.WalkieTalkie3", 0.001,
--         "RedPen", 1,
--         "RiversideMap", 0.1,
--         "RosewoodMap", 0.1,
--         "Wallet", 1,
--         "Wallet2", 1,
--         "Wallet3", 1,
--         "Wallet4", 1,
--         "WestpointMap", 0.1,
--     },
--     junk = {
--         rolls= 1,
--         items = {
            
--         }
--     }
-- },


-- example:
-- local itemsInventoryFemale = SuburbsDistributions["all"]["inventoryfemale"]
-- table.insert(itemsInventoryFemale.items, "SutureNeedle") -- inserisce l'item nella table
-- table.insert(itemsInventoryFemale.items, 100) -- inserisce la chance del nuovo item nella table
-- local itemsInventoryMale = SuburbsDistributions["all"]["inventorymale"]
-- table.insert(itemsInventoryMale.items, "SutureNeedle") -- inserisce l'item nella table
-- table.insert(itemsInventoryMale.items, 100) -- inserisce la chance del nuovo item nella table


-- ReplaceItemInDistribution(itemsInventoryFemale, "Pills", nil, "Pills", 100) -- modifica la chance al 100%
-- ReplaceItemInDistribution(itemsInventoryMale, "Pills", nil, "Pills", 100) -- modifica la chance al 100%
-- ReplaceItemInDistribution(itemsInventoryFemale, "CameraExpensive", nil, "CameraExpensive", 100) -- non funziona al 100%, chiss� cosa lo modifica ulteriormente
-- ReplaceItemInDistribution(itemsInventoryMale, "CameraExpensive", nil, "CameraExpensive", 100) -- non funziona al 100%, chiss� cosa lo modifica ulteriormente
-- RemoveItemFromDistribution(itemsInventoryFemale, "Pills") -- rimuove completamente l'item dalla table del drop
-- RemoveItemFromDistribution(itemsInventoryMale, "Pills") -- rimuove completamente l'item dalla table del drop


