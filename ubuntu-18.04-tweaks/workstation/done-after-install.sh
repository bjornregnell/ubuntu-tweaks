#get mac adress with ip a
ip a  # look for link/ether

#update package database
sudo apt update

#install updates
sudo apt dist-upgrade

#install ifconfig etc
sudo apt install net-tools

# app to check HW info
sudo apt-get install hardinfo

# setup ssh https://help.ubuntu.com/community/SSH/OpenSSH/Configuring
sudo apt-get install openssh-server

# install git
# https://askubuntu.com/questions/796600/difference-between-installing-git-vs-installing-git-all
sudo apt install git
git config --global user.email "YOUR EMAIL"
git config --global user.name "YOUR NAME"

# install xclip to paste to buffer from terminal
sudo apt-get install xclip

# Add new ssh-key to github
# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
ssh-keygen -t rsa -b 4096 -C "YOUR EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

# install jdk8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

# install sbt
# https://www.scala-sbt.org/download.html
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

# install scala
cd ~/Downloads
wget https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.deb
sudo dpkg -i scala-2.12.6.deb

# install syncthing
# https://apt.syncthing.net/
sudo apt install curl
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install syncthing-gtk

# fix filewatcher for syncthing
# https://docs.syncthing.net/users/faq.html#inotify-limits
echo "fs.inotify.max_user_watches=204800" | sudo tee -a /etc/sysctl.conf

# install atom
cd ~/Downloads
wget -O atom-amd64.deb https://atom.io/download/deb
sudo dpkg -i atom-amd64.deb
sudo apt -f install

# install gdebi to install deb packages with dependencies
sudo apt install gdebi

#install davmail -- first check latest version
wget -O davmail.deb davmail_4.8.6-2600-1_all.deb https://sourceforge.net/projects/davmail/files/davmail/4.8.6/davmail_4.8.6-2600-1_all.deb/download
sudo gdebi davmail_4.8.6-2600-1_all.deb
# AND cp the file .davmail-properties to your home catalog
# AND cp the file davmail.desktop to ~/.config/autostart/

# install chrome: https://www.google.com/chrome/
sudo gdebi google-chrome-stable_current_amd64.deb
# AND login to ulund.org

# install terminal tree list of files and directories
sudo snap install tree

#install i3
# https://i3wm.org/docs/repositories.html
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
sudo sh -c "echo \"deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe\" >> /etc/apt/sources.list.d/sur5r-i3.list"
sudo apt update
sudo apt install i3

### install acroread
## Below how to install the old adobe 9
#    Acrobat is the only (?) reader in linux that can view XFA Forms & comments
##   NOTE: It may be better to use winetricks instead so you don't
##         clutter your system with all old 32-bit stuff that acrobat 9 needs
##   https://linuxconfig.org/how-to-install-latest-adobe-acrobat-reader-dc-on-ubuntu-18-04-bionic-beaver-linux-with-wine
#
# http://askubuntu.com/questions/89127/how-do-i-install-adobe-acrobat-reader-deb-package-downloaded-from-adobe-website
#  Some background info:
#      https://www.linux.com/news/3-alternatives-adobe-pdf-reader-linux
#      http://askubuntu.com/questions/18495/which-pdf-viewer-would-you-recommend
#
#Download Adobe Reader (32-bit), from Adobe site:
cd ~/Downloads
wget ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
#    Check MD5SUM after downloading, input
md5sum AdbeRdr9.5.5-1_i386linux_enu.deb
#    the ouput should be
#    88036c68998d565c4365e2ad89b04d51 AdbeRdr9.5.5-1_i386linux_enu.deb
# install the old 32-bit stuff and in the process you will get errors
#   but the errors are fixed by subsequent commands
sudo dpkg -i --force-architecture AdbeRdr9.5.5-1_i386linux_enu.deb
sudo apt-get -f install
#    Add the missing 32-bit libraries: (skip this step for 32-bit)
sudo apt-get install libxml2:i386 lib32stdc++6
# To fix warnings/errors during runtime:
#  https://askubuntu.com/questions/342202/failed-to-load-module-canberra-gtk-module-but-already-installed
sudo apt install libcanberra-gtk-module:i386
#  https://ubuntuforums.org/showthread.php?t=2061142
sudo apt install --reinstall gtk2-engines-murrine:i386
#    (OPTIONAL) Run for first time, to get icon in the menu bar.
#    acroread <path>/<MyDocument>.pdf

