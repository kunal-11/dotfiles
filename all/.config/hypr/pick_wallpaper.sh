# Pick random wallpaper
random_pick=$(find ~/wallpapers -type f -name "*.png" -o -name "*.jpg" | shuf -n1)
# Replace the placeholder in template and save to .conf file
sed -e "s~<wp>~${random_pick}~g" ~/.config/hypr/hyprpaper.template > ~/.config/hypr/hyprpaper.conf
