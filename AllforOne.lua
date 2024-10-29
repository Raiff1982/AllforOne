-- Initialize the addon
local addonName, addonTable = ...
_G["AllforOneAddon"] = addonTable -- Make addonTable globally accessible
addonTable.inCombat = false
addonTable.rotationEnabled = true -- Add a flag to enable/disable rotation

-- Default settings
addonTable.config = addonTable.config or {
    uiSize = 1.0, -- Default size (1.0 means 100%)
    uiColor = { r = 0, g = 0, b = 0, a = 0.8 }, -- Default color (black with 80% opacity)
    spellSequence = {"Vampiric Touch", "Devouring Plague", "Shadow Word: Pain", "Mind Blast"} -- Default spell sequence
}

-- Log function with error handling
local function SafeLog(message)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage(date("%Y-%m-%d %H:%M:%S") .. " - " .. message)
    else
        print(date("%Y-%m-%d %H:%M:%S") .. " - " .. message)
    end
end
addonTable.Log = SafeLog

-- Define tutorial messages
local tutorialMessages = {
    "Welcome to AllforOne! This addon helps you with automated rotation logic for all classes and specializations.",
    "To toggle the rotation on or off, click the minimap button or use the command /allforone toggle.",
    "You can open the settings panel by using the command /allforone settings.",
    "The settings panel allows you to adjust the UI size, color, and customize spell sequences.",
    "A macro for toggling rotation has been created automatically. You can find it in your macros list.",
    "For more information, use the command /allforoneinfo."
}

-- Function to show the tutorial
function addonTable:SetNextTutorial()
    addonTable.currentTutorial = addonTable.currentTutorial or 0
    addonTable.currentTutorial = addonTable.currentTutorial + 1

    if addonTable.currentTutorial > #tutorialMessages then
        addonTable.currentTutorial = 1
    end

    AllforOneTutorialWindow.desc:SetText(tutorialMessages[addonTable.currentTutorial])
end

function addonTable:SetPrevTutorial()
    addonTable.currentTutorial = addonTable.currentTutorial or 0
    addonTable.currentTutorial = addonTable.currentTutorial - 1

    if addonTable.currentTutorial <= 0 then
        addonTable.currentTutorial = #tutorialMessages
    end

    AllforOneTutorialWindow.desc:SetText(tutorialMessages[addonTable.currentTutorial])
end

function addonTable:SpawnTutorialFrame()
    local f = CreateFrame('Frame', 'AllforOneTutorialWindow', UIParent)
    f:SetFrameStrata('DIALOG')
    f:SetToplevel(true)
    f:SetClampedToScreen(true)
    f:SetSize(360, 110)
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    f:Hide()

    local header = CreateFrame('Button', nil, f)
    header:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    header:SetSize(120, 25)
    header:SetPoint('CENTER', f, 'TOP')
    header:SetFrameLevel(header:GetFrameLevel() + 2)

    local title = header:CreateFontString(nil, 'OVERLAY')
    title:SetFontObject('GameFontHighlightLarge')
    title:SetPoint('CENTER', header, 'CENTER')
    title:SetText('AllforOne')

    local desc = f:CreateFontString(nil, 'ARTWORK')
    desc:SetFontObject('GameFontHighlight')
    desc:SetJustifyV('TOP')
    desc:SetJustifyH('LEFT')
    desc:SetPoint('TOPLEFT', 18, -32)
    desc:SetPoint('BOTTOMRIGHT', -18, 30)
    f.desc = desc

    f.disableButton = CreateFrame('CheckButton', f:GetName()..'DisableButton', f, 'UICheckButtonTemplate')
    _G[f.disableButton:GetName() .. 'Text']:SetText(DISABLE)
    f.disableButton:SetPoint('BOTTOMLEFT')
    f.disableButton:SetScript('OnShow', function(btn) btn:SetChecked(addonTable.db.hideTutorial) end)
    f.disableButton:SetScript('OnClick', function(btn) addonTable.db.hideTutorial = btn:GetChecked() end)

    f.hideButton = CreateFrame('Button', f:GetName()..'HideButton', f, 'UIPanelButtonTemplate')
    f.hideButton:SetPoint('BOTTOMRIGHT', -5, 5)
    f.hideButton:SetText(HIDE)
    f.hideButton:SetScript('OnClick', function(btn) btn:GetParent():Hide() end)

    f.nextButton = CreateFrame('Button', f:GetName()..'NextButton', f, 'UIPanelButtonTemplate')
    f.nextButton:SetPoint('RIGHT', f.hideButton, 'LEFT', -4, 0)
    f.nextButton:SetSize(20, 20)
    f.nextButton:SetText('>')
    f.nextButton:SetScript('OnClick', function() addonTable:SetNextTutorial() end)

    f.prevButton = CreateFrame('Button', f:GetName()..'PrevButton', f, 'UIPanelButtonTemplate')
    f.prevButton:SetPoint('RIGHT', f.nextButton, 'LEFT', -4, 0)
    f.prevButton:SetSize(20, 20)
    f.prevButton:SetText('<')
    f.prevButton:SetScript('OnClick', function() addonTable:SetPrevTutorial() end)

    return f
