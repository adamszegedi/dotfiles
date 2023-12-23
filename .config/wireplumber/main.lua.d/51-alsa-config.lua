-- rule_disable_NVIDIA = {
--     matches = {
--         {
--             { "device.name", "equals", "alsa_card.pci-0000_0a_00.1" },
--         },
--     },
--     apply_properties = {
--         ["device.disabled"] = true,
--     },
-- }
-- table.insert(alsa_monitor.rules,rule_disable_NVIDIA)


-- alsa_card.pci-0000_0c_00.4
rule_disable_unused_devices = {
    matches = {
        {
            { "device.name", "equals", "alsa_card.pci-0000_0b_00.1" },
            { "device.name", "equals", "alsa_card.pci-0000_0d_00.4" },
        },
    },
    apply_properties = {
        ["device.disabled"] = true,
    },
}
table.insert(alsa_monitor.rules,rule_disable_unused_devices)

rule_rename_Zendac = {
    matches = {
        {
            { "device.name", "equals", "alsa_card.usb-iFi__by_AMR__iFi__by_AMR__HD_USB_Audio_0003-00" },
        },
    },
    apply_properties = {
        ["device.nick"] = "Zendac V2",
        ["device.description"] = "Zendac"
    },
}
table.insert(alsa_monitor.rules,rule_rename_Zendac)
