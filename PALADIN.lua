return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Paladin specializations
    addonTable.GetRotationFunction["PALADIN"] = {
        ["HOLY"] = function()
            -- Holy Paladin rotation logic
            if IsUsableSpell("Holy Shock") and GetSpellCooldown("Holy Shock") == 0 then
                CastSpellByName("Holy Shock")
            end
            if IsUsableSpell("Flash of Light") and GetSpellCooldown("Flash of Light") == 0 then
                CastSpellByName("Flash of Light")
            end
            if IsUsableSpell("Light of Dawn") and GetSpellCooldown("Light of Dawn") == 0 then
                CastSpellByName("Light of Dawn")
            end
            if IsUsableSpell("Beacon of Light") and GetSpellCooldown("Beacon of Light") == 0 then
                CastSpellByName("Beacon of Light")
            end
        end,
        ["PROTECTION"] = function()
            -- Protection Paladin rotation logic
            if IsUsableSpell("Avenger's Shield") and GetSpellCooldown("Avenger's Shield") == 0 then
                CastSpellByName("Avenger's Shield")
            end
            if IsUsableSpell("Judgment") and GetSpellCooldown("Judgment") == 0 then
                CastSpellByName("Judgment")
            end
            if IsUsableSpell("Consecration") and GetSpellCooldown("Consecration") == 0 then
                CastSpellByName("Consecration")
            end
            if IsUsableSpell("Shield of the Righteous") and GetSpellCooldown("Shield of the Righteous") == 0 then
                CastSpellByName("Shield of the Righteous")
            end
        end,
        ["RETRIBUTION"] = function()
            -- Retribution Paladin rotation logic
            if IsUsableSpell("Blade of Justice") and GetSpellCooldown("Blade of Justice") == 0 then
                CastSpellByName("Blade of Justice")
            end
            if IsUsableSpell("Judgment") and GetSpellCooldown("Judgment") == 0 then
                CastSpellByName("Judgment")
            end
            if IsUsableSpell("Templar's Verdict") and GetSpellCooldown("Templar's Verdict") == 0 then
                CastSpellByName("Templar's Verdict")
            end
            if IsUsableSpell("Crusade") and GetSpellCooldown("Crusade") == 0 then
                CastSpellByName("Crusade")
            end
        end,
    }
end
