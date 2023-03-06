sudo apt update && sudo apt full-upgrade
sudo apt install curl

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

#git
sudo apt install git
git config --global user.email "bjorn.regnell@cs.lth.se"
git config --global user.name "bjornregnell"

# install xclip to paste to buffer from terminal
sudo apt-get install xclip

