{ programs, home, pkgs, ... }:
let
  bg = "#1A1B26";
  fg = "#C0CAF5";
  blue = "#7AA2F7";
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
        bs-hl-color = blue;
        caps-lock-bs-hl-color = blue;
        #key highlight color
        key-hl-color = blue;
        caps-lock-key-hl-color = blue;

        layout-bg-color = bg;
        layout-text-color = fg;

        color = bg;
        inside-color  =  transparent;
        ring-color = bg;
        line-color = fg;
        line-caps-lock-color = fg;
        separator-color = bg;
        text-color = fg;
        
        inside-clear-color = transparent;
        ring-clear-color = fg;
        text-clear-color = fg;

        inside-caps-lock-color = transparent;
        ring-caps-lock-color = bg;
        text-caps-lock-color = fg;
        
        inside-ver-color = transparent;
        ring-ver-color = fg;
        text-ver-color = fg;

        inside-wrong-color = transparent;
        ring-wrong-color = bg;
        text-wrong-color = fg;
    };
}
