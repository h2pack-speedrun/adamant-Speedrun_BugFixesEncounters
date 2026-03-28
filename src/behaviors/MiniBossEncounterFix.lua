table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "MiniBossEncounterFix",
        label = "Miniboss Encounter Fix",
        default = true,
        tooltip =
        "Fixes Miniboss with top screen health bars not properly progressing biome depth."
    })
table.insert(apply_fns, {
    key = "MiniBossEncounterFix",
    fn = function()
        backup(EncounterData.MiniBossBoar, "CountsForRoomEncounterDepth")
        backup(EncounterData.MiniBossCharybdis, "CountsForRoomEncounterDepth")
        backup(EncounterData.MiniBossTalos, "CountsForRoomEncounterDepth")
        backup(EncounterData.BossTyphonEye01, "CountsForRoomEncounterDepth")
        backup(EncounterData.BossTyphonArm01, "CountsForRoomEncounterDepth")
        EncounterData.MiniBossBoar.CountsForRoomEncounterDepth      = true
        EncounterData.MiniBossCharybdis.CountsForRoomEncounterDepth = true
        EncounterData.MiniBossTalos.CountsForRoomEncounterDepth     = true
        EncounterData.BossTyphonEye01.CountsForRoomEncounterDepth   = true
        EncounterData.BossTyphonArm01.CountsForRoomEncounterDepth   = true
    end
})
