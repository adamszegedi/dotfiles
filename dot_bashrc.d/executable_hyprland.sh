# shellcheck shell=bash
command -v hyprland &>/dev/null || return

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] && uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi
