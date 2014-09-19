#! /bin/bash

current=`cat /sys/class/backlight/acpi_video0/brightness`
echo $current


if [ $current -ge 2 ]; then

  new=$(($current - 2))
  echo $new > /sys/class/backlight/acpi_video0/brightness

else

  xset dpms force off  

fi

