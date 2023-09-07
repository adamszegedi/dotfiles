#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Environment variables
export QT_QPA_PLATFORMTHEME=qt5ct

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway
