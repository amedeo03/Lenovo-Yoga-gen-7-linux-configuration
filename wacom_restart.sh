#!/bin/sh

MODULE="wacom"

if lsmod | grep "$MODULE" &> /dev/null ; then
  echo "$MODULE is already loaded, unloading it"
  
  sudo rmmod $MODULE
  echo "$MODULE has been unloaded"
  
  sudo modprobe $MODULE
  echo "$MODULE has been loaded succeefully"

  exit 0

else
  echo "$MODULE is not loaded"
  
  sudo modprobe $MODULE
  echo "$MODULE has been loaded succesfully"
  exit 1
fi
