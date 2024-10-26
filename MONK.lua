return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Monk specializations
    addonTable.GetRotationFunction["MONK"] = {
        ["BREWMASTER"] = function()
            -- Brewmaster Monk rotation logic
            if IsUsableSpell("Keg Smash") and GetSpellCooldown("Keg Smash") == 0 then
                CastSpellByName("Keg Smash")
            end
            if IsUsableSpell("Breath of Fire") and GetSpellCooldown("Breath of Fire") == 0 then
                CastSpellByName("Breath of Fire")
            end
            if IsUsableSpell("Tiger Palm") and GetSpellCooldown("Tiger Palm") == 0 then
                CastSpellByName("Tiger Palm")
            end
            if IsUsableSpell("Blackout Strike") and GetSpellCooldown("Blackout Strike") == 0 then
                CastSpellByName("Blackout Strike")
            end
        end,
        ["MISTWEAVER"] = function()
            -- Mistweaver Monk rotation logic
            if IsUsableSpell("Renewing Mist") and GetSpellCooldown("Renewing Mist") == 0 then
                CastSpellByName("Renewing Mist")
            end
            if IsUsableSpell("Enveloping Mist") and GetSpellCooldown("Enveloping Mist") == 0 then
                CastSpellByName("Enveloping Mist")
            end
            if IsUsableSpell("Vivify") and GetSpellCooldown("Vivify") == 0 then
                CastSpellByName("Vivify")
            end
            if IsUsableSpell("Essence Font") and GetSpellCooldown("Essence Font") == 0 then
                CastSpellByName("Essence Font")
            end
        end,
        ["WINDWALKER"] = function()
            -- Windwalker Monk rotation logic
            if IsUsableSpell("Tiger Palm") and GetSpellCooldown("Tiger Palm") == 0 then
                CastSpellByName("Tiger Palm")
            end
            if IsUsableSpell("Rising Sun Kick") and GetSpellCooldown("Rising Sun Kick") == 0 then
                CastSpellByName("Rising Sun Kick")
            end
            if IsUsableSpell("Fists of Fury") and GetSpellCooldown("Fists of Fury") == 0 then
                CastSpellByName("Fists of Fury")
            end
            if IsUsableSpell("Blackout Kick") and GetSpellCooldown("Blackout Kick") == 0 then
                CastSpellByName("Blackout Kick")
            end
        end,
    }
end
