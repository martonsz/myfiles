#!/bin/bash

set -euo pipefail

print_help() {
	cat <<'EOF'
Configure macOS settings

Usage:
	$(basename $0) [options] <command>

Commands:
	caps-to-ctrl      Remap Caps Lock to Left Control
	restore-caps      Restore Caps Lock to its default behavior
	disable-press-hold Disable macOS press-and-hold popup (enables key repeat)
	restore-press-hold Restore macOS press-and-hold popup

Options:
	-h                Show this help and exit

Notes:
	- Uses 'hidutil' for per-user keyboard remapping.
	- Changes are not persistent across reboots unless applied at login.
		You can add this script invocation to a login item or launch agent.
	- Press-and-hold popup setting is global (NSGlobalDomain) via 'defaults'.
EOF
}

require_macos() {
	if [[ $(uname) != "Darwin" ]]; then
		echo "This script must be run on macOS (Darwin)." >&2
		exit 1
	fi
}

# Remap Caps Lock (0x700000039) to Left Control (0x7000000E0)
set_capslock_to_ctrl() {
	require_macos
	local mapping='{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}'
	hidutil property --set "${mapping}" >/dev/null
	echo "Caps Lock mapped to Left Control."
}

# Restore default (remove user mapping)
restore_capslock() {
	require_macos
	local clear='{"UserKeyMapping":[]}'
	hidutil property --set "${clear}" >/dev/null
	echo "Caps Lock restored to default behavior."
}

# Disable press-and-hold popup to allow key repeats (better for Vim)
disable_press_hold() {
	require_macos
	defaults write -g ApplePressAndHoldEnabled -bool false
	echo "Press-and-hold popup disabled; key repeat enabled. Restart apps to apply."
}

# Restore press-and-hold popup
restore_press_hold() {
	require_macos
	defaults write -g ApplePressAndHoldEnabled -bool true
	echo "Press-and-hold popup restored. Restart apps to apply."
}

parse_args() {
	local OPTIND opt
	while getopts ":h" opt; do
		case "$opt" in
			h)
				print_help
				exit 0
				;;
			\?)
				echo "Unknown option: -$OPTARG" >&2
				print_help
				exit 1
				;;
		esac
	done
	shift $((OPTIND-1))

	local cmd=${1:-}
	case "${cmd}" in
		caps-to-ctrl)
			set_capslock_to_ctrl
			;;
		restore-caps)
			restore_capslock
			;;
		disable-press-hold)
			disable_press_hold
			;;
		restore-press-hold)
			restore_press_hold
			;;
		""|-*)
			print_help
			exit 1
			;;
		*)
			echo "Unknown command: ${cmd}" >&2
			print_help
			exit 1
			;;
	esac
}

main() {
	parse_args "$@"
}

main "$@"
