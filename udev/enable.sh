#!/bin/bash

# for debugging use dmesg and udevadm

# ensure sudo
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Please run as root"
    exit
fi

# add group to current user
usermod -a -G dialout $USER

# copy udev rules
cp -f 70-corne-keyboard.rules  /etc/udev/rules.d/70-corne-keyboard.rules

# reload udev rules
udevadm control --reload-rules

echo "Done!"