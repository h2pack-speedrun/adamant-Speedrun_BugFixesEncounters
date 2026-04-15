local internal = BugFixesEncountersInternal
local option_fns = internal.option_fns
local hook_fns = internal.hook_fns

table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "SufferingFix",
        label = "Suffering Fix",
        default = true,
        tooltip =
        "Fixes Suffering on Sight not bypassing Wards vow when dealing damage."
    })

table.insert(hook_fns, function()
    modutil.mod.Path.Wrap("CheckSpawnCurseDamage", function(baseFunc, enemy, traitArgs)
        if not store.read("SufferingFix") or not lib.coordinator.isEnabled(store, public.definition.modpack) then
            return baseFunc(enemy, traitArgs)
        end

        if enemy.IsBoss or enemy.UseBossHealthBar or enemy.IgnoreCurseDamage or enemy.AlwaysTraitor then
            return
        end
        local damageAmount = 0
        for _, data in ipairs(traitArgs.DamageArgs) do
            if not data.Chance or RandomChance(data.Chance * GetTotalHeroTraitValue("LuckMultiplier", { IsMultiplier = true })) then
                damageAmount = RandomInt(data.MinDamage, data.MaxDamage)
                break
            end
        end
        thread(DoCurseDamage, enemy, traitArgs, damageAmount, true)
    end)
end)
