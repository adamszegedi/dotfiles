{ pkgs, programs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    import = [
      "${pkgs.alacritty-theme}/tokyo-night.toml"
    ];
    mouse.hide_when_typing = true;
    font = {
      size = 18;
      normal.family = "FiraCode Nerd Font Ret";
    };
  };
}
