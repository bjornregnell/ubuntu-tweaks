# Done after install

sudo apt update
sudo apt dist-upgrade 

sudo apt install ubuntu-restricted-extras

sudo apt install curl

# https://syncthing.net/downloads/
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing
sudo apt-get install chrome-gnome-shell

# https://docs.syncthing.net/users/faq.html#inotify-limits
echo "fs.inotify.max_user_watches=204800" | sudo tee -a /etc/sysctl.conf
sudo sh -c 'echo 204800 > /proc/sys/fs/inotify/max_user_watches'

# vs code https://snapcraft.io/code
sudo snap install code --classic

# install xclip to paste to buffer from terminal
sudo apt-get install xclip

# Add new ssh-key to github
# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
sudo apt install git
git config --global user.email "bjorn.regnell@cs.lth.se"
git config --global user.name "bjornregnell"

ssh-keygen -t rsa -b 4096 -C "bjorn.regnell@cs.lth.se"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

# install gdebi to install deb packages with dependencies
sudo apt install gdebi

# tree
sudo snap install tree

# spotify
sudo snap install spotify

# java
sudo apt install openjdk-11-jdk  openjdk-11-source openjdk-11-doc 

# scala
cd ~/Downloads
wget https://downloads.lightbend.com/scala/2.13.1/scala-2.13.1.deb
gdebi scala-2.13.1.deb 

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt update
sudo apt install sbt

# latex
# https://help.ubuntu.com/community/LaTeX
sudo apt install texlive-full
sudo apt install hunspell hunspell-sv

# email client evolution
sudo apt install evolution evolution-ews
# Server Type: Exchange Web Services
# Username: lucatid utan @lu.se
# Host Url: https://webmail.lu.se/EWS/Exchange.asmx
# press button: Fetch URL
# Authentication: NTLM

# vpn
sudo apt-get install ike
# Open Shrew in dash
# select File -> Import and import this file
# ~/git/hub/bjornregnell/ubuntu-tweaks/vpn/cs-connect.vpn 
# click "Connect" user name lucat id utan @lu.se

# lenovo battery management
# https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
sudo apt install tlp tlp-rdw 
sudo apt install tp-smapi-dkms
sudo apt install acpi-call-dkms
# after restart
# https://linrunner.de/en/tlp/docs/tlp-faq.html#how-to-disable-thresholds
sudo tlp-stat -s
sudo tlp-stat -b
sudo tlp fullcharge 
more /etc/default/tlp

# kdenlive and vlc
sudo snap install vlc 
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt-get update
sudo apt install kdenlive
# dark theme for kdenlive
sudo apt install breeze