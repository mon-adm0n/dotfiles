#!/bin/sh

# Display temperature icon. un '#' to see the status too.

mpc_status=$(mpc status  | grep 'playing' | head -n 1 | cut -d '[' -f 2 | cut -d ']' -f 1)

if [ $mpc_status = 'playing' ]; then
   echo ~/home/m0n/.ncmpcpp/scripts/notify

fi
