#stop tint2 service
killall tint2
killall conky


#panel
tint2 -c /home/m0n/.config/tint2/tint2rc &

#background
feh --bg-scale .config/openbox/wallpaper/bg_25.jpg &
