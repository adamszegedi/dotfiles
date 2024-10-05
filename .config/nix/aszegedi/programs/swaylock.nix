{ programs, home, pkgs, ... }:
let
  bg = "#282828ff";
  fg = "#ebdbb2ff";
  purple = "#d3869bff";
  red = "#fb4934ff";
  blue = "#83a598ff";
  green = "#b8bb26";
  fg3 = "#bdae93ff";
  bg1 = "#3c3836ff";
  transparent = "00000000";

  main-lock-file = "/tmp/lock-main.png";
  side-lock-file = "/tmp/lock-side.png";
  monitors = import ../../monitors.nix;
  overlay_target =  ".config/swaylock/overlay.png";
in
{
    home.file = {
      "overlay" = {
        source = ../images/overlay.png;
        target = overlay_target;
      };

      "lock" = {
      text = ''
        ${pkgs.grim}/bin/grim -o ${monitors.main} ${main-lock-file};
        ${pkgs.grim}/bin/grim -o ${monitors.side} ${side-lock-file};
        ${pkgs.imagemagick}/bin/magick ${main-lock-file} -blur 0x10 ${main-lock-file};
        ${pkgs.imagemagick}/bin/magick ${side-lock-file} -blur 0x10 ${side-lock-file};
        pos_x=780;
        pos_y=464;
        ${pkgs.imagemagick}/bin/magick ${main-lock-file} ~/${overlay_target} -geometry +$pos_x+$pos_y -composite ${main-lock-file};
        ${pkgs.swaylock}/bin/swaylock -f -i ${monitors.main}:${main-lock-file} -i ${monitors.side}:${side-lock-file}
      '';
      target = ".config/swaylock/lock.sh";
      executable = true;
      };
    };
    programs.swaylock.enable = true;
    programs.swaylock.settings = {
        ignore-empty-password = true;
        indicator-caps-lock = true;
        indicator-x-position = 1280;
        indicator-y-position = 1240;
        show-keyboard-layout = false;
        indicator-radius = 100;
        indicator-thickness = 30;

        #backspace highlight color
        bs-hl-color = green;
        caps-lock-bs-hl-color = green;
        #key highlight color
        key-hl-color = fg;
        caps-lock-key-hl-color = purple;

        layout-bg-color = bg;
        layout-text-color = fg;

        color = bg;
        inside-color  =  transparent;
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
