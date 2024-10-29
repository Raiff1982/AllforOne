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

-- Create UI size slider
local uiSizeSlider = CreateFrame("Slider", "AllforOneUISizeSlider", addonTable.settingsPanel, "OptionsSliderTemplate")
uiSizeSlider:SetPoint("TOP", 0, -50)
uiSizeSlider:SetMinMaxValues(0.5, 2.0)
uiSizeSlider:SetValueStep(0.1)
uiSizeSlider:SetValue(1.0)
uiSizeSlider:SetWidth(200)
_G[uiSizeSlider:GetName() .. 'Low']:SetText('0.5')
_G[uiSizeSlider:GetName() .. 'High']:SetText('2.0')
_G[uiSizeSlider:GetName() .. 'Text']:SetText('UI Size')

uiSizeSlider:SetScript("OnValueChanged", function(self, value)
    addonTable.config.uiSize = value
    mainFrame:SetScale(value)
    SafeLog("UI size set to " .. value)
end)

-- Create color picker
local colorPickerButton = CreateFrame("Button", "AllforOneColorPickerButton", addonTable.settingsPanel, "UIPanelButtonTemplate")
colorPickerButton:SetPoint("TOP", uiSizeSlider, "BOTTOM", 0, -20)
colorPickerButton:SetSize(100, 30)
colorPickerButton:SetText("Pick Color")

colorPickerButton:SetScript("OnClick", function()
    local function ColorPickerCallback(restore)
        local newR, newG, newB, newA
        if restore then
            newR, newG, newB, newA = unpack(restore)
        else
            newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB()
        end
        addonTable.config.color = { newR, newG, newB, newA }
        mainFrame:SetBackdropColor(newR, newG, newB, newA)
        SafeLog("Color set to " .. newR .. ", " .. newG .. ", " .. newB .. ", " .. newA)
    end

    ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = 
        ColorPickerCallback, ColorPickerCallback, ColorPickerCallback
    ColorPickerFrame:SetColorRGB(unpack(addonTable.config.color))
    ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = true, addonTable.config.color[4]
    ColorPickerFrame.previousValues = { unpack(addonTable.config.color) }
    ColorPickerFrame:Show()
end)

-- Create spell sequence input box
local spellSequenceInput = CreateFrame("EditBox", "AllforOneSpellSequenceInput", addonTable.settingsPanel, "InputBoxTemplate")
spellSequenceInput:SetSize(200, 20)
spellSequenceInput:SetPoint("TOP", colorPickerButton, "BOTTOM", 0, -20)
spellSequenceInput:SetAutoFocus(false)
spellSequenceInput:SetMultiLine(false)
spellSequenceInput:SetText(table.concat(addonTable.config.spellSequence, ", "))

spellSequenceInput:SetScript("OnEnterPressed", function(self)
    local text = self:GetText()
    local sequence = { strsplit(", ", text) }
    addonTable.config.spellSequence = sequence
    SafeLog("Spell sequence set to " .. text)
    self:ClearFocus()
end)

-- Show the frame when the addon is loaded
mainFrame:RegisterEvent("PLAYER_LOGIN")
mainFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        self:Show()
    end
end)

-- Function to load rotation functions
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

-- Define the new slash command for the tutorial
SLASH_ALLFORONETUTORIAL1 = "/allforonetutorial"

-- Create the command handler for the tutorial
local function HandleTutorialCommand(msg)
    addonTable:ShowTutorial(true)
    SafeLog("Tutorial command executed.")
end

-- Register the tutorial command
SlashCmdList["ALLFORONETUTORIAL"] = HandleTutorialCommand