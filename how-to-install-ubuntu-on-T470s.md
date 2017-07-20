# How to install Ubuntu 16.04.02 LTS on a Lenovo T470s

* Start Windows 10 and configure.

* Connect to network, update windows

* Run the app "Lenovo Settings" and allow it to "Update ThinPad BIOS" if it requests so

* Enter BIOS and do these settings:
- Security -> Secure boot -> disable
- Startup -> UEFI/Lecacy Boot -> Booth, UEFI first???
Other good settings:
- Config-Keyboard/Mouse-> Fn and Ctrl Key Swap -> Enable
- Security->Virtualization-> Enable both VT and VT-d

* Disable BitLocker
In powershell witha admin rights run this command and the restart
Suspend-BitLocker -MountPoint "C:" -RebootCount 15

# Shrink the Windows Partition:
https://www.download3k.com/articles/How-to-shrink-a-disk-volume-beyond-the-point-where-any-unmovable-files-are-located-00432

Summary of above instructions: 

* Disable hibernation
  - Win+X in admin powershell:  powercfg /h off 

* Disable page file
  - press Win+R (or Win+S), enter 
  - SystemPropertiesPerformance.exe, press Enter. Click the Advanced tab.
  - Click Change under Virtual Memory and uncheck "Automatically manage paging file size for all drives."
  - Click on the partition you are trying to resize and set paging file size to No paging file. Click Set, then Ok.

 * Disable system protection
  - Step 1: Open a command prompt by pressing Win+R and type SystemPropertiesProtection.exe, press Enter.
  - Step 2: Click on the partition you need to resize, if it has Protection set to On. Click Configure.
  - Step 3: Select Disable system protection and click Apply.
  - Step 4: You'll be prompted with a warning informing you that current restore points will be deleted and future restore points won't be created. Click Yes.
  
 * Reboot

 * Win+X type Disk Manager and rightclick on windows partition and select shrink...

* Reboot and press Enter and the F12 and select Your Ubuntu live USB stick (assumed you have one otherwise create one using an iso and pengiun pendrive)

* Install Ubuntu alongside Windows

# Re-enable:

## Re-enable Hibernation

Step 1: Open an elevated command prompt by pressing Win+X and choose Command Prompt (Admin). Click Yes if UAC pops up.

Step 2: Type powercfg /h on, press Enter. You won't get a success confirmation but you'll notice that hiberfil.sys is back on your OS partition.

Step 3: Press Win+R (or Win+S), enter SystemPropertiesPerformance.exe, press Enter. Click the Advanced tab.

Step 4: Click Change under Virtual Memory and check Automatically manage paging file size for all drives.

Step 5: Open a command prompt by pressing Win+R and type SystemPropertiesProtection.exe, press Enter.

Step 6: Click on the partition you just resized, the OS partition. Click Configure.

Step 7: Select Turn on system protection and click Apply, then OK.

Step 8: Restart.

## Change font in grub to be readable on the high dpi screen

Read this:
http://blog.wxm.be/2014/08/29/increase-font-in-grub-for-high-dpi.html

In terminal:

sudo grub-mkfont --output=/boot/grub/fonts/DejaVuSansMono24.pf2 --size=48 /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf

sudo apt-get install gksu

gksudo gedit /etc/default/grub &

Add this att end of above file:

# More readable font on high dpi screen, generated with
# sudo grub-mkfont --output=/boot/grub/fonts/DejaVuSansMono24.pf2 --size=48 /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf
GRUB_FONT=/boot/grub/fonts/DejaVuSansMono24.pf2

