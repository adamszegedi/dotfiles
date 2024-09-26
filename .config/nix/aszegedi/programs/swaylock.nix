{ programs, ... }:
let
  bg = "#282828ff";
  fg = "#ebdbb2ff";
  purple = "#d3869bff";
  red = "#fb4934ff";
  blue = "#83a598ff";
  orange = "#d65d0eff";
  green = "#98971aff";
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
        bs-hl-color = blue;
        caps-lock-bs-hl-color = blue;
        #key highlight color
        key-hl-color = fg3;
        caps-lock-key-hl-color = purple;

        layout-bg-color = bg;
        layout-text-color = fg;

        color = bg;
        inside-color  =  bg;
        ring-color = bg1;
        text-color = fg;
        
        inside-clear-color = bg;
        ring-clear-color = green;
        text-clear-color = fg;

        inside-caps-lock-color = bg;
        ring-caps-lock-color = orange;
        text-caps-lock-color = fg;
        
        inside-ver-color = fg3;
        ring-ver-color = fg3;
        text-ver-color = bg;

        inside-wrong-color = red;
        ring-wrong-color = red;
        text-wrong-color = bg;
    };
}
