# What is grub?

Grub is a system utility to manage dual boot that shows it self when you startup your computer. Grub allows you to select one of many installed systems, e.g. choose to start either Windows or Ubuntu.

# How to make grub start screen readable on high resolution screens

If you have a very high resolution screen then the grub text becomes so small that it is not readable. Fix this by editing this file in using `sudo`, e.g.:
```
sudo nano /etc/default/grub
```

There shoud be a line commented by a `#` including `#GRUB_GFXMODE=640x480`

Decomment it and att `,auto` so it looks like this:
```
GRUB_GFXMODE=640x480,auto
```

Don't forget to force the change to take effect by:
```
sudo update-grub
```

You can instead (or in addition) customize the rather uggly font if you want (but that involves some more terminal commands), see e.g. here: 
* https://vietlq.github.io/2019/09/22/make-grub-font-size-bigger/

```
# Generate a GRUB-compatible font with specified size 
# from a TTF (type-type font)
sudo grub-mkfont --output=/boot/grub/fonts/DejaVuSansMono36.pf2 \
    --size=36 /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf

# Edit high-level GRUB configuration file
# Add/modify the variable `GRUB_FONT`
# GRUB_FONT=/boot/grub/fonts/DejaVuSansMono36.pf2
sudo vim /etc/default/grub

# Regenerate low-level GRUB configurations
sudo update-grub

# Now you should restart
```


# How to make grub remember your last boot choice

Open this file in an editor using `sudo`, e.g.:
```
sudo nano /etc/default/grub
```

Make sure this line is commented out by starting with a `#`
```
#GRUB_DEFAULT=0
```
After that line add the following two lines, so that it looks like this:
```
#GRUB_DEFAULT=0
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
```

Don't forget to force the change to take effect by:
```
sudo update-grub
```


# How to repair missing grub on your windows partition

I once had the problem that grub did not kick in and I could not get Windows to boot. This was solved by re-installing grub on the startup partiton, change `XXX` to where your disk device is located:

```
sudo grub-install /dev/XXX  # Example: sudo grub-install /dev/sda
sudo update-grub
```

You can check which partions you have with the `df /boot` command:
```
$ df /boot
Filesystem     1K-blocks      Used Available Use% Mounted on
/dev/sdb3      429608056 281967008 125744704  70% /
```
Remove the last number (above the number `3`) when you do grub install, e.g.:
```
sudo grub-install /dev/sdb
```

See also here under the section "Reinstalling GRUB 2 from a Working System": 
https://help.ubuntu.com/community/Grub2/Installing

