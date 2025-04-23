---
title: OS Installation
layout: default
nav_order: 3
---
# OS Installation

**Audience: IDLE Press Arcade Operators**
{: .label .label-yellow }

## Overview
Installing Ubuntu 24.04 LTS on your arcade PC is required in order to utilize [Kiosk mode](kiosk-setup.html) which is designed to run Linux games or applications in a controlled and automated environment. Follow these steps to complete the installation process.

### Creating an ISO

1. Download [Ubuntu 24.04.x LTS](https://ubuntu.com/download/desktop)
2. Download [belenaEtcher](https://etcher.balena.io/) and install. Or use your preferred app for flashing OS images to USB drives.
3. Flash the Ubuntu OS to a USB drive.

### Install

My test dev hardware was an [AMD SER5 Pro mini PC](https://xdaforums.com/t/beelink-ser5-pro-review-a-beast-of-a-mini-pc.4483881/) provided by IDLE Press. Some steps below might be slightly different depending on your hardware.

1. Insert a USB drive into the PC and turn it on
2. Press F7 to open the boot menu
3. Select the USB drive from the "please select boot device" menu (UEFI)
4. Select "Try or Install Ubuntu", press enter, wait a minute or two

**At the "Welcome to Ubuntu" screen**

Follow setup process steps which include connecting to a network (wired connection or connect to Wifi), updating the installer, and creating a user account.

If an update is available for the installer, you may choose to update it or not. If you do choose to update the installer, when it's complete it'll take you back to the desktop - _Your installation is NOT complete_ at this point. Double-click Install Ubuntu 24.04.2 LTS desktop icon which will start the installer again, then chose "interactive installation".

Install recommended proprietary software, check these:
- Install third-party software for graphics and Wifi-hardware
- Download and install support for additional media formats

At disk setup select: **Erase disk and install Ubuntu**

**Create User Account**

{: .warning }
Kiosk login requires your username to be `user`

* Your name: `user`
* Password: `YourPassword`

Uncheck "Require my password to log in". Unchecking this doesn't really matter since the Kiosk session will bypass the password anyway. But unchecking it now will speed things up for you in case you need to reboot a bunch during setup.

##### Reboot
Review and click Install and then restart when the install is finished. If you didn't remove the thumb drive, remove it when prompted and press enter.

When Ubuntu boots for the first time, skip the offer to enable Ubuntu Pro. Ubuntu should now be installed and you should be at the desktop.