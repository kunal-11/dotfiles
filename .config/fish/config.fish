if status is-interactive
end

if status is-login 
	and test (tty) = /dev/tty1
        exec dbus-run-session river
end

alias bt=bluetoothctl

starship init fish | source
