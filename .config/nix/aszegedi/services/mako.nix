{ services, ...}:
{
    services.mako.enable = true;
    services.mako = {
        sort = "-priority";
        font = "DroidSansM Nerd Font 16";
        backgroundColor = "#1A1B26";
        textColor = "#C0CAF5";
        borderColor = "#7AA2F7";

        progressColor = "over #7AA2F780";
        borderRadius = 8;
        borderSize = 2;
        anchor = "top-right";
        width = 450;
        height = 200;
        margin = "20,20,0";
        padding = "15,15,15";
        maxIconSize=96;
        defaultTimeout=10000;
        groupBy="category";

        extraConfig = ''
        on-button-left=invoke-default-action
        on-button-right=dismiss-all
        on-button-middle=dismiss
        [mode=do-not-disturb]
        invisible=1
        '';
    };
}
