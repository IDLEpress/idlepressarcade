---
title: Kiosk Setup
layout: default
nav_order: 4
---

# Kiosk Setup

**Audience: IDLE Press Arcade Operators**
{: .label .label-yellow }

## Overview

[The IDLE Press Arcade Kiosk](https://github.com/rocket5/idle-press-arcade-kiosk) package provides a complete kiosk mode setup for running games or applications in a controlled, automated environment on Ubuntu 24.04 LTS. The scripts create a [GNOME Kiosk](https://help.gnome.org/admin/system-admin-guide/stable/lockdown-single-app-mode.html.en) session which 'provides a desktop environment suitable for fixed purpose, or single application deployments like wall displays and point-of-sale systems' and also happens to work great for creating an authentic retro-arcade experience. The system includes both kiosk mode for running your game and operator mode for maintenance.

This project is based on the [arcade-build](https://github.com/lazzarello/arcade-builds) project which relies on Canonical Snapcraft as a solution for easily distributing updates to cabinet host PC. The downside to that approach is  that it requires the game developer to package their games and post them to the Snap Store where they can be downloaded by Linux users for free. 

Our implementation removes the Snap Store dependency from the setup process but requires the operator to manually install the game prior to running the `autobuild.sh` script. Additionally if the developer updates the game, the arcade operator will need to manually update the game on the cabinet PC.

## Prerequisites

- Ubuntu 24.04 LTS
- A user account named "user" (the script is configured for this username)
- Your application/game executable built for Linux
- Root/sudo access for initial setup

## Package Contents

- `autobuild.sh` - Main setup script that configures kiosk mode and operator mode
- `cleanup.sh` - Script to remove previous kiosk installation and restore default settings
- `user-settings.sh` - Visual settings for operator mode desktop environment
- `kiosk-configuration/` - Configuration files for kiosk and operator modes
  - `autologin@.service` - Service for automatic login to operator mode on TTY3
  - `ensure-kiosk-mode.service` - Fail-safe service to ensure system returns to kiosk mode
  - `operator-mode` - Script to toggle between kiosk and operator modes
  - `exit-operator-mode.desktop` - Desktop shortcut for exiting operator mode
  - `custom.conf` - GDM configuration template

## Installation Steps

### Prepare Your Application

{: .note }
At this time, the kiosk mode setup script only works with Linux builds. 

Copy your built project folder into the `/home/user` folder so that your path ends up being something like `/home/user/your-game-folder`. To access the user folder on the Ubuntu desktop, double-click the folder icon in the dock.

Right-click on `your-game-folder` and then select "Open in Terminal" from the drop-down menu. 

   ```bash
   # Set proper permissions
   chmod +x /home/user/your-game-folder/your-game-name.x86_64
   sudo chown -R user:user /home/user/your-game-folder
   ```

That should be all you need to do in `your-game-folder` for now, so close the terminal.

### Set Up Kiosk Mode

Download the latest [Kiosk Mode Release](https://github.com/rocket5/idle-press-arcade-kiosk/releases)  and extract the .zip on the Ubuntu desktop. Right click the extracted folder (eg. `idle-press-arcade-kiosk-1.0`), select "Open in Terminal" from the menu.

   ```bash
   # Make the setup script executable
   chmod +x autobuild.sh
   
   # Run the setup script with your game's FULL PATH
   sudo ./autobuild.sh /home/user/your-game-folder/your-game-name.x86_64
   ```

### Reboot the System

   ```bash
   sudo reboot
   ```

The system should boot directly to your game any time you turn on the PC.

## Features

### Kiosk Mode
- Automatically boots into your game in fullscreen
- Disables system updates and notifications
- Mouse cursor moved to corner to prevent interference
- Auto-restart if the application crashes
- Hidden boot menu for quick startup
- Landscape client for remote monitoring (see below)

### Operator Mode
- Exits game back to the Ubuntu desktop for maintenance and updates
- Desktop shortcut to exit operator mode
- Full system access with sudo privileges (no password required)
- Automatic return to kiosk mode after reboot

### Landscape
A feature that might be useful for arcade opperators is [Landscape](https://ubuntu.com/landscape) - Canonical's systems management tool designed for Ubuntu, which allows remote monitoring and management of Ubuntu systems. The script installs the Landscape client via Snap. Landscape allows remote monitoring of kiosk health without physical access, centralized management of multiple kiosks, alerts for system issues, ability to push updates remotely. However you would need to setup a Landscape account and the feature requires an Ubuntu Pro subscription. Full Landscape setup is beyond the scope of this document.

## Usage

### Normal Operation
- System boots directly into the game, full-screen
- If application crashes, it will automatically restart

### Entering Operator Mode
1. Press Ctrl + Alt + F3 followed by the Enter key
2. The System will switch to a black screen with a text console.
3. Type `operator-mode on` into the console
4. The system will boot into the Ubuntu desktop where you can perform any necessary maintenance like updating the game.

### Exiting Operator Mode
- Double-click the "Exit Operator Mode" shortcut on the desktop
- System will reboot and return to kiosk mode
- Alternatively, press Ctrl + Alt + T and then run `operator-mode off` in the terminal

## Maintenance

### Updating Your Application
1. Enter operator mode: Press ctrl + alt + F3 followed by the Enter key
2. Replace the game executable and related files in `/home/user/your-game-folder/`
3. Ensure proper permissions:

   ```bash
   chmod +x /home/user/your-game-folder/your-game-name.x86_64
   sudo chown user:user /home/user/your-game-folder/your-game-name.x86_64
   ```

4. Exit operator mode to return to kiosk mode

### System Updates

System updates are disabled by default by the `autobuild.sh` script. To perform system updates:
  1. Enter operator mode
  2. Run system updates manually:

     ```bash
     sudo apt update
     sudo apt upgrade
     ```
     
3. Exit operator mode to return to kiosk mode

## Troubleshooting

### Application Not Starting
1. Enter operator mode Ctrl + Alt + F3 followed by the Enter key
2. Check application permissions:
   ```bash
   ls -l /home/user/your-game-folder/your-game-name.x86_64
   ```
3. Verify the application runs manually:
   ```bash
   /home/user/your-game-folder/your-game-name.x86_64
   ```
4. Check system logs:
   ```bash
   journalctl -xe
   ```
5. Check kiosk script:
   ```bash
   cat ~/.local/bin/gnome-kiosk-script
   ```

### Operator Mode Not Working
1. Verify the operator mode service:
   ```bash
   systemctl status autologin@tty3.service
   ```
2. Check operator mode script permissions:
   ```bash
   ls -l /home/user/bin/operator-mode
   ```
3. Verify desktop shortcut:
   ```bash
   ls -l /home/user/Desktop/exit-operator-mode.desktop
   ```
4. Check session configuration:
   ```bash
   cat /var/lib/AccountsService/users/user
   ```

### Clean Installation

Running the `cleanup.sh` script will remove the changes made by `autobuild.sh` and return the PC to normal operation.

Right click the `kiosk-setup` folder (should still be on the desktop from the setup process), select "Open in Terminal" from the menu.

   ```bash
   # Make the cleanup script executable
   chmod +x cleanup.sh
   
   # Run the cleanup script
   sudo ./cleanup.sh
   
   # Reboot the system
   sudo reboot
   ```

The system should reboot back into Ubuntu normally and will require the username and password to login. You can redo the installation steps any time you want to return the PC to kiosk mode operation.

## Security Notes

- The system is configured for a single-purpose kiosk
- Operator mode provides full system access with passwordless sudo
- Consider physical security measures for the operator mode access
- The kiosk-mode setup disables system notifications and updates

## Support

For issues or questions:
1. Check the troubleshooting section
2. Review system logs:
   ```bash
   journalctl -xe
   ```
3. Verify all file permissions and ownership
4. Ensure the user account is named "user"
