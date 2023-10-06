# basic_circuits

The purpose of this repository is to provide an installation and usage guide for the Quartus II software, accompanied by
the resolution of various circuits in Verilog and a introduction to Verilog HDL. Quartus II is a fundamental tool in 
disciplines such as Digital Systems for Computing, Computer Organization and Architecture I, and Computer Organization 
and Architecture II.

* You can acess the Verilog Introduction Guide clicking [here](verilog_basics/verilog_introduction.MD)

* Note: We specifically use Quartus II version 13.01 sp because this is the latest version of Quartus that supports 
Cyclone II FPGAs, which we have on campus for use.


# Installation:

The installation of Quartus II will differ depending on the operating system used, so we will cover installation for 
Windows and Linux (Arch-based and Debian-based systems).

## Windows

First, simply download and install [Quartus II 13.01 sp](https://www.intel.com/content/www/us/en/software-kit/711791/intel-quartus-ii-web-edition-design-software-version-13-0sp1-for-windows.html?).
After that, to communicate with the FPGA using a USB port, you need to install the [USB Blaster driver](https://www.intel.com.br/content/www/br/pt/support/programmable/support-resources/download/dri-usb-blaster-vista.html).

* Note: In newer versions of Windows, you will have to disable the Windows Defender core isolation feature, because this 
driver is no longer supported.

## Arch-based Systems

To install on an Arch-based distro, simply download the AUR package called [quartus-free-130](https://aur.archlinux.org/packages/quartus-free-130).
To install it using [yay](https://github.com/Jguer/yay), you just use the following command:

>> yay -S quartus-free-130
