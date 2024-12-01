-- VORSHIM --
-- Global Kill Counter UI overwrite by VORSHIM
-- MOD_ID = 
-- ID = 


local ZedUtils = require 'asledgehammer/util/ZedUtils';

-- safeUI not working
-- local function adjustToolbarButtonPositionPvP() -- this version set the pvp icon in the last position
--     local index = 0
--     local lastBottom = 0
--     -- Iterate over toolbar children and reposition/fix buttons position
--     for _, child in pairs(ISEquippedItem.instance:getChildren()) do
--         if getmetatable(child) == ISButton then
--             index = index + 1
--             if index > 1 then -- skip inventoryBtn
--                 child:setY(lastBottom)
--             end
--             lastBottom = child:getBottom() + 5
--         end
--     end
--     ISEquippedItem.instance:setHeight(lastBottom)
--     -- set iconPvP in last position
--     local safetyUI = getPlayerSafetyUI(getPlayer():getPlayerNum())
--     if safetyUI then
--         safetyUI:setY(lastBottom + 10)
--     end
-- end

local function adjustToolbarButtonPosition() -- mantein pvp icon in the same position, like a divider between buttons vanilla and mod
    local lastBottom = 0
    local index = 0
    local accessLevel = getPlayer():getAccessLevel()
    -- Helper to determine starting index for repositioning buttons
    local function calculateStartIndex()
        local startIndex = 6 -- Map Button
        if isClient() then
            startIndex = startIndex + 1 -- CLIENT BUTTON
            if accessLevel ~= "" and accessLevel ~= "None" then
                startIndex = startIndex + 1 -- ADMIN BUTTON
            end
        end
        if getCore():getDebug() or (ISDebugMenu.forceEnable and not isClient()) then
            startIndex = startIndex + 1 -- DEBUG BUTTON
        end
        return startIndex
    end
    local indexToStart = calculateStartIndex()
    -- Iterate over toolbar children and reposition buttons
    for _, child in pairs(ISEquippedItem.instance:getChildren()) do
        if getmetatable(child) == ISButton then
            index = index + 1
            -- print("index: " .. index .. " btnTitle: " .. child:getTitle())
            -- if child == ISEquippedItem.instance.adminBtn then
            --     print("Found the adminBtn! at index: " .. index)
            -- end
            if index > indexToStart then
                -- Add extra spacing for the first button to skip PVP icon (only in MP)
                local additionalSpacing = (isClient() and index == indexToStart + 1) and 50 or 0
                child:setY(lastBottom + additionalSpacing)
            end
            lastBottom = child:getBottom()
        end
    end
    ISEquippedItem.instance:setHeight(lastBottom)
end

function GlobalKillCounter.GetButton()
    local toolbarButton
    for _, child in pairs(ISEquippedItem.instance:getChildren()) do
        if getmetatable(child) == ISButton then
            if child.name == "GlobalKillCounterBtn" then
                toolbarButton = child
            end
        end
    end
    return toolbarButton
end

local function initToolbarButton()
    adjustToolbarButtonPosition()
end

Events.OnCreatePlayer.Add(ZedUtils.delay(25, initToolbarButton))

local textureOff = getTexture("media/textures/Icon_GlobalKillCounter_off.png")
local textureOn = getTexture("media/textures/Icon_GlobalKillCounter_on.png")

function GlobalKillCounter.OnServerCommandNew(module, command, args)
    if module == "GlobalKillCounter" then
        -- print("GlobalKillCounter.OnServerCommand override")
        local toolbarButton = GlobalKillCounter.GetButton()
        local GKC_Ui
        if ISLayoutManager.windows["globalkillcounter"] then
            GKC_Ui = ISLayoutManager.windows["globalkillcounter"].funcs or nil -- or .target?
        end
        if command == "kills" then
            GlobalKillCounter.GlobalKills = args[1]
            GlobalKillCounter.PendingServerSyncKills = 0
        elseif command == "init" then
            if SandboxVars.GlobalKillCounter.Goal > 0 and toolbarButton then
                -- print("[init] GlobalKillCounter.Goal > 0 and toolbarButton")
                toolbarButton:setVisible(true)
            else
                -- print("[init] GlobalKillCounter.Goal <= 0 and toolbarButton")
                toolbarButton:setVisible(false)
                if GKC_Ui then
                    GKC_Ui:removeFromUIManager()
                    GKC_Ui = nil
                end
            end
            GlobalKillCounter.DidInit = true
            GlobalKillCounter.GlobalKills = args[1]
            GlobalKillCounter.PendingKills = 0
            GlobalKillCounter.LastSendTime = getTimestamp()
        elseif command == "reset" then
            if SandboxVars.GlobalKillCounter.Goal > 0 and toolbarButton then
                -- print("[reset] GlobalKillCounter.Goal > 0 and toolbarButton")
                toolbarButton:setVisible(true)
                getSoundManager():PlaySound("GKC/GKC_Event", false, 1.0);
                local chat = ISChat.instance
                if chat then
                    chat.serverMessageUI:setServerMessage(SandboxVars.GlobalKillCounter.Alert)
                end
            else
                -- print("[reset] GlobalKillCounter.Goal <= 0 and toolbarButton")
                toolbarButton:setVisible(false)
                if GKC_Ui then
                    GKC_Ui:removeFromUIManager()
                    GKC_Ui = nil
                end
            end
            GlobalKillCounter.GlobalKills = 0
            GlobalKillCounter.PendingKills = 0
            GlobalKillCounter.PendingServerSyncKills = 0
            GlobalKillCounter.LastSendTime = getTimestamp()
        end
    end
end
Events.OnGameBoot.Add(function()
    Events.OnServerCommand.Remove(GlobalKillCounter.OnServerCommand)
    Events.OnServerCommand.Add(GlobalKillCounter.OnServerCommandNew)

    local original_fun = GlobalKillCounter.OnServerCommand
    GlobalKillCounter.OnServerCommand = GlobalKillCounter.OnServerCommandNew
end)




-- function ISEquippedItem:prerender()
--     local safetyUI = getPlayerSafetyUI(self.chr:getPlayerNum())
--     if safetyUI ~= nil then
--         safetyUI:setX(self.adminBtn:getX() + 6)
--         if isVisible then
--             safetyUI:setY(self.adminBtn:getY() + self.adminIcon:getHeightOrig() + 18)
--         else
--             safetyUI:setY(self.adminBtn:getY() + 12)
--         end
--     end
-- end
