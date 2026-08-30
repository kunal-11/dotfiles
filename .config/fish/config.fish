if status is-login
	if test -z "$WAYLAND_DISPLAY"; and test "$XDG_VTNR" = 1
		exec sway --unsupported-gpu
	end
end

if status is-interactive
end

alias bt=bluetoothctl
starship init fish | source
