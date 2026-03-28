table.insert(option_fns,
    {
        type = "checkbox",
        configKey = "FamiliarDelayFix",
        label = "Familiar Delay Fix",
        default = true,
        tooltip =
        "Fixes Familiars being summoned after a delay upon entering a room."
    })
table.insert(apply_fns, {
    key = "FamiliarDelayFix",
    fn = function()
        local unblocked = RoomEventData.GlobalRoomInputUnblockedEvents
        for _, event in ipairs(unblocked) do
            if event.FunctionName == "FamiliarSetup" then
                backup(event, "Args")
                event.Args = {}
                break
            end
        end
    end
})
