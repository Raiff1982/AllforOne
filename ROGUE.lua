return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Rogue specializations
    addonTable.GetRotationFunction["ROGUE"] = {
        ["ASSASSINATION"] = function()
            -- Assassination Rogue rotation logic
            if not UnitDebuff("target", "Garrote") and IsUsableSpell("Garrote") and GetSpellCooldown("Garrote") == 0 then
                CastSpellByName("Garrote")
            end
            if not UnitDebuff("target", "Rupture") and IsUsableSpell("Rupture") and GetSpellCooldown("Rupture") == 0 then
                CastSpellByName("Rupture")
            end
            if IsUsableSpell("Mutilate") and GetSpellCooldown("Mutilate") == 0 then
                CastSpellByName("Mutilate")
            end
            if IsUsableSpell("Envenom") and GetSpellCooldown("Envenom") == 0 then
                CastSpellByName("Envenom")
            end
        end,
        ["OUTLAW"] = function()
            -- Outlaw Rogue rotation logic
            if IsUsableSpell("Sinister Strike") and GetSpellCooldown("Sinister Strike") == 0 then
                CastSpellByName("Sinister Strike")
            end
            if IsUsableSpell("Roll the Bones") and GetSpellCooldown("Roll the Bones") == 0 then
                CastSpellByName("Roll the Bones")
            end
            if IsUsableSpell("Dispatch") and GetSpellCooldown("Dispatch") == 0 then
                CastSpellByName("Dispatch")
            end
            if IsUsableSpell("Between the Eyes") and GetSpellCooldown("Between the Eyes") == 0 then
                CastSpellByName("Between the Eyes")
            end
        end,
        ["SUBTLETY"] = function()
            -- Subtlety Rogue rotation logic
            if IsUsableSpell("Shadowstrike") and GetSpellCooldown("Shadowstrike") == 0 then
                CastSpellByName("Shadowstrike")
            end
            if IsUsableSpell("Eviscerate") and GetSpellCooldown("Eviscerate") == 0 then
                CastSpellByName("Eviscerate")
            end
            if IsUsableSpell("Backstab") and GetSpellCooldown("Backstab") == 0 then
                CastSpellByName("Backstab")
            end
            if IsUsableSpell("Symbols of Death") and GetSpellCooldown("Symbols of Death") == 0 then
                CastSpellByName("Symbols of Death")
            end
        end,
    }
end