end

function addonTable:ShowTutorial(forceShow)
    if not forceShow and (addonTable.db.hideTutorial or not addonTable.private.install_complete) then return end

    AllforOneTutorialWindow = AllforOneTutorialWindow or addonTable:SpawnTutorialFrame()
    AllforOneTutorialWindow:Show()
    addonTable:SetNextTutorial()
end

-- Create the minimap button
local function CreateMinimapButton()
    local button = CreateFrame("Button", "AllforOneMinimapButton", Minimap)
    button:SetSize(32, 32)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetTexture("Interface\\ICONS\\INV_Misc_QuestionMark")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER")

    local overlay = button:CreateTexture(nil, "OVERLAY")
    overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    overlay:SetSize(54, 54)
    overlay:SetPoint("TOPLEFT")

    button:SetScript("OnClick", function()
        addonTable.rotationEnabled = not addonTable.rotationEnabled
        local status = addonTable.rotationEnabled and "enabled" or "disabled"
        print("Rotation " .. status)
        SafeLog("Rotation " .. status)
    end)

    return button
end

local minimapButton = CreateMinimapButton()

-- Position the minimap button
local function UpdateMinimapButtonPosition()
    local angle = math.rad(45) -- Adjust the angle as needed
    local x, y = cos(angle) * 80, sin(angle) * 80
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
    minimapButton:Show() -- Ensure the button is shown
end

minimapButton:RegisterEvent("PLAYER_LOGIN")
minimapButton:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        UpdateMinimapButtonPosition()
    end
end)

-- Define the HandleChatCommand function
function addonTable.HandleChatCommand(msg)
    local command, arg = strsplit(" ", msg, 2)
    if command == "toggle" then
        addonTable.rotationEnabled = not addonTable.rotationEnabled
        local status = addonTable.rotationEnabled and "enabled" or "disabled"
        print("Rotation " .. status)
        SafeLog("Rotation " .. status)
    elseif command == "settings" then
        if addonTable.settingsPanel then
            addonTable.settingsPanel:Show()
            SafeLog("Settings panel opened.")
        else
            SafeLog("Error: settingsPanel is nil.")
        end
    elseif command == "tutorial" then
        addonTable:ShowTutorial(true)
    else
        SafeLog("Unknown command: " .. command)
        print("Unknown command: " .. command)
    end
end

-- Initialize the current rotation function
local function InitializeRotationFunction()
    local class = select(2, UnitClass("player"))
    if GetSpecialization then
        local spec = GetSpecialization()
        if spec then
            local specInfo = GetSpecializationInfo(spec)
            if specInfo then
                addonTable.currentRotationFunction = addonTable.GetRotationFunction[class] and addonTable.GetRotationFunction[class][specInfo]
            else
                SafeLog("Failed to get specialization info.")
            end
        else
            SafeLog("Specialization not available yet.")
        end
    else
        SafeLog("GetSpecialization function is not available.")
    end
end

-- Create frame and register events
addonTable.frame = CreateFrame("Frame")
local events = {
    "PLAYER_LOGIN",
    "COMBAT_LOG_EVENT_UNFILTERED",
    "PLAYER_ENTERING_WORLD",
    "SPELLS_CHANGED",
    "ACTIVE_TALENT_GROUP_CHANGED",
    "PLAYER_LEVEL_UP",
    "PLAYER_REGEN_DISABLED", -- Entering combat
    "PLAYER_REGEN_ENABLED" -- Exiting combat
}
for _, event in ipairs(events) do
    addonTable.frame:RegisterEvent(event)
end

-- Register chat command
SLASH_ALLFORONE1 = "/allforone"
SlashCmdList["ALLFORONE"] = function(msg)
    addonTable.HandleChatCommand(msg) -- Call with addonTable prefix
end

