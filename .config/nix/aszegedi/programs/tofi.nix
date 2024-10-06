{ programs, pkgs, ... }:
let
  monitors = import ../../monitors.nix;
in 
{
  programs.tofi = {
    enable = true;
    settings = {
      anchor = "top";
      width = "100%";
      height = 39;
      horizontal = "true";
      font-size = 16;
      prompt-text = " run: > ";
      outline-width = 0;
      border-width = 0;
      font="${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
      min-input-width = 120;
      result-spacing = 15;
      padding-top = 5;
      padding-bottom = 5;
      padding-left = 0;
      padding-right = 0;
      text-color       = "#C0CAF5";
      prompt-color     = "#9ECE6A";
      background-color = "#1A1B26";
      selection-color  = "#1A1B26";
      selection-background  = "#7AA2F7";
      selection-background-padding = 10;
      output=monitors.main;
    };
  };
}
