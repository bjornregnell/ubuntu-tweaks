# problem with DEL key not working in 24.04:
# go to Settings -> Keyboard and add a new input source English (US) 
#   then "move up" and then slect Swedish and remove English (US) and DEL starts to work again
#   this wil reload all the settings for your keyboard


mkdir -p bin

sudo apt update && sudo apt full-upgrade
sudo apt install curl

sudo apt install gedit

# codecs etc
## press TAB when prompted to get to Ok and Yes
sudo apt install ubuntu-restricted-extras

sudo apt install ffmpeg

## install microsoft fonts is part pf ubuntu-restricted-extras
# sudo apt install ttf-mscorefonts-installer -y
## https://www.linuxcapable.com/install-microsoft-fonts-on-ubuntu-22-04-lts/
## press TAB when prompted to get to Ok and Yes

sudo apt install gnome-shell-extension-manager

sudo apt install gnome-software gnome-software-plugin-flatpak flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt install gnome-tweaks
# gnome Tweaks todo:
#  Windows ->  Titlebar buttons-> placement -> left
#  Window -> Attach Modal Dialogs -> OFF
#  Mouse and touchpad-> middle click paste -> OFF

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface clock-show-seconds true
# more settings:
# Settings -> Appearance -> Dark
# Settings -> Search -> move settings above files, pwd&keys, characters, calculator, sw
# Settings -> Sound -> Output Volume -> max
# Settings -> Sound -> Output Volume -> Yeti
# Settings -> Ubuntu Desktop -> Enhanced Tiling -> Off
# Settings -> Keyboard -> View and Customize Shortcuts ->
#  Disble: 
#    Navigation -> Move window one monitor down
#    Navigation -> Move window one monitor up
#  Modify:
#    Windows -> Maximize window -> Super+Up
#    Windows -> Restore window -> Super+Down

# if problem with sound on 24.04 revert frome pipewire to pulseaudio:
sudo apt install pulseaudio pulseaudio-module-bluetooth gstreamer1.0-pulseaudio
systemctl --user stop pipewire.socket pipewire-pulse.socket
systemctl --user disable pipewire.socket pipewire-pulse.socket
systemctl --user mask pipewire.socket pipewire-pulse.socket
systemctl --user enable pulseaudio.service pulseaudio.socket
systemctl --user start pulseaudio.service pulseaudio.socket

# to prevent idle on sleep sound:
sudo nano /etc/pulse/default.pa
# comment away this line like so:
#load-module module-suspend-on-idle
# to prevent switching sound devices comment away this line like so:
#load-module module-switch-on-port-available
#  https://askubuntu.com/questions/1061414/how-to-disable-pulseaudio-automatic-device-switch
#  https://askubuntu.com/questions/14077/how-can-i-change-the-default-audio-device-from-command-line
# to reload configuration
pulseaudio -k

#latex
sudo apt install hunspell hunspell-sv
sudo apt install texlive-full

#deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

#syncthing
deb-get install syncthing
# transfer id:s e.g. via email and add device in web gui of syncthing
# make syncthing start on system startup by copying this file to your config:
# https://docs.syncthing.net/users/autostart.html#linux
mkdir -p ~/.config/autostart
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

#evolution
flatpak install flathub org.gnome.Evolution
flatpak config --set languages 'en;sv'
flatpak update
# https://blog.guillaumea.fr/post/configure-additional-dictionaries-evolution-flatpak/
# see further how to set up evolution for EWS here:
#   https://github.com/bjornregnell/ubuntu-tweaks/tree/master/evolution-email-client

#VPN
#  https://github.com/bjornregnell/ubuntu-tweaks/tree/master/vpn
sudo apt install net-tools
sudo apt install network-manager-fortisslvpn network-manager-fortisslvpn-gnome openfortivpn
# follow guide here to add VPN in Settings -> Network using gateway vpn.lu.se
#  https://github.com/bjornregnell/ubuntu-tweaks/tree/master/vpn
# check that it is working:
ifconfig ppp0
# should show something starting with similar to:
##  ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1400

