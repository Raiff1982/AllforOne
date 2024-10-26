return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Mage specializations
    addonTable.GetRotationFunction["MAGE"] = {
        ["ARCANE"] = function()
            -- Arcane Mage rotation logic
            if IsUsableSpell("Arcane Blast") and GetSpellCooldown("Arcane Blast") == 0 then
                CastSpellByName("Arcane Blast")
            end
            if IsUsableSpell("Arcane Missiles") and GetSpellCooldown("Arcane Missiles") == 0 then
                CastSpellByName("Arcane Missiles")
            end
            if IsUsableSpell("Arcane Barrage") and GetSpellCooldown("Arcane Barrage") == 0 then
                CastSpellByName("Arcane Barrage")
            end
            if IsUsableSpell("Evocation") and GetSpellCooldown("Evocation") == 0 then
                CastSpellByName("Evocation")
            end
        end,
        ["FIRE"] = function()
            -- Fire Mage rotation logic
            if IsUsableSpell("Fireball") and GetSpellCooldown("Fireball") == 0 then
                CastSpellByName("Fireball")
            end
            if IsUsableSpell("Pyroblast") and GetSpellCooldown("Pyroblast") == 0 then
                CastSpellByName("Pyroblast")
            end
            if IsUsableSpell("Fire Blast") and GetSpellCooldown("Fire Blast") == 0 then
                CastSpellByName("Fire Blast")
            end
            if IsUsableSpell("Combustion") and GetSpellCooldown("Combustion") == 0 then
                CastSpellByName("Combustion")
            end
        end,
        ["FROST"] = function()
            -- Frost Mage rotation logic
            if IsUsableSpell("Frostbolt") and GetSpellCooldown("Frostbolt") == 0 then
                CastSpellByName("Frostbolt")
            end
            if IsUsableSpell("Ice Lance") and GetSpellCooldown("Ice Lance") == 0 then
                CastSpellByName("Ice Lance")
            end
            if IsUsableSpell("Flurry") and GetSpellCooldown("Flurry") == 0 then
                CastSpellByName("Flurry")
            end
            if IsUsableSpell("Frozen Orb") and GetSpellCooldown("Frozen Orb") == 0 then
                CastSpellByName("Frozen Orb")
            end
        end,
    }
end
