return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Death Knight specializations
    addonTable.GetRotationFunction["DEATHKNIGHT"] = {
        ["BLOOD"] = function()
            -- Blood Death Knight rotation logic
            if not UnitDebuff("target", "Blood Plague") and IsUsableSpell("Blood Plague") and GetSpellCooldown("Blood Plague") == 0 then
                CastSpellByName("Blood Plague")
            end
            if IsUsableSpell("Heart Strike") and GetSpellCooldown("Heart Strike") == 0 then
                CastSpellByName("Heart Strike")
            end
            if IsUsableSpell("Death Strike") and GetSpellCooldown("Death Strike") == 0 then
                CastSpellByName("Death Strike")
            end
            if IsUsableSpell("Marrowrend") and GetSpellCooldown("Marrowrend") == 0 then
                CastSpellByName("Marrowrend")
            end
        end,
        ["FROST"] = function()
            -- Frost Death Knight rotation logic
            if IsUsableSpell("Howling Blast") and GetSpellCooldown("Howling Blast") == 0 then
                CastSpellByName("Howling Blast")
            end
            if IsUsableSpell("Obliterate") and GetSpellCooldown("Obliterate") == 0 then
                CastSpellByName("Obliterate")
            end
            if IsUsableSpell("Frost Strike") and GetSpellCooldown("Frost Strike") == 0 then
                CastSpellByName("Frost Strike")
            end
            if IsUsableSpell("Remorseless Winter") and GetSpellCooldown("Remorseless Winter") == 0 then
                CastSpellByName("Remorseless Winter")
            end
        end,
        ["UNHOLY"] = function()
            -- Unholy Death Knight rotation logic
            if not UnitDebuff("target", "Virulent Plague") and IsUsableSpell("Outbreak") and GetSpellCooldown("Outbreak") == 0 then
                CastSpellByName("Outbreak")
            end
            if IsUsableSpell("Festering Strike") and GetSpellCooldown("Festering Strike") == 0 then
                CastSpellByName("Festering Strike")
            end
            if IsUsableSpell("Scourge Strike") and GetSpellCooldown("Scourge Strike") == 0 then
                CastSpellByName("Scourge Strike")
            end
            if IsUsableSpell("Death Coil") and GetSpellCooldown("Death Coil") == 0 then
                CastSpellByName("Death Coil")
            end
        end,
    }
end
