#!/bin/sh

# This script display an appropriate volume icon according to the volume level

# Authors: adm0n
# e-mail: sbang1970@gmail.com
# License: GPL3

# Dependencies: `alsa-utils`
status=$(acpi -b | grep ':' | head -n 4 | cut -d ':' -f 2 | cut -d ',' -f 1)
bat=$(acpi -b | grep '%' | head -n 4 | cut -d ',' -f 2 | cut -d '%' -f 1)"%"
pSta=$(echo $status)
pBat=$(echo $bat)


if [[ $pBat > 69% && $pBat < 99% && $pSta = 'Discharging' ]]; then
  echo ~/.config/tint2/icons/icons8-full-battery-100.png
  echo $bat

elif [[ $pBat = 100% && $pSta = 'Charging' ]]; then
  echo ~/.config/tint2/icons/icons8-full-battery-100.png
  echo $(notify-send -t 1000 "Battery Full" -u normal)  
  echo $bat

elif [[ $pBat > 29% && $pBat < 70% && $pSta = 'Discharging' ]]; then
  echo ~/.config/tint2/icons/icons8-battery-level-100.png
  echo $bat

elif [[ $pBat = 10% && $pSta = 'Discharging' ]]; then
  echo ~/.config/tint2/icons/icons8-empty-battery-100.png 
  echo $(notify-send -t 1000 "Battery Low" -u critical)
  echo $bat

elif [[ $pSta = 'Charging' ]]; then
  echo ~/.config/tint2/icons/icons8-recharge-battery-100.png
  echo $bat

else
  echo ~/.config/tint2/icons/icons8-empty-battery-100.png
  echo $bat
fi
