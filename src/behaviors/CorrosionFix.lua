table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "CorrosionFix",
        label = "Corrosion Fix",
        default = true,
        tooltip =
        "Fixes corrosion aggroing mobs on thessaly boats."
    })
table.insert(patch_fns, {
    key = "CorrosionFix",
    fn = function(plan)
        if not TraitData.ArmorPenaltyCurse then return end
        plan:set(TraitData.ArmorPenaltyCurse.OnEnemySpawnFunction.Args, "SkipOnDamagedPowers", true)
    end
})
