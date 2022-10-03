if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	. startx
	logout
fi
