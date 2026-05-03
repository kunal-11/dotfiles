#!/bin/fish
while true
	pkill swaybg
	sleep 2
	swaybg -i (find ~/wallpapers -type f | shuf -n1) -m fill &
	sleep 900
end
