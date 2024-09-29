{ programs, ... }:
let
  bg = "#282828ff";
  fg = "#ebdbb2ff";
  purple = "#d3869bff";
  red = "#fb4934ff";
  blue = "#83a598ff";
  green = "#b8bb26";
  fg3 = "#bdae93ff";
  bg1 = "#3c3836ff";
in
{
    programs.swaylock.enable = true;
    programs.swaylock.settings = {
        ignore-empty-password = true;
        indicator-caps-lock = true;
        show-keyboard-layout = true;
        indicator-radius = 200;
        indicator-thickness = 45;

        #backspace highlight color
        bs-hl-color = green;
        caps-lock-bs-hl-color = green;
        #key highlight color
        key-hl-color = fg;
        caps-lock-key-hl-color = purple;

        layout-bg-color = bg;
        layout-text-color = fg;

        color = bg;
        inside-color  =  bg;
        ring-color = bg1;
        line-color = fg;
        line-caps-lock-color = fg;
        separator-color = bg1;
        text-color = fg;
        
        inside-clear-color = bg;
        ring-clear-color = fg;
        text-clear-color = fg;

        inside-caps-lock-color = bg;
        ring-caps-lock-color = bg1;
        text-caps-lock-color = fg;
        
        inside-ver-color = bg;
        ring-ver-color = fg3;
        text-ver-color = fg;

        inside-wrong-color = bg;
        ring-wrong-color = red;
        text-wrong-color = fg;
    };
}
