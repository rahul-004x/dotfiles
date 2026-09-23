#!/bin/sh
# Usage: navigate.sh <left|down|up|right>
#
# Bound to ctrl+h/j/k/l in config.toml. herdr has no built-in "pass the key
# through when vim is focused" option (tmux's is_vim trick), so this script
# does it: if nvim/vim is the focused pane's foreground process, forward the
# key so nvim can move between its own windows (and hand back to herdr at the
# edge, see nvim/lua/plugins/herdr_navigation.lua); otherwise focus the
# neighbouring herdr pane.

direction="$1"
herdr="${HERDR_BIN_PATH:-herdr}"
pane_id="$HERDR_ACTIVE_PANE_ID"

case "$direction" in
left) key="ctrl+h" ;;
down) key="ctrl+j" ;;
up) key="ctrl+k" ;;
right) key="ctrl+l" ;;
*) exit 1 ;;
esac

[ -n "$pane_id" ] || exit 1

# Match on argv0 because "name" can be a version string (claude reports "2.1.280").
if "$herdr" pane process-info --pane "$pane_id" | grep -Eq '"argv0":"([^"]*/)?n?vim"'; then
	"$herdr" pane send-keys "$pane_id" "$key"
else
	"$herdr" pane focus --pane "$pane_id" --direction "$direction"
fi
