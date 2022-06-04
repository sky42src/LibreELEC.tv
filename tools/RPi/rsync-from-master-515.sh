#!/bin/bash

for i in packages/linux/patches/raspberrypi packages/tools/rpi-eeprom packages/graphics/bcm2835-driver packages/tools/bcm2835-bootloader projects/RPi/filesystem projects/RPi/devices/RPi2/linux projects/RPi/devices/RPi4/linux ; do
  rsync -SrtlvHx --delete ../../master/${i}/ ${i}
done
