local addonName, addonTable = ...

-- Function to safely log messages
local function SafeLog(message)
    if addonTable and addonTable.Log then
        addonTable.Log(message)
    else
        print(message)
    end
end

-- Create the main frame
local mainFrame = CreateFrame("Frame", "AllforOneMainFrame", UIParent, "BackdropTemplate")
mainFrame:SetSize(300, 150)
mainFrame:SetPoint("CENTER")
mainFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
mainFrame:SetBackdropColor(0, 0, 0, 0.8)
mainFrame:SetBackdropBorderColor(1, 0.8, 0, 1)

mainFrame:SetMovable(true)
mainFrame:EnableMouse(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
    if self:IsMovable() then
        self:StartMoving()
    end
end)
mainFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

-- Create a title for the frame
local title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
title:SetPoint("TOP", 0, -10)
title:SetText("AllforOne Addon")
title:SetTextColor(1, 0.8, 0)

-- Create a button to toggle rotation
local toggleButton = CreateFrame("Button", nil, mainFrame, "GameMenuButtonTemplate")
toggleButton:SetPoint("CENTER")
toggleButton:SetSize(140, 40)
toggleButton:SetText("Toggle Rotation")
toggleButton:SetNormalFontObject("GameFontNormalLarge")
toggleButton:SetHighlightFontObject("GameFontHighlightLarge")

toggleButton:SetScript("OnClick", function()
    if addonTable then
        addonTable.rotationEnabled = not addonTable.rotationEnabled
        local status = addonTable.rotationEnabled and "enabled" or "disabled"
        print("Rotation " .. status)
        SafeLog("Rotation " .. status)
    else
        SafeLog("Error: addonTable is nil.")
    end
end)

-- Create a close button
local closeButton = CreateFrame("Button", nil, mainFrame, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", -5, -5)

-- Create the text box
addonTable.textBox = CreateFrame("EditBox", nil, UIParent, "InputBoxTemplate")
addonTable.textBox:SetSize(200, 20)
addonTable.textBox:SetPoint("CENTER", mainFrame, "BOTTOM", 0, -50)
addonTable.textBox:SetAutoFocus(false)
addonTable.textBox:SetMultiLine(false)
addonTable.textBox:EnableMouse(true)
addonTable.textBox:SetMovable(true)
addonTable.textBox:RegisterForDrag("LeftButton")
addonTable.textBox:SetScript("OnDragStart", function(self)
    if self:IsMovable() then
        self:StartMoving()
    end
end)
addonTable.textBox:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)
addonTable.textBox:Hide()

-- Add initial text
addonTable.textBox:SetText("Hello, World!")

-- Create the settings button
addonTable.settingsButton = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
addonTable.settingsButton:SetSize(100, 30)
addonTable.settingsButton:SetText("Settings")
addonTable.settingsButton:SetPoint("TOP", addonTable.textBox, "BOTTOM", 0, -10)
addonTable.settingsButton:SetScript("OnClick", function()
    if addonTable.settingsPanel then
        addonTable.settingsPanel:Show()
        SafeLog("Settings button clicked.")
    else
        SafeLog("Error: settingsPanel is nil.")
    end
end)

-- Create the settings panel
addonTable.settingsPanel = CreateFrame("Frame", nil, UIParent, "BasicFrameTemplateWithInset")
addonTable.settingsPanel:SetSize(300, 200)
addonTable.settingsPanel:SetPoint("CENTER")
addonTable.settingsPanel:Hide()

-- Title for the settings panel
addonTable.settingsPanel.title = addonTable.settingsPanel:CreateFontString(nil, "OVERLAY")
addonTable.settingsPanel.title:SetFontObject("GameFontHighlightLarge")
addonTable.settingsPanel.title:SetPoint("TOP", 0, -10)
addonTable.settingsPanel.title:SetText("Settings Panel")

-- Show the frame when the addon is loaded
mainFrame:RegisterEvent("PLAYER_LOGIN")
mainFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        self:Show()
    end
end)

-- Function to load rotation functions
local function LoadRotationFunctions()
    local classes = {"DEATHKNIGHT", "DEMONHUNTER", "DRUID", "HUNTER", "MAGE", "MONK", "PALADIN", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "WARRIOR"}
    for _, class in ipairs(classes) do
        local rotationFile = "Interface\\AddOns\\" .. addonName .. "\\" .. class
        local loaded, reason = LoadAddOn(rotationFile)
        if not loaded then
            SafeLog("Failed to load rotation file for " .. class .. ": " .. reason)
        end
    end
end

-- Call the function to load rotation functions
LoadRotationFunctions()

-- Function to suggest skills in sequence
local function SuggestSkillSequence(sequence)
    local index = 1
    local function SuggestNextSkill()
        if index <= #sequence then
            local skill = sequence[index]
            if IsUsableSpell(skill) and GetSpellCooldown(skill) == 0 then
                print("Suggest casting: " .. skill)
                index = index + 1
            end
        end
    end
    C_Timer.NewTicker(1, SuggestNextSkill, #sequence)
end

-- Example usage of SuggestSkillSequence
local skillSequence = {"Vampiric Touch", "Devouring Plague", "Shadow Word: Pain", "Mind Blast"}
SuggestSkillSequence(skillSequence)