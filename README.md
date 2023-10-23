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

## Ubuntu-based Systems

These instructions were tested for Ubuntu 22.04 LTS, but they may or may not work in previous or next versions or in other Debian-based distributions.
First, start the download [Quartus II 13.01.sp](https://www.intel.com/content/www/us/en/software-kit/711790/intel-quartus-ii-web-edition-design-software-version-13-0sp1-for-linux.html). Then, install the additional dependencies:

```sudo apt install -y libstdc++6:i386 libc6:i386 libx11-dev:i386 libxext-dev:i386 libxau-dev:i386 libxdmcp-dev:i386 fontconfig:i386 expat:i386 libxrender1:i386 libsm6:i386```

We will also need an additional dependency that is not present in the repositories:

```wget https://launchpadlibrarian.net/562068737/libpng12-0_1.2.54-1ubuntu1.1+1~ppa0~impish0_amd64.deb```

Make sure to be in the directory where you want to install the library before running this command.

```dpkg -x libpng12-0_1.2.54-1ubuntu1.1+1~ppa0~impish0_amd64.deb libpng12```

You can delete the ```.deb``` package after that.
Now we need to put this library in the PATH environment variable. Put the following in the ```.profile``` or ```.bashrc``` file in your home directory.

```export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:{The path where you executed the dpkg command}/libpng12/usr/lib/x86_64-linux-gnu```

Once this is done, we need to configure the USB-Blaster drivers to use the FPGA. Open or create the file ```/etc/udev/rules.d/altera-usb-blaster.rules``` and put the following there:

```
# Intel FPGA Download CableSUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
# Intel FPGA Download Cable IISUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```

Once the download is finished, extract the files and run ```setup.sh``` to install

If the ```.desktop``` file does not work you can open Quartus with the following command:

```{Your Home folder}/altera/13.0sp1/quartus/bin/quartus --64bit```

For troubleshooting or other questions, check [these](https://wiki.sj.ifsc.edu.br/index.php/Configura%C3%A7%C3%A3o_da_USB_para_programa%C3%A7%C3%A3o_do_FPGA_via_JTAG) [sources](https://www.rocketboards.org/foswiki/Documentation/UsingUSBBlasterUnderLinux)

## Windows

First, simply download and install [Quartus II 13.01 sp](https://www.intel.com/content/www/us/en/software-kit/711791/intel-quartus-ii-web-edition-design-software-version-13-0sp1-for-windows.html?).
After that, to communicate with the FPGA using a USB port, you need to install the [USB Blaster driver](https://www.intel.com.br/content/www/br/pt/support/programmable/support-resources/download/dri-usb-blaster-vista.html).

* Note: In newer versions of Windows, you will have to disable the Windows Defender core isolation feature, because this 
driver is no longer supported.

## Arch-based Systems

To install on an Arch-based distro, simply download the AUR package called [quartus-free-130](https://aur.archlinux.org/packages/quartus-free-130).
To install it using [yay](https://github.com/Jguer/yay), you just use the following command:

>> yay -S quartus-free-130
