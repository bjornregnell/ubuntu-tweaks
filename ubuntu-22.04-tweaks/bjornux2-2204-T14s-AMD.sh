sudo apt update && sudo apt full-upgrade
sudo apt install curl

#git
sudo apt install git
git config --global user.email "bjorn.regnell@cs.lth.se"
git config --global user.name "bjornregnell"
git config --global pull.rebase false

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

# flatpak
sudo apt install flatpak gnome-software-plugin-flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# java fallback
sudo apt install openjdk-17-jdk  openjdk-17-source openjdk-17-doc

# sdkman
curl -s "https://get.sdkman.io" | bash

# use skdman for setting and switching java versions
source "$HOME/.sdkman/bin/sdkman-init.sh"
source ~/.profile
sdk version
sdk install java 17.0.6-tem

# scala
sdk install scala
sdk install scalacli
sdk install sbt

#add to .bashrc
alias sbtn=sbtn-x86_64-pc-linux

sudo apt install gnome-tweaks
# gnome Settings todo: 
#   Appearance -> Dark Theme
# gnome Tweaks todo:
#  Top bar -> all ON
#  Window title bars -> left
#  Keyboard & Mouse -> middle click paste -> OFF
#  Windod -> Attach Modal Dialogs -> OFF 

# https://www.omgubuntu.co.uk/2021/07/enable-minimize-click-ubuntu-dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'


flatpak config languages --set "en;sv"
sudo flatpak update

# vs code by microsoft 
# install vs code from official site - download deb
# https://code.visualstudio.com/
cd ~/Downloads && sudo apt install ./thedeb
# Turn on settings sync by signing in (with github not microsoft) 
#   except UI state sync
# IGNORE so called MonkeyPatch
#   https://github.com/iocave/monkey-patch/issues/55

## install microsoft fonts
## https://www.linuxcapable.com/install-microsoft-fonts-on-ubuntu-22-04-lts/
## press TAB when prompted to get to Ok and Yes
sudo apt install ttf-mscorefonts-installer -y

# Email client Evolution that works with EWS
# DON'T use apt to install Evolution, use flathub to get latest

flatpak install flathub org.gnome.Evolution
flatpak config --set languages 'en;sv'

# To bootstrap using another machine with Evolution:
#    File -> Back up Evolution Data
# save file somewhere and transfer to this machine and:
#    File -> Restore Evolution Data

# codecs etc
sudo apt-get install ubuntu-restricted-extras
sudo apt install ffmpeg

#latex
sudo apt install hunspell hunspell-sv
sudo apt install texlive-full

# deb-get
# install deb-get from https://github.com/wimpysworld/deb-get
# things to best install with with deb-get:
sudo deb-get update
sudo deb-get install discord
sudo deb-get install zoom
sudo deb-get install teams-for-linux
sudo deb-get install pandoc
sudo deb-get install libreoffice
sudo deb-get install spotify-client

# show dir hierarchically
sudo snap install tree 

# play mp3 mp4 etc
sudo snap install vlc
sudo apt install mpg123

# extract pdf pages
sudo snap install pdftk
# example: extract page 6 to 8
#  pdftk in.pdf cat 6-8 output out.pdf 

# convert jpg to pdf
sudo apt install imagemagick
# edit this file to change line with PDF to be commented out using <!-- -->
# sudo nano /etc/ImageMagick-6/policy.xml
# see more info https://askubuntu.com/questions/1200965/convert-jpg-to-pdf
# now you can do this in terminal: 
# convert input.jpg output.pdf

# syncthing
sudo deb-get install syncthing
# make syncthing start on system startup by copying this file to your config:
# https://docs.syncthing.net/users/autostart.html#linux
cp /usr/share/applications/syncthing-start.desktop ~/.config/autostart/.

# Start Syncthing Web GUI http://127.0.0.1:8384
# Configure syncthing GUI password in settings
# Transfer all device id:s via email and add one other introducer device in web gui of syncthing
####----- TODO below
# select "+Add Remote Device" and add other device set as Introducer and Auto-accept
# As you set the first remote device added to Introducer and Auto-accept you will get all other devices from the introducer
# On other introducer device: accept this device
# On other introducer decice: in settings select folders to share 
# On each new added device you need to accept on that device (if not auto-accept)
