local internal = BugFixesEncountersInternal
local option_fns = internal.option_fns
local patch_fns = internal.patch_fns

table.insert(option_fns,
    {
        type = "checkbox",
        alias = "CorrosionFix",
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
