# Yoga 7 gen 7 linux configuration and trouble shooting

Hello everyone, I bought this laptop to use it during my university studies: it has nice specs, long battery life and I can take notes with the stylus. As soon as I got it, I started thinkering with linux, installing Arch since it's usually my go-to distro.

## My specs

---------------------------------

AMD ryzen 7 6800u
16 Gbs ddr5 ram
512 nvme ssd
14" 90 Hz amoled screen

## Installation process
The installation process was a breeze using the latest archiso image (2022.11.01 release). The only thing you need to account for is that the wifi card is locked by default. Unlock it with "rfkill unblock wifi"

My installation included:
- ext4 fs for the root partition;
- Grub bootloader;
- xf86-video-amdgpu and mesa as graphic drivers;
- KDE plasma.

## What works:
- touchscreen, pen, trackpad;
- almost every shortcut button (including volume and brightness keys) and keyboard backlight;
- resolution and refresh rate are automatically recognized by KDE;
- ports (not fully tested) and connectivity (wifi, bt etc);
- great battery life even without manual optimizations (greatly improvable thanks to TLP).

## Issues and fixes:
##### 1. Folding the screen will actually disable the keyboard, but folding it back will not reactivate it
By installing iio-sensor-proxy and kded-rotation-git [AUR] you will get both automatic screen rotation and keyboard deactivation while in tablet mode without further configuration (took from https://wiki.archlinux.org/title/Tablet_PC).

##### 2. Some bluetooth might not connect due to an unsupported protocol
Install pulseaudio-bluetooth and then reboot.

##### 3. Sleeping the pc by closing the lid will make KDE crash: if you reopen it you will get a black screen with just the mouse cursor
I tested this also with gnome and I had even more problems. For a temporary fix, I decided to turn off the screen without putting the computer to sleep. You will miss out on battery duration, but it works well enough until I find a fix.

##### 4. Occasionally the touchscreen and pen input will stop working altogether.
This is quite a weird issue and it takes a complete reboot afaik to fix it. Logs from journal return this:

```
wacom xxxx:xxxx:xxxx.xxxx: wacom_idleprox_timeout: tool appears to be hung in-prox. forcing it out.
```

A temporary fix I found is a scripts that restart the wacom module (USE AT YOUR OWN RISK, ALWAYS CHECK CODE THAT IS BEING EXECUTED ON YOUR MACHINE). I then created an alias in .bash.rc to have it as a quick command I can run on the go:

```
alias rewacom = 'bash ~/.scripts_wacom_restart.sh'
```

##### 5. Sometimes (I haven't been able to recreate the conditions) when switching to another tty you will either a blank page or an error about a corruption in the filesystem
Still need to look into that.

##### 6. Only front speakers are recognised by the system
Since speakers are not my priority, This is the last issue I'll try fixing, just keep in mind they are pretty bad to listen to as they are out of the box.

## Other tweaks
##### 1. Better battery with TLP and other utilities
I included in the repo my TLP config file. Thanks to some tweaks (disabling clock boost with battery, changing governor) I got a battery life very similar (if not superior) to the one I was getting on windows 11, with some added benefits such as a quieter fans and colder temperatures. Moreover, I decided to set the refresh rate to 60 Hz instead of 90, this should improve battery life even more.

## General utilities for the laptop:
##### 1. Xournalpp
As a note app, I'm currently using xournallpp. Although the workflow is radically different from OneNote, I'm loving it for the extreme customization it can offer. If you are using this notebook to take notes with a stylus, I'd suggest changing a few settings to get an even better experience:
- View > Toolbar > Right Hand Note Taking: will apply a much more friendly layout to take notes;
- Preferences > touchscreen > enable "hand recognition": will prevent a lot of misthouches done with your hands;
- Preferences > view > scrollbars > hide vertical scrollbar: the most usefull of them all, will prevent touching the scrollbar with your and and getting teleported to the last page of your notes.

##### 2. Corekeyboard [AUR]
A decent enough on-screen keyboard, I wish we could edit the height, but it gets the job done.

This is it for my little experiment, I hope this helped you.
