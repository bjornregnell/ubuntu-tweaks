sudo apt install fonts-firacode
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install exfat-fuse exfat-utils
sudo apt install ubuntu-restricted-extras
sudo apt install curl

# to enable terminal tools for graphics diagnostics etc
sudo apt install mesa-utils
# enables this command to check which GPU is in use, nvidia or intel:
glxinfo | grep vendor


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

# Java
sudo apt install openjdk-11-jdk  openjdk-11-source openjdk-11-doc 

# Scala + sbt
# change SV to latest version at https://github.com/lampepfl/dotty/releases/ 
export SV=3.0.1-RC1
mkdir -p ~/bin && mkdir -p ~/lib && cd ~/lib
wget https://github.com/lampepfl/dotty/releases/download/$SV/scala3-$SV.zip
unzip scala3-$SV.zip && rm scala3-$SV.zip
ln -s ~/lib/scala3-$SV/bin/scalac ~/bin/scalac
ln -s ~/lib/scala3-$SV/bin/scala ~/bin/scala
ln -s ~/lib/scala3-$SV/bin/scaladoc ~/bin/scaladoc
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update && sudo apt-get install sbt
#test sbt and download latest dependencies
mkdir -p ~/tmp && cd ~/tmp
echo scalaVersion := "\"$SV\"" | cat > build.sbt
sbt consoleQuick

# latex
sudo apt install hunspell hunspell-sv
sudo apt install texlive-full

# vscode as apt deb
sudo apt install apt-transport-https
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code


# tweak gedit
  ## Prohibit gedit to pollute folders with backup~ files:
gsettings set org.gnome.gedit.preferences.editor create-backup-copy 'false'
  ## Show line numbers:
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
  ## Dark theme:
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'

# Kojo --- check latest version number here: http://www.kogics.net/kojo-download
cd ~/Downloads
wget https://github.com/litan/kojo/releases/download/2.9.10_release/Kojo_unix_2_9_10_with_jre.sh
sh Kojo_unix_2_9_10_with_jre.sh

#https://ubuntuhandbook.org/index.php/2020/04/google-chrome-ubuntu-20-04-official-repository/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update && sudo apt install google-chrome-stable

#OBS studio  https://obsproject.com/download
sudo apt update && sudo apt install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update && sudo apt install obs-studio

#Microsoft Teams
# https://docs.microsoft.com/en-us/microsoftteams/get-clients#linux
# https://www.microsoft.com/en-us/microsoft-teams/download-app
sudo dpkg -i **teams downloaded deb-file**


# install gdebi to install deb packages with dependencies
#   this will install a boat-load of perl stuff
sudo apt install gdebi

# Zoom: Download deb from here https://zoom.us/support/download
sudo gdebi zoom_amd64.deb 

# install flatpak and flathub
# https://www.omgubuntu.co.uk/2019/02/how-to-install-flatpak-on-ubuntu-flathub
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update && sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install gnome-software-plugin-flatpak

# Email client Evolution that works with EWS
# DON'T use apt to install Evolution, use flathub to get latest
flatpak install flathub org.gnome.Evolution
# To bootstrap using another machine with Evolution:
#    File -> Back up Evolution Data
# save file somewhere and transfer to this machine and:
#    File -> Restore Evolution Data

# apps better installed via snaps to get latest version
sudo snap install tree spotify

# to enable gnome shell extensions
sudo apt install chrome-gnome-shell
# add extension cpu-power-manager from here:
https://extensions.gnome.org/extension/945/cpu-power-manager/
