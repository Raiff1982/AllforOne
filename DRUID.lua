return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Druid specializations
    addonTable.GetRotationFunction["DRUID"] = {
        ["BALANCE"] = function()
            -- Balance Druid rotation logic
            if not UnitDebuff("target", "Moonfire") and IsUsableSpell("Moonfire") and GetSpellCooldown("Moonfire") == 0 then
                CastSpellByName("Moonfire")
            end
            if not UnitDebuff("target", "Sunfire") and IsUsableSpell("Sunfire") and GetSpellCooldown("Sunfire") == 0 then
                CastSpellByName("Sunfire")
            end
            if IsUsableSpell("Starsurge") and GetSpellCooldown("Starsurge") == 0 then
                CastSpellByName("Starsurge")
            end
            if IsUsableSpell("Starfire") and GetSpellCooldown("Starfire") == 0 then
                CastSpellByName("Starfire")
            end
            if IsUsableSpell("Wrath") and GetSpellCooldown("Wrath") == 0 then
                CastSpellByName("Wrath")
            end
        end,
        ["FERAL"] = function()
            -- Feral Druid rotation logic
            if not UnitDebuff("target", "Rake") and IsUsableSpell("Rake") and GetSpellCooldown("Rake") == 0 then
                CastSpellByName("Rake")
            end
            if not UnitDebuff("target", "Rip") and IsUsableSpell("Rip") and GetSpellCooldown("Rip") == 0 then
                CastSpellByName("Rip")
            end
            if IsUsableSpell("Shred") and GetSpellCooldown("Shred") == 0 then
                CastSpellByName("Shred")
            end
            if IsUsableSpell("Ferocious Bite") and GetSpellCooldown("Ferocious Bite") == 0 then
                CastSpellByName("Ferocious Bite")
            end
        end,
        ["GUARDIAN"] = function()
            -- Guardian Druid rotation logic
            if IsUsableSpell("Mangle") and GetSpellCooldown("Mangle") == 0 then
                CastSpellByName("Mangle")
            end
            if IsUsableSpell("Thrash") and GetSpellCooldown("Thrash") == 0 then
                CastSpellByName("Thrash")
            end
            if IsUsableSpell("Ironfur") and GetSpellCooldown("Ironfur") == 0 then
                CastSpellByName("Ironfur")
            end
            if IsUsableSpell("Frenzied Regeneration") and GetSpellCooldown("Frenzied Regeneration") == 0 then
                CastSpellByName("Frenzied Regeneration")
            end
        end,
        ["RESTORATION"] = function()
            -- Restoration Druid rotation logic
            if IsUsableSpell("Rejuvenation") and GetSpellCooldown("Rejuvenation") == 0 then
                CastSpellByName("Rejuvenation")
            end
            if IsUsableSpell("Regrowth") and GetSpellCooldown("Regrowth") == 0 then
                CastSpellByName("Regrowth")
            end
            if IsUsableSpell("Wild Growth") and GetSpellCooldown("Wild Growth") == 0 then
                CastSpellByName("Wild Growth")
            end
            if IsUsableSpell("Swiftmend") and GetSpellCooldown("Swiftmend") == 0 then
                CastSpellByName("Swiftmend")
            end
        end,
    }
end