-- Event handler function
addonTable.frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        print("AllforOne Addon Loaded")
        SafeLog("Addon Loaded")
    elseif event == "PLAYER_ENTERING_WORLD" then
        if not AllforOneConfig then
            AllforOneConfig = { settings = { scaling = true, uiSize = 1.0, color = "white" } }
        end
        addonTable.config = AllforOneConfig
        SafeLog("Player entered world.")
        -- Ensure textBox and settingsButton are defined before showing them
        if addonTable.textBox then addonTable.textBox:Show() end
        if addonTable.settingsButton then addonTable.settingsButton:Show() end
        C_Timer.After(1, function()
            if GetSpecialization then
                InitializeRotationFunction()
            else
                SafeLog("GetSpecialization not available, retrying...")
                C_Timer.After(1, InitializeRotationFunction)
            end
        end)
    elseif event == "PLAYER_LEVEL_UP" then
        local level = ...
        addonTable.ScaleUIBasedOnLevel(level)
        SafeLog("Player leveled up to " .. level)
    elseif event == "PLAYER_REGEN_DISABLED" then
        addonTable.inCombat = true
        SafeLog("Player entered combat.")
    elseif event == "PLAYER_REGEN_ENABLED" then
        addonTable.inCombat = false
        SafeLog("Player exited combat.")
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, subevent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellId, spellName = CombatLogGetCurrentEventInfo()
        if subevent == "SPELL_CAST_SUCCESS" and sourceName == UnitName("player") then
            print("You cast " .. spellName)
            SafeLog("Spell cast: " .. spellName)
        end
    elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
        print("Specialization changed")
        SafeLog("Specialization changed")
        -- Reinitialize rotation function based on new spec
        C_Timer.After(1, function()
            if GetSpecialization then
                InitializeRotationFunction()
            else
                SafeLog("GetSpecialization not available, retrying...")
                C_Timer.After(1, InitializeRotationFunction)
            end
        end)
    else
        SafeLog("Unhandled event: " .. event)
    end
end)

-- Load rotation functions from separate files
local function LoadRotationFunctions()
    local classes = {"DEATHKNIGHT", "DEMONHUNTER", "DRUID", "HUNTER", "MAGE", "MONK", "PALADIN", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "WARRIOR", "EVOKER"}
    for _, class in ipairs(classes) do
        local rotationFile = "Interface\\AddOns\\" .. addonName .. "\\" .. class
        local loaded, reason = LoadAddOn(rotationFile)
        if not loaded then
            SafeLog("Failed to load rotation file for " .. class .. ": " .. reason)
        end
    end
end

LoadRotationFunctions()

-- Function to suggest spells
local function SuggestSpells()
    if addonTable.rotationEnabled and addonTable.inCombat then
        -- Example spell suggestion logic
        if IsUsableSpell("SpellName") and GetSpellCooldown("SpellName") == 0 then
            print("Suggest casting: SpellName")
        end
    end
end

local function Rotation()
    if not addonTable.rotationEnabled then
        return -- Exit the function if rotation is disabled
    end

    if addonTable.currentRotationFunction then
        addonTable.currentRotationFunction()
    end

    SuggestSpells() -- Call the suggestion function
end

-- Call the rotation function on a timer
C_Timer.NewTicker(1, Rotation)

-- Load the UI elements from a separate file
local function LoadUIElements()
    local uiFile = "Interface\\AddOns\\" .. addonName .. "\\UI.lua"
    local loaded, reason = LoadAddOn(uiFile)
    if not loaded then
        SafeLog("Failed to load UI file: " .. reason)
    end
end

LoadUIElements()

-- Define the new slash command
SLASH_ALLFORONEINFO1 = "/allforoneinfo"

-- Create the command handler
local function HandleInfoCommand(msg)
    print("AllforOne Addon Information:")
    print("Version: 1.0")
    print("Author: Raiff")
    SafeLog("Info command executed.")
end

-- Register the command
SlashCmdList["ALLFORONEINFO"] = HandleInfoCommand

-- Define the new slash command for the tutorial
SLASH_ALLFORONETUTORIAL1 = "/allforonetutorial"

-- Create the command handler for the tutorial
local function HandleTutorialCommand(msg)
    addonTable:ShowTutorial(true)
    SafeLog("Tutorial command executed.")
end

-- Register the tutorial command
SlashCmdList["ALLFORONETUTORIAL"] = HandleTutorialCommand

-- Define the new slash command for settings
SLASH_ALLFORONESETTINGS1 = "/allforonesettings"

-- Create the command handler for settings
local function HandleSettingsCommand(msg)
    if addonTable.settingsPanel then
        addonTable.settingsPanel:Show()
        SafeLog("Settings panel opened.")
    else
        SafeLog("Error: settingsPanel is nil.")
    end
end

-- Register the settings command
SlashCmdList["ALLFORONESETTINGS"] = HandleSettingsCommand

-- Create a macro for toggling rotation
local function CreateToggleMacro()
    local macroName = "ToggleRotation"
    local macroIcon = "INV_Misc_QuestionMark"
    local macroBody = "/allforone toggle"

    -- Check if the macro already exists
    for i = 1, MAX_ACCOUNT_MACROS do
        local name = GetMacroInfo(i)
        if name == macroName then
            return -- Macro already exists, no need to create it
        end
    end

    -- Create the macro
    CreateMacro(macroName, macroIcon, macroBody, nil)
    SafeLog("Macro created: " .. macroName)
end

-- Create the macro on addon load
CreateToggleMacro()