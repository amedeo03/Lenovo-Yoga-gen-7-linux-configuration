# Yoga 7 gen 7 linux configuration and trouble shooting

Hello everyone, I bought this laptop to use it during my university studies: it has nice specs, long battery life and I can take notes with the stylus. As soon as I got it, I started thinkering with linux, installing Arch since it's usually my go-to distro.

My specs
---------------------------------
amd ryzen 7 6800u
16 Gbs ddr5 ram
512 nvme ssd
14" 90 Hz amoled screen

# Installation process
The installation process was a breeze using the latest archiso image (2022.11.01 release). The only thing you need to account for is that the wifi card is locked by default. Unlock it with "rfkill unblock wifi"

My installation included:
- ext4 fs for the root partition;
- Grub bootloader;
- xf86-video-amdgpu and mesa as graphic drivers;
- KDE plasma.

what works:
- touchscreen, pen, trackpad;
- almost every shortcut button (including volume and brightness keys) and keyboard backlight;
- resolution and refresh rate are automatically recognized by KDE;
- ports (not fully tested) and connectivity (wifi, bt etc);
- great battery life even without manual optimizations (greatly improvable thanks to TLP).

what does not work (out of the box):
1) folding the screen will actually disable the keyboard, but folding it back will not reactivate it;
2) some bluetooth might not connect due to an unsupported protocol
3) sleeping the pc by closing the lid will make KDE crash: if you reopen it you will get a black screen with just the mouse cursor;
4) occasionally the touchscreen and pen input will stop working altogether. I don't know how to recreate the issue, still need to look into the logs.
5) sometimes (I haven't been able to recreate the conditions) when switching to another tty you will either a blank page or an error about a corruption in the filesystem

Solutions I found:
- regarding the screen folding, by installing iio-sensor-proxy and kded-rotation-git you will get both automatic screen rotation and keyboard deactivation while in tablet mode without further configuration (took from https://wiki.archlinux.org/title/Tablet_PC);
- you can fix the unsupported protocol by installing pulseaudio-bluetooth and then rebooting
- for the sleep problem, for now I just set the screen to turn of instead of going to sleep directly from the plasma settings gui;
- in order to get even better battery life I decided to install and manually configure TLP (https://linrunner.de/tlp/index.html). I will post my configuration with the parameters I changed from the default one (stuff like disabling cpu boost in battery mode etc).

Alternatives I found for windows programs/general utilities:
- As a note app, I'm currently using xournall++ (xournalpp in the official arch repo). Although the workflow is radically different from OneNote, I'm still thinkering on it, it has good functionality and it is highly customizable;
- For pdf reader I use both okular and xournal++ since it can open and sketch on them;
- corekeyboard (from AUR) as my on-screen keyboard. While it might not be as convenient as the windows' one, it still does a decent job.
- dropbox as a cloud client (my uni offers a premium plan to students for free);

# to-dos:
- sleep issue
- tty switch issues

And here the document will end. I hope this helped you, see you!
