return function(addonTable)
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}
    addonTable.GetRotationFunction["WARLOCK"] = {
        ["AFFLICTION"] = function()
            -- Affliction Warlock rotation logic
            if not UnitDebuff("target", "Agony") and IsUsableSpell("Agony") and GetSpellCooldown("Agony") == 0 then
                CastSpellByName("Agony")
            end
            if not UnitDebuff("target", "Corruption") and IsUsableSpell("Corruption") and GetSpellCooldown("Corruption") == 0 then
                CastSpellByName("Corruption")
            end
            if not UnitDebuff("target", "Unstable Affliction") and IsUsableSpell("Unstable Affliction") and GetSpellCooldown("Unstable Affliction") == 0 then
                CastSpellByName("Unstable Affliction")
            end
            if IsUsableSpell("Drain Soul") and GetSpellCooldown("Drain Soul") == 0 then
                CastSpellByName("Drain Soul")
            end
        end,
        ["DEMONOLOGY"] = function()
            -- Demonology Warlock rotation logic
            if IsUsableSpell("Shadow Bolt") and GetSpellCooldown("Shadow Bolt") == 0 then
                CastSpellByName("Shadow Bolt")
            end
            if IsUsableSpell("Hand of Gul'dan") and GetSpellCooldown("Hand of Gul'dan") == 0 then
                CastSpellByName("Hand of Gul'dan")
            end
            if IsUsableSpell("Demonic Empowerment") and GetSpellCooldown("Demonic Empowerment") == 0 then
                CastSpellByName("Demonic Empowerment")
            end
            if IsUsableSpell("Summon Demonic Tyrant") and GetSpellCooldown("Summon Demonic Tyrant") == 0 then
                CastSpellByName("Summon Demonic Tyrant")
            end
        end,
        ["DESTRUCTION"] = function()
            -- Destruction Warlock rotation logic
            if IsUsableSpell("Immolate") and GetSpellCooldown("Immolate") == 0 then
                CastSpellByName("Immolate")
            end
            if IsUsableSpell("Conflagrate") and GetSpellCooldown("Conflagrate") == 0 then
                CastSpellByName("Conflagrate")
            end
            if IsUsableSpell("Chaos Bolt") and GetSpellCooldown("Chaos Bolt") == 0 then
                CastSpellByName("Chaos Bolt")
            end
            if IsUsableSpell("Incinerate") and GetSpellCooldown("Incinerate") == 0 then
                CastSpellByName("Incinerate")
            end
        end,
    }
end
