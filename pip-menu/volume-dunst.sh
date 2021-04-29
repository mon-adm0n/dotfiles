#!/bin/sh

# This script display an appropriate volume icon according to the volume level

# Dependencies: `alsa-utils`
isOn=$(amixer sget Master | grep '\[on' | cut -d '[' -f 4)
vplus=$(sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +10%")
vmin=$(sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -10%")
svol=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
pvol=$(echo $vplus)

if [[ "$pvol" ]]; then
   echo $($(notify-send -t 300 $(echo $svol)))
  
elif [[ "$min" ]]; then
   echo $($(notify-send -t 300 $(echo $svol)))
   
else
  echo $($(notify-send -t 350 "Volume" $(echo $svol)))
fi
