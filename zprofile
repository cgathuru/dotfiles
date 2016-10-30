if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	exec ssh-agent startx
fi
