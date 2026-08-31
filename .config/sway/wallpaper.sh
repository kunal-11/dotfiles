#!/usr/bin/env fish

swaybg -i (find ~/wallpapers -type f | shuf -n1) -m fill &
set old_pid $last_pid

while true
	sleep 900
	
	swaybg -i (find ~/wallpapers -type f | shuf -n1) -m fill &
	set new_pid $last_pid

	kill $old_pid

	set old_pid $new_pid
end
