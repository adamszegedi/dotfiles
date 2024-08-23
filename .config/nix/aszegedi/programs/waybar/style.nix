let custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "15px";
    bg = "rgba(28, 28, 28, 1)";
    fg = "#d0d0d0";
    focused = "#d0d0d0";
};
in {
style = ''
* {
    font-family: ${custom.font};
}

window#waybar {
    background-color: ${custom.bg};

    font-size: 20px;
    color: #d0d0d0;
}

#workspaces {
    margin-left: 0.25em;
    margin-right: 0.5em;
}

#workspaces button {
    padding: 0px;
    margin: 0.25em 0em 0.25em 0em;
    color: #d0d0d0;
    min-width: 2em;
}

#workspaces button.active {
    color: #d0d0d0; 
    box-shadow: rgb(86, 93, 97) 0px 0px 10px 5px inset;
}

#clock {
    font-weight: bold;
}

#custom-scratchpad_indicator, #pulseaudio, #network,
#clock, #memory, #tray, #idle_inhibitor, #privacy {
    margin-right: 1em;
}

#custom-tray {
    font-size: 25px;
}

#tray menu {
   background-color: rgba(28, 28, 28, 1);
}

#pulseaudio.muted {}
'';
}
