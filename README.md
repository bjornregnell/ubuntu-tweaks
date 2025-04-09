# Ubuntu tweaks and install tricks

## Preparations before install/upgrade

* Backup files, esp. backup Evolution from inside the app to ease email client settings
* Take note of special settings/credentials, e.g. Mobile Broadband, Wifi
* If you use [Syncthing](https://syncthing.net/) and do a fresh Ubuntu install (not upgrade) it is safer to set up a new ID and symbolic name such as Machine2 from scratch so an empty file system don't get propagated accidentally as "delete all files"
* Update Windows partition if any, including Lenovo firmware etc
* Make sure you are up to date: `sudo apt update && sudo apt full-upgrade -y && sudo update grub`
* Make a list of important programs installed and their install method, e.g. apt, ppa, snap, flatpak, deb-get, sdk, cs, brew, manual deb
* Download iso and sha: 
* Verify the download
  - https://ubuntu.com/tutorials/how-to-verify-ubuntu#1-overview
```
gpg --keyid-format long --verify SHA256SUMS.gpg SHA256SUMS
# check key in above output and paste directly after 0x below
gpg --keyid-format long --keyserver hkp://keyserver.ubuntu.com --recv-keys 0x
sha256sum -c SHA256SUMS 2>&1 | grep OK
```
* Create iso on USB stick using Ubuntu app "Startup Disk Creator"
  - https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview

* Test Ubuntu by booting from the USB stick
  - https://ubuntu.com/tutorials/try-ubuntu-before-you-install#1-getting-started

## If you want to dual boot ubuntu on windows 11

1. Turn off bitlocker: https://www.solveyourtech.com/how-to-disable-bitlocker-in-windows-11-a-step-by-step-guide/
2. Shrink partition to gain space using then built in Disk Management: https://pureinfotech.com/change-partition-size-windows-11/
3. Install ubunutu alongside windows: https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview 

## During install


## After install

## Preferred install method

### Package managers

| Mgr | Install method |
|--|--|
| deb-get | manual install from https://github.com/wimpysworld/deb-get |
| flatpak | `sudo apt install flatpak gnome-software-plugin-flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo` |
| sdkman | manual install from https://sdkman.io/install |


### Apps

| App | Install method |
|--|--|
| git | `sudo apt install git` |
| java | `sdk install java 17.0.5-tem` |
| syncthing | `sudo deb-get install syncthing` |
| forticlient | manual install see instructions |
| evolution | `flatpak install flathub org.gnome.Evolution` |
