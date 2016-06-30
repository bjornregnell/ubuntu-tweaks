# download ubuntu 16.04:
cd Downloads
mkdir ubuntu-16.04
cd ubuntu-16.04
wget http://releases.ubuntu.com/16.04/ubuntu-16.04-desktop-amd64.iso
wget http://releases.ubuntu.com/16.04/SHA256SUMS
cat SHA256SUMS| grep desktop-amd64 | sha256sum -c -
# above should print: ubuntu-16.04-desktop-amd64.iso: OK

# install in vbox:
#  open Oracle VM VirtualBox Manager
#  -> New
#     Memory 4096 MB
#     Create virtual hard disk now
#     Hard disk file type: VDI
#     Storage on disk: Dynamically allocated
#     File location and size: 64GB
#  open the machine
#   Select start-up-disk: select the dowloaded iso 
#  Welcome English: Install Ubuntu
#   Tick: download updates while instaklling
#   Tick: Install third-party software
#  Erase disk and install ubuntu: click Install Now
#  Where are you? Stockholm
#  Keyboard: Swedish
#  Who ara you?  student; vbox; student; pgk-bytmig2016
#     log in automatically
#






