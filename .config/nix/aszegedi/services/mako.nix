{ services, ...}:
{
    services.mako.enable = true;
    services.mako = {
        sort = "-priority";
        font = "DroidSansM Nerd Font 16";
        backgroundColor = "#282828";
        textColor = "#ebdbb2";
        borderColor = "#a89984";

        progressColor = "over #665c5480";
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
