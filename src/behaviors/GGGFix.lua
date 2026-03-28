table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "GGGFix",
        label = "GGG Echo Fix",
        default = true,
        tooltip =
        "Allows GGG to be offered in Jpom runs."
    })
table.insert(apply_fns, {
    key = "GGGFix",
    fn = function()
        if not TraitData.EchoRepeatKeepsakeBoon then return end
        backup(TraitData.EchoRepeatKeepsakeBoon, "GameStateRequirements")
        TraitData.EchoRepeatKeepsakeBoon.GameStateRequirements[2].HasNone = { "AthenaEncounterKeepsake",
            "FountainRarityKeepsake" }
        table.insert(TraitData.EchoRepeatKeepsakeBoon.GameStateRequirements, {
            Path = { "CurrentRun", "Hero", "SlottedTraits", "Keepsake" },
            IsNone = { "HadesAndPersephoneKeepsake", "EscalatingKeepsake" }
        })
    end
})
