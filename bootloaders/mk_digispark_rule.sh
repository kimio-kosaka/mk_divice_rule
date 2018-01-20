#!/bin/sh
rule_file=/etc/udev/rules.d/49-micronucleus.rules
str1='SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666"'
str2='KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"'
echo "Make roule file: $rule_file"
#
if [ -e $rule_file ]; then
  echo "Already '$rule_file' is existing"
  exit 0
else
  sudo touch $rule_file
  sudo chmod 666 $rule_file
  sudo echo $str1 >>$rule_file
  sudo echo $str2 >>$rule_file
  sudo chmod 644 $rule_file
  exit 0
fi