#git
sudo apt install git
git config --global user.email "bjorn.regnell@cs.lth.se"
git config --global user.name "bjornregnell"
git config --global pull.rebase false

# install xclip to paste to buffer from terminal
sudo apt-get install xclip

#password manager in terminal
sudo apt install python3-keyring

# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
# Add new ssh-key to github -- just press ENTER for defaults when asked:
ssh-keygen -t rsa -b 4096 -C "bjorn.regnell@cs.lth.se"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

mkdir -p git/hub/bjornregnell && cd git/hub/bjornregnell

git clone git@github.com:bjornregnell/ubuntu-tweaks.git

# java fallback; use 21 to get latest virtual threads etc
sudo apt install openjdk-21-jdk  openjdk-21-source openjdk-21-doc

# https://docs.scala-lang.org/getting-started/index.html#using-the-scala-installer-recommended-way
curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
source ~/.profile

# sdkman
curl -s "https://get.sdkman.io" | bash

# use skdman for setting and switching java versions
source "$HOME/.sdkman/bin/sdkman-init.sh"
source ~/.profile
sdk version
sdk install java 21.0.6-tem

# in .bashrc
export LUCATID="myid"
alias fad='ssh myid@fileadmin.cs.lth.se'

# vs code by microsoft 
# install vs code from official site - download deb
# https://code.visualstudio.com/
cd ~/Downloads && sudo apt install ./thedeb
# Turn on settings sync by signing in (with github not microsoft) 
#   except UI state sync

# things to best install with with deb-get:
deb-get update
deb-get install discord
deb-get install zoom
deb-get install libreoffice


#install MS Teams for Linux client from GUI App Center - search for teams for linux
# click install then after a long time: click Open; 
# first login with bjorn.regnell@cs.lth.se then enter lucatid@lu.se etc

# the pandoc package in apt is outdated and missing from deb-get
# install latest pandoc from amd64.deb here https://github.com/jgm/pandoc/releases
sudo apt install ./pandoc-3.6.3-1-amd64.deb

#spotify is missing key-ring from deb-get etc so use snap instead
# login to spotify via web hook
sudo snap install spotify

sudo snap install tree

sudo snap install vlc
sudo apt install mpg123

sudo apt install ncal

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

# enable ubuntu pro
# open Software Updater from dash and select Ubuntu Pro tab to the dar right
# enter the key here after login in with your ubuntu one account
# https://ubuntu.com/pro/attach

# add git prompt from here 
# https://github.com/bjornregnell/ubuntu-tweaks/blob/master/bashrc/.bashrc
# copy from #------ BEGIN GIT PROMT
# to #-------- END GIT PROMPT

# fonts-firacode
sudo add-apt-repository universe
sudo apt update
sudo apt install fonts-firacode

# terminator https://github.com/gnome-terminator/terminator/
sudo add-apt-repository ppa:mattrose/terminator
sudo apt-get update
sudo apt install terminator
# update color scheme ambient + tango, font firacode, title bar green on black
# update keyboard shortcuts
#  split horizontal Shift+Alt+Down
#  split vertical Shift+Alt+Right
#  toggle maximize Shift+Alt+Up
#  toggle scrollbar Shift+Alt+Left

# Set terminator to default terminal:
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/terminator 50
# get the right config for terminator
mkdir ~/.config/terminator && cp ~/git/hub/bjornregnell/ubuntu-tweaks/terminator/config ~/.config/terminator/.

# Graphviz 
sudo apt install graphviz

# fix shortcuts in vscode for copy lines down
# https://stackoverflow.com/questions/33636531/some-vscode-keybindings-not-working-in-ubuntu
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "[]"
# in keyboard settions inside vs code:
#  {
#    "key": "ctrl+alt+down",
#    "command": "editor.action.copyLinesDownAction",
#    "when": "editorTextFocus && !editorReadonly"
#  },
