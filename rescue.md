# How to check and repair

## Check disk partition

I got problems when booting Ubuntu 24.04 with the new kernel 6.17; the disk booted in read only and got damaged. There might be other reasons for a damaged disk...

* Boot in recovery mode and check which partition that is bad; probably /dev/sdb
* Attempt to run fsck in recovery mode
* Make a bootable USB with ubuntu 24.04
* Boot from the USB stick
* Run the GParted and attempt repair from GUI
* Open terminal and run below stuff

```
sudo umount /dev/sdb  # unmount the partition

sudo fsck /dev/sdb   # check and repair

sudo apt install testdisk  # more potent repair tool

sudo testdisk /dev/sdb  # terminal ui, press enter on request
```

## Revert if new kernel not working

* Boot in Advanced options and choose older kernel

* Remove new kernel with apt purge
```
dpkg -l | grep linux-image    # check version of kernel to remove
sudo apt purge linux-image-version
sudo apt purge linux-headers-version
```




