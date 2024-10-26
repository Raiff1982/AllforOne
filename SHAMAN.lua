return function(addonTable)
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}
    addonTable.GetRotationFunction["SHAMAN"] = {
        ["ELEMENTAL"] = function()
            -- Elemental Shaman rotation logic
            if IsUsableSpell("Flame Shock") and GetSpellCooldown("Flame Shock") == 0 then
                CastSpellByName("Flame Shock")
            end
            if IsUsableSpell("Lava Burst") and GetSpellCooldown("Lava Burst") == 0 then
                CastSpellByName("Lava Burst")
            end
            if IsUsableSpell("Earth Shock") and GetSpellCooldown("Earth Shock") == 0 then
                CastSpellByName("Earth Shock")
            end
            if IsUsableSpell("Lightning Bolt") and GetSpellCooldown("Lightning Bolt") == 0 then
                CastSpellByName("Lightning Bolt")
            end
        end,
        ["ENHANCEMENT"] = function()
            -- Enhancement Shaman rotation logic
            if IsUsableSpell("Stormstrike") and GetSpellCooldown("Stormstrike") == 0 then
                CastSpellByName("Stormstrike")
            end
            if IsUsableSpell("Lava Lash") and GetSpellCooldown("Lava Lash") == 0 then
                CastSpellByName("Lava Lash")
            end
            if IsUsableSpell("Flame Shock") and GetSpellCooldown("Flame Shock") == 0 then
                CastSpellByName("Flame Shock")
            end
            if IsUsableSpell("Feral Spirit") and GetSpellCooldown("Feral Spirit") == 0 then
                CastSpellByName("Feral Spirit")
            end
        end,
        ["RESTORATION"] = function()
            -- Restoration Shaman rotation logic
            if IsUsableSpell("Riptide") and GetSpellCooldown("Riptide") == 0 then
                CastSpellByName("Riptide")
            end
            if IsUsableSpell("Healing Wave") and GetSpellCooldown("Healing Wave") == 0 then
                CastSpellByName("Healing Wave")
            end
            if IsUsableSpell("Chain Heal") and GetSpellCooldown("Chain Heal") == 0 then
                CastSpellByName("Chain Heal")
            end
            if IsUsableSpell("Healing Rain") and GetSpellCooldown("Healing Rain") == 0 then
                CastSpellByName("Healing Rain")
            end
        end,
    }
end
