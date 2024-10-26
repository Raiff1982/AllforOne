return function(addonTable)
    -- Ensure the GetRotationFunction table exists
    addonTable.GetRotationFunction = addonTable.GetRotationFunction or {}

    -- Define rotation logic for Priest specializations
    addonTable.GetRotationFunction["PRIEST"] = {
        ["DISCIPLINE"] = function()
            -- Discipline Priest rotation logic
            if IsUsableSpell("Penance") and GetSpellCooldown("Penance") == 0 then
                CastSpellByName("Penance")
            end
            if IsUsableSpell("Power Word: Shield") and GetSpellCooldown("Power Word: Shield") == 0 then
                CastSpellByName("Power Word: Shield")
            end
            if IsUsableSpell("Shadowfiend") and GetSpellCooldown("Shadowfiend") == 0 then
                CastSpellByName("Shadowfiend")
            end
            if IsUsableSpell("Smite") and GetSpellCooldown("Smite") == 0 then
                CastSpellByName("Smite")
            end
        end,
        ["HOLY"] = function()
            -- Holy Priest rotation logic
            if IsUsableSpell("Heal") and GetSpellCooldown("Heal") == 0 then
                CastSpellByName("Heal")
            end
            if IsUsableSpell("Prayer of Healing") and GetSpellCooldown("Prayer of Healing") == 0 then
                CastSpellByName("Prayer of Healing")
            end
            if IsUsableSpell("Holy Word: Serenity") and GetSpellCooldown("Holy Word: Serenity") == 0 then
                CastSpellByName("Holy Word: Serenity")
            end
            if IsUsableSpell("Renew") and GetSpellCooldown("Renew") == 0 then
                CastSpellByName("Renew")
            end
        end,
        ["SHADOW"] = function()
            -- Shadow Priest rotation logic
            if not UnitDebuff("target", "Shadow Word: Pain") and IsUsableSpell("Shadow Word: Pain") and GetSpellCooldown("Shadow Word: Pain") == 0 then
                CastSpellByName("Shadow Word: Pain")
            end
            if not UnitDebuff("target", "Vampiric Touch") and IsUsableSpell("Vampiric Touch") and GetSpellCooldown("Vampiric Touch") == 0 then
                CastSpellByName("Vampiric Touch")
            end
            if not UnitDebuff("target", "Devouring Plague") and IsUsableSpell("Devouring Plague") and GetSpellCooldown("Devouring Plague") == 0 then
                CastSpellByName("Devouring Plague")
            end
            if IsUsableSpell("Mind Blast") and GetSpellCooldown("Mind Blast") == 0 then
                CastSpellByName("Mind Blast")
            end
            if UnitHealth("target") / UnitHealthMax("target") < 0.25 and IsUsableSpell("Shadow Word: Death") and GetSpellCooldown("Shadow Word: Death") == 0 then
                CastSpellByName("Shadow Word: Death")
            end
            if IsUsableSpell("Mind Flay") and GetSpellCooldown("Mind Flay") == 0 then
                CastSpellByName("Mind Flay")
            end
        end,
    }
end
