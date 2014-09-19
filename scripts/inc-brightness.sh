#! /bin/bash

current=`cat /sys/class/backlight/acpi_video0/brightness`
echo $current


if [ $current -le 22 ]; then

  new=$(($current + 2))

else

  new=24

fi

echo $new > /sys/class/backlight/acpi_video0/brightness
