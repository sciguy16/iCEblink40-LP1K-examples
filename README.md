# Simple example Verilog code for the iCEblink40-LP1K evaluation board

This is a simple example program for the Lattice iCE40-LP1K written in Verilog and built using the open source toolchain.

# Tools used
* iCEblink40-LP1K https://www.latticesemi.com/iCEblink40-LP1K
* YOSYS https://github.com/YosysHQ/yosys
* NextPNR https://github.com/YosysHQ/nextpnr/
* iCEstorm http://www.clifford.at/icestorm/
* iCEburn https://github.com/davidcarne/iceBurn

# Examples
* counter: Binary counter on the 4 LEDs
* pwm: 26 kHz, 5-bit PWM ramp on an LED

# Usage
* Build the toolchain from source - I had problems using slightly older versions which were resolved by building them afresh
* Hit `make`
* Run `make prog` to run iCEburn to flash the board

# Notes
It may be helpful to use the following udev rule to allow members of the 'uucp' group to access the board:
```
# /etc/udev/rules.d/99-iceblink.rules
# Set Group for iCEblink40
SUBSYSTEM=="usb", ATTRS{idVendor}=="1443", ATTRS{idProduct}=="0007", GROUP="uucp"
```
