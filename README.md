# Yoga 7 gen 7 linux configuration for university
Assorted tips and tricks to get a decent Arch installation on your Lenovo Yoga 7 Gen 7 and do your homework with it

# This little wiki is discontinued at least for now, since I couldn't find a decent alternative to onenote on linux.
Both evernote and onenote AUR packages aren't natives and the input lag is too much for my tastes. Joplin currently doesn't support pen input.
If you have an alternative you would suggest, I will be very happy to try it out

# original readme
---------------------------------
List of my specs:
amd ryzen 7 6800u (with amd radeon 680m)
16 GBs ddr5 ram
512 nvme ssd
14" 90 Hz amoled screen

Hello everyone, I bought this laptop to use it during my university studies: it has nice specs, long battery life and I can take notes with the stylus. As soon as I got it, I started thinkering with linux, installing Arch since it's usually my go-to distro.

# Installation process
The installation process was a breeze. The only thing you need to account for is that using wifi is somewhat messy:
- wifi card by default is locked. Unblock it with "rfkill unblock wifi";
- looks like you have to manually configure DHCP.

My installation included:
- ext4 fs for the root partition;
- Grub bootloader;
- xf86-video-amdgpu and mesa as graphic drivers;
- KDE plasma.


what works:
- touchscreen, pen, trackpad;
- almost every shortcut button (including volume and brightness keys) and keyboard backlight;
- resolution and refresh rate are automatically recognized by KDE;
- ports and connectivity (wifi, bt etc).

what does not work:
- even by setting the screen scale to 200%, icons in menus are tiny af;
- blur on window decorations will flicker a lot. I suggest disabling blur altogether;
- folding the screen will actually disable the keyboard, but folding it back will not reactivate it;
- sleeping the pc by closing the lid will make KDE crash: if you reopen it you will get a black screen with just the mouse cursor;
- for some reason when manually putting the pc to sleep, you won't be able to log back in since it won't recognize your password (strange huh);
- sometimes (I haven't been able to recreate the conditions again) when switching to another tty you will get an error about something corrupt in the fs;

Apps/functionality I'm looking for:
- a decent on-screen keyboard;
- a onenote-like program;
