# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
sudo ubuntu-drivers autoinstall
ubuntu-drivers devices # check what is recommended
sudo apt install nvidia-driver-525 # the latest recommended

# https://askubuntu.com/questions/1403741/ubuntu-22-04-cant-suspend
systemctl disable nvidia-hibernate.service nvidia-resume.service nvidia-suspend.service


