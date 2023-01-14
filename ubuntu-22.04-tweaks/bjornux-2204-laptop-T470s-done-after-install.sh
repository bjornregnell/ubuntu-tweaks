sudo apt update && sudo apt full-upgrade

sudo apt install gnome-tweaks

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install curl
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# gti
sudo apt install git
git config --global user.email "bjorn.regnell@cs.lth.se"
git config --global user.name "bjornregnell"

# install xclip to paste to buffer from terminal
sudo apt-get install xclip

# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
# Add new ssh-key to github

ssh-keygen -t rsa -b 4096 -C "bjorn.regnell@cs.lth.se"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

mkdir -p git/hub/bjornregnell && cd git/hub/bjornregnell

git clone git@github.com:bjornregnell/ubuntu-tweaks.git


# java fallback
sudo apt install openjdk-11-jdk  openjdk-11-source openjdk-11-doc

# sdkman
curl -s "https://get.sdkman.io" | bash


# use skdman for setting and switching java versions
source "$HOME/.sdkman/bin/sdkman-init.sh"
source ~/.profile
sdk version
sdk install java 17.0.5-tem

# cs for scala sbt scala-cli
curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup

#latex
sudo apt install hunspell hunspell-sv
sudo apt install texlive-full

# Email client Evolution that works with EWS
# DON'T use apt to install Evolution, use flathub to get latest

flatpak install flathub org.gnome.Evolution

# To bootstrap using another machine with Evolution:
#    File -> Back up Evolution Data
# save file somewhere and transfer to this machine and:
#    File -> Restore Evolution Data

# eduroam
# Download latest installer for linux from here:
# https://cat.eduroam.org/
# cd ~/Downloads
# chmod +x the_file`
# you MUST be on the lth threaded network for the installation to work
# python3 the_file
# use @lu.se after your lucat id 

# vs code by microsoft 
# install vs code from official site - download deb
# https://code.visualstudio.com/
cd ~/Downloads && sudo apt install ./thedeb

# deb-get
# install deb-get from https://github.com/wimpysworld/deb-get
# things to best install with with deb-get:
sudo deb-get install discord
sudo deb-get install zoom
sudo deb-get install pandoc

# things best done with snap
sudo snap install tree

# manual install chrome from deb 
# https://www.google.com/chrome/
cd ~/Downloads && sudo apt install ./thedeb

######### TODO
sudo deb-get install spotify  # or is snap best?
