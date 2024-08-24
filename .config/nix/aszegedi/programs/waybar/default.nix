{ windowManager, monitors}:
{
    style = (import ./style.nix).style;
    settings = (import ./settings.nix {windowManager = windowManager; monitors=monitors;});
}
