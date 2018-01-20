#!/bin/sh
rule_file=/etc/udev/rules.d/60-objdev.rules
str1=SUBSYSTEM=="usb", ATTR{product}=="USBasp", ATTR{idProduct}=="05dc", ATTRS{idVendor}=="16c0", MODE="0666"
echo "Make roule file: $rule_file"
if [ -e $rule_file ]; then
  echo "Already '$rule_file' is existing"
  exit 0
else
  sudo touch $rule_file
  sudo chmod 666 $rule_file
  sudo echo $str1 >>$rule_file
  sudo chmod 644 $rule_file
  exit 0
fi