### install latex
#
# https://help.ubuntu.com/community/LaTeX
sudo apt install texlive-full
sudo apt install hunspell hunspell-sv

# https://launchpad.net/~texworks/+archive/ubuntu/stable
sudo add-apt-repository ppa:texworks/stable
sudo apt update
sudo apt install texworks
# put your custom latex .sty files here:
# http://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te

# allow more tweaks of ubuntu gnome shell
sudo apt install gnome-tweak-tool

# fix calendar Ligthning in Thunderbird:
# https://askubuntu.com/questions/1084059/latest-update-to-thunderbird-60-2-1-on-18-04-lightning-calendar-missing
# 1. remove the lightning add-on in Thunderbird;
# 2. exit from Thunderbird;
# 3. install xul-ext-lightning package with
# 4. sudo apt install xul-ext-lightning
# 5. restart Thunderbird.

sudo apt install xul-ext-lightning

# ban evil login attempts:
# https://hostadvice.com/how-to/how-to-setup-fail2ban-on-your-ubuntu-18-04-vps-server-or-dedicated-server/
sudo apt install fail2ban

#best editor of all times (so far...)
sudo snap install --classic vscode

# extra fonts and codecs
sudo apt install libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg
sudo apt install ubuntu-restricted-extras

# video player VLC
sudo snap install vlc

# youtube download
# https://www.tecmint.com/download-mp3-song-from-youtube-videos/
# https://github.com/ytdl-org/youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl


# email client evolution
#sudo apt install evolution evolution-ews
# instead use flatpak version to get latest:
#  https://www.omgubuntu.co.uk/2019/02/how-to-install-flatpak-on-ubuntu-flathub
#    https://flatpak.org/setup/Ubuntu/
#    https://docs.flatpak.org/en/latest/using-flatpak.html#basic-commands

# Use from within running "Evolution File->backup Evolution Data" from other/older Evolution install and then select restore after installing new instance/version:

flatpak install flathub org.gnome.Evolution
flatpak update

# These are instructions for config of Evolution from scratch if you dont use backup/restore:
# emailadresss, lucatanvändarnamn utan @lu.se 
# Host URL:  https://webmail.lu.se/ews/exchange.asmx
# Klickar du sedan Fetch URL ska det dyka upp en lång url med en GUID som OAB URL (Offline Adress Book).
# Välj NTLM som autentisering. Servern säger att den stödjer kerberos också, men det fick jag aldrig att fungera.
# Hemma behöver jag dessutom starta med evolution --force-online för att få det att fungera, men det behövs inte på jobbet.


# microsoft teams, download from here
# https://techcommunity.microsoft.com/t5/microsoft-teams-blog/microsoft-teams-is-now-available-on-linux/ba-p/1056267

sudo gdebi teams_1.3.00.958_amd64.deb


#web cam drivers and settings v4l2
# http://www.techytalk.info/webcam-settings-control-ubuntu-fedora-linux-operating-system-cli/

sudo apt install v4l-utils

v4l2-ctl -h # --help
v4l2-ctl -D # --info
v4l2-ctl -l # --list-ctrls

# slack
# https://snapcraft.io/install/slack/ubuntu
sudo snap install slack --classic

# kdenlive and vlc
sudo snap install vlc 
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt-get update
sudo apt install kdenlive
# dark theme for kdenlive
sudo apt install breeze