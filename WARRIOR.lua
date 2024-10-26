return function(addonTable)
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}
    addonTable.GetRotationFunction["WARRIOR"] = {
        ["ARMS"] = function()
            -- Arms Warrior rotation logic
            if IsUsableSpell("Mortal Strike") and GetSpellCooldown("Mortal Strike") == 0 then
                CastSpellByName("Mortal Strike")
            end
            if IsUsableSpell("Overpower") and GetSpellCooldown("Overpower") == 0 then
                CastSpellByName("Overpower")
            end
            if IsUsableSpell("Execute") and GetSpellCooldown("Execute") == 0 then
                CastSpellByName("Execute")
            end
            if IsUsableSpell("Slam") and GetSpellCooldown("Slam") == 0 then
                CastSpellByName("Slam")
            end
        end,
        ["FURY"] = function()
            -- Fury Warrior rotation logic
            if IsUsableSpell("Bloodthirst") and GetSpellCooldown("Bloodthirst") == 0 then
                CastSpellByName("Bloodthirst")
            end
            if IsUsableSpell("Raging Blow") and GetSpellCooldown("Raging Blow") == 0 then
                CastSpellByName("Raging Blow")
            end
            if IsUsableSpell("Rampage") and GetSpellCooldown("Rampage") == 0 then
                CastSpellByName("Rampage")
            end
            if IsUsableSpell("Recklessness") and GetSpellCooldown("Recklessness") == 0 then
                CastSpellByName("Recklessness")
            end
        end,
        ["PROTECTION"] = function()
            -- Protection Warrior rotation logic
            if IsUsableSpell("Shield Slam") and GetSpellCooldown("Shield Slam") == 0 then
                CastSpellByName("Shield Slam")
            end
            if IsUsableSpell("Revenge") and GetSpellCooldown("Revenge") == 0 then
                CastSpellByName("Revenge")
            end
            if IsUsableSpell("Thunder Clap") and GetSpellCooldown("Thunder Clap") == 0 then
                CastSpellByName("Thunder Clap")
            end
            if IsUsableSpell("Shield Block") and GetSpellCooldown("Shield Block") == 0 then
                CastSpellByName("Shield Block")
            end
        end,
    }
end