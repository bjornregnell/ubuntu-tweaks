# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
sudo ubuntu-drivers autoinstall
ubuntu-drivers devices # check what is recommended
sudo apt install nvidia-driver-525 # the latest recommended

# https://askubuntu.com/questions/1403741/ubuntu-22-04-cant-suspend
systemctl disable nvidia-hibernate.service nvidia-resume.service nvidia-suspend.service

# Installed latest nvidia MANUALY to fix resume on idle black screen
# NVidia driver version 525.85.05
# from https://www.nvidia.com/en-us/drivers/unix/
# file downloaded in Downloads/NVIDIA-Linux-x86_64-525.85.05.run
# did the follwoing based on https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
sudo apt install build-essential libglvnd-dev pkg-config
sudo telinit 3  # this will exit the window suýstem and enter raw terminal (if not press Ctrl+Alt+F1)
# when in raw terminal: login and do
cd Downloads
sudo bash NVIDIA-thenameofthefile.run
# answer yes on everything by pressong Enter
# then reboot from raw terminal
sudo rebbot
# then check what NVIDIA driver version you now have
# https://linuxconfig.org/how-to-check-nvidia-driver-version-on-your-linux-system
nvidia-smi 

