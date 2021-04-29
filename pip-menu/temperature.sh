#!/bin/sh

# Display temperature icon. un '#' to see the temperature too.

temperature=$(sensors | grep -A 2 acpitz-acpi-0 | grep 'temp1' | head -n 1 | cut -d '+' -f 2 | cut -d '(' -f 1 )

echo ~/.config/tint2/icons/temperature.png
#echo $temperature
