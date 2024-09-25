let custom = {
    font = "JetBrainsMono Nerd Font";
    fontSize = "20px";
    bg = "#282828";
    fg = "#ebdbb2";
    focusedBackground = "#504945";
};
in {
style = ''
* {
    font-family: ${custom.font};
}

window#waybar {
    background-color: ${custom.bg};
    font-size: ${custom.fontSize};
    color: ${custom.fg};
}

#workspaces {
    margin-left: 0.25em;
    margin-right: 0.5em;
}

#workspaces button {
    color: ${custom.fg};
    padding: 0px;
    margin: 0.25em 0em 0.25em 0em;
    min-width: 2em;
}

#workspaces button.focused {
    font-weight: bold;
    background-color: ${custom.focusedBackground};
}

#clock {
    font-weight: bold;
}

#custom-scratchpad_indicator, #pulseaudio, #network,
#clock, #memory, #tray, #idle_inhibitor, #privacy {
    margin-right: 1em;
}

#custom-tray {
    font-size: 1.25em;
}

#tray menu {
   background-color: ${custom.bg};
}

#pulseaudio.muted {}
'';
}
