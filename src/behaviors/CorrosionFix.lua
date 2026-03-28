table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "CorrosionFix",
        label = "Corrosion Fix",
        default = true,
        tooltip =
        "Fixes corrosion aggroing mobs on thessaly boats."
    })
table.insert(apply_fns, {
    key = "CorrosionFix",
    fn = function()
        if not TraitData.ArmorPenaltyCurse then return end
        backup(TraitData.ArmorPenaltyCurse.OnEnemySpawnFunction.Args, "SkipOnDamagedPowers")
        TraitData.ArmorPenaltyCurse.OnEnemySpawnFunction.Args.SkipOnDamagedPowers = true
    end
})
