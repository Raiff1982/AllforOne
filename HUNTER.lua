return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Hunter specializations
    addonTable.GetRotationFunction["HUNTER"] = {
        ["BEASTMASTERY"] = function()
            -- Beast Mastery Hunter rotation logic
            if IsUsableSpell("Barbed Shot") and GetSpellCooldown("Barbed Shot") == 0 then
                if not CastSpellByName("Barbed Shot") then
                    addonTable.Log("Failed to cast Barbed Shot")
                end
            end
            if IsUsableSpell("Kill Command") and GetSpellCooldown("Kill Command") == 0 then
                if not CastSpellByName("Kill Command") then
                    addonTable.Log("Failed to cast Kill Command")
                end
            end
            if IsUsableSpell("Cobra Shot") and GetSpellCooldown("Cobra Shot") == 0 then
                if not CastSpellByName("Cobra Shot") then
                    addonTable.Log("Failed to cast Cobra Shot")
                end
            end
            if IsUsableSpell("Bestial Wrath") and GetSpellCooldown("Bestial Wrath") == 0 then
                if not CastSpellByName("Bestial Wrath") then
                    addonTable.Log("Failed to cast Bestial Wrath")
                end
            end
        end,
        ["MARKSMANSHIP"] = function()
            -- Marksmanship Hunter rotation logic
            if IsUsableSpell("Aimed Shot") and GetSpellCooldown("Aimed Shot") == 0 then
                if not CastSpellByName("Aimed Shot") then
                    addonTable.Log("Failed to cast Aimed Shot")
                end
            end
            if IsUsableSpell("Arcane Shot") and GetSpellCooldown("Arcane Shot") == 0 then
                if not CastSpellByName("Arcane Shot") then
                    addonTable.Log("Failed to cast Arcane Shot")
                end
            end
            if IsUsableSpell("Rapid Fire") and GetSpellCooldown("Rapid Fire") == 0 then
                if not CastSpellByName("Rapid Fire") then
                    addonTable.Log("Failed to cast Rapid Fire")
                end
            end
            if IsUsableSpell("Trueshot") and GetSpellCooldown("Trueshot") == 0 then
                if not CastSpellByName("Trueshot") then
                    addonTable.Log("Failed to cast Trueshot")
                end
            end
        end,
        ["SURVIVAL"] = function()
            -- Survival Hunter rotation logic
            if IsUsableSpell("Raptor Strike") and GetSpellCooldown("Raptor Strike") == 0 then
                if not CastSpellByName("Raptor Strike") then
                    addonTable.Log("Failed to cast Raptor Strike")
                end
            end
            if IsUsableSpell("Serpent Sting") and GetSpellCooldown("Serpent Sting") == 0 then
                if not CastSpellByName("Serpent Sting") then
                    addonTable.Log("Failed to cast Serpent Sting")
                end
            end
            if IsUsableSpell("Kill Command") and GetSpellCooldown("Kill Command") == 0 then
                if not CastSpellByName("Kill Command") then
                    addonTable.Log("Failed to cast Kill Command")
                end
            end
            if IsUsableSpell("Wildfire Bomb") and GetSpellCooldown("Wildfire Bomb") == 0 then
                if not CastSpellByName("Wildfire Bomb") then
                    addonTable.Log("Failed to cast Wildfire Bomb")
                end
            end
        end,
    }
end