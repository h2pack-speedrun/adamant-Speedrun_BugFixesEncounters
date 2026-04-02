table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "FamiliarDelayFix",
        label = "Familiar Delay Fix",
        default = true,
        tooltip =
        "Fixes Familiars being summoned after a delay upon entering a room."
    })
table.insert(patch_fns, {
    key = "FamiliarDelayFix",
    fn = function(plan)
        plan:transform(RoomEventData, "GlobalRoomInputUnblockedEvents", function(unblocked)
            local copy = rom.game.DeepCopyTable(unblocked or {})
            for _, event in ipairs(copy) do
                if event.FunctionName == "FamiliarSetup" then
                    event.Args = {}
                    break
                end
            end
            return copy
        end)
    end
})
