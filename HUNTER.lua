return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Hunter specializations
    addonTable.GetRotationFunction["HUNTER"] = {
        ["BEASTMASTERY"] = function()
            -- Beast Mastery Hunter rotation logic
            if IsUsableSpell("Barbed Shot") and GetSpellCooldown("Barbed Shot") == 0 then
                CastSpellByName("Barbed Shot")
            end
            if IsUsableSpell("Kill Command") and GetSpellCooldown("Kill Command") == 0 then
                CastSpellByName("Kill Command")
            end
            if IsUsableSpell("Cobra Shot") and GetSpellCooldown("Cobra Shot") == 0 then
                CastSpellByName("Cobra Shot")
            end
            if IsUsableSpell("Bestial Wrath") and GetSpellCooldown("Bestial Wrath") == 0 then
                CastSpellByName("Bestial Wrath")
            end
        end,
        ["MARKSMANSHIP"] = function()
            -- Marksmanship Hunter rotation logic
            if IsUsableSpell("Aimed Shot") and GetSpellCooldown("Aimed Shot") == 0 then
                CastSpellByName("Aimed Shot")
            end
            if IsUsableSpell("Arcane Shot") and GetSpellCooldown("Arcane Shot") == 0 then
                CastSpellByName("Arcane Shot")
            end
            if IsUsableSpell("Rapid Fire") and GetSpellCooldown("Rapid Fire") == 0 then
                CastSpellByName("Rapid Fire")
            end
            if IsUsableSpell("Trueshot") and GetSpellCooldown("Trueshot") == 0 then
                CastSpellByName("Trueshot")
            end
        end,
        ["SURVIVAL"] = function()
            -- Survival Hunter rotation logic
            if IsUsableSpell("Raptor Strike") and GetSpellCooldown("Raptor Strike") == 0 then
                CastSpellByName("Raptor Strike")
            end
            if IsUsableSpell("Serpent Sting") and GetSpellCooldown("Serpent Sting") == 0 then
                CastSpellByName("Serpent Sting")
            end
            if IsUsableSpell("Kill Command") and GetSpellCooldown("Kill Command") == 0 then
                CastSpellByName("Kill Command")
            end
            if IsUsableSpell("Wildfire Bomb") and GetSpellCooldown("Wildfire Bomb") == 0 then
                CastSpellByName("Wildfire Bomb")
            end
        end,
    }
end
