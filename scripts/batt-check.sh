#!/bin/sh

CURRENT=$(cat /sys/class/power_supply/BAT0/charge_now)
MAX=$(cat /sys/class/power_supply/BAT0/charge_full)

BAT=$(echo "100*$CURRENT/$MAX" | bc)

if [ "$BAT" -lt 7 ] ;
  then /usr/sbin/pm-suspend ;
fi
