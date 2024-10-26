return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Demon Hunter specializations
    addonTable.GetRotationFunction["DEMONHUNTER"] = {
        ["HAVOC"] = function()
            -- Havoc Demon Hunter rotation logic
            if IsUsableSpell("Demon's Bite") and GetSpellCooldown("Demon's Bite") == 0 then
                CastSpellByName("Demon's Bite")
            end
            if IsUsableSpell("Chaos Strike") and GetSpellCooldown("Chaos Strike") == 0 then
                CastSpellByName("Chaos Strike")
            end
            if IsUsableSpell("Blade Dance") and GetSpellCooldown("Blade Dance") == 0 then
                CastSpellByName("Blade Dance")
            end
            if IsUsableSpell("Eye Beam") and GetSpellCooldown("Eye Beam") == 0 then
                CastSpellByName("Eye Beam")
            end
        end,
        ["VENGEANCE"] = function()
            -- Vengeance Demon Hunter rotation logic
            if IsUsableSpell("Shear") and GetSpellCooldown("Shear") == 0 then
                CastSpellByName("Shear")
            end
            if IsUsableSpell("Soul Cleave") and GetSpellCooldown("Soul Cleave") == 0 then
                CastSpellByName("Soul Cleave")
            end
            if IsUsableSpell("Immolation Aura") and GetSpellCooldown("Immolation Aura") == 0 then
                CastSpellByName("Immolation Aura")
            end
            if IsUsableSpell("Sigil of Flame") and GetSpellCooldown("Sigil of Flame") == 0 then
                CastSpellByName("Sigil of Flame")
            end
        end,
    }
end
