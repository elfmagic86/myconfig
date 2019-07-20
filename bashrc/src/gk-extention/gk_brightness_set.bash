# https://askubuntu.com/questions/149054/how-to-change-lcd-brightness-from-command-line-or-via-script
gk_brightness_set() {
	local pecent=${1:-1}

	local DISP=$(xrandr -q | grep " connected" | cut -d ' ' -f 1)
	xrandr --output $DISP --brightness $pecent
}

# For child-process(vim, else..)
export -f gk_brightness_set
