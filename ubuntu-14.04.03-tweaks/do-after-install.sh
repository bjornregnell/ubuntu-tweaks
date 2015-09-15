#before install to dual boot ubuntu-unity:
#  make a live usb stick with ubuntu 14.04
#  run it and make the disk free space in gparted
#  choose "install ubuntu" -> choose "something else"
#    create / and swap partitions 
# then install ubuntu in new partition

# This fixed the problem that grub did not show up; could not start win7:
sudo grub-install /dev/sda
sudo update-grub
#restarted and it worked

# https://fixubuntu.com/ 

# Get gksudo to enable sudo with window apps:
sudo apt-get install gksu

# *** git
# http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
# http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid
# https://help.github.com/articles/changing-a-remote-s-url/
# http://stackoverflow.com/questions/9717137/displaying-git-branch-name-in-prompt-does-not-work-in-screen

# *** java
# http://askubuntu.com/questions/521145/how-to-install-oracle-java-on-ubuntu-14-04
# http://www.oracle.com/technetwork/java/javase/downloads/index.html 
sudo mkdir /usr/lib/jvm
sudo mv ~/Downloads/jdk1.8.0_60 /usr/lib/jvm/oracle_jdk8
gksudo gedit /etc/profile.d/oraclejdk.sh
#paste code below until ##
export J2SDKDIR=/usr/lib/jvm/oracle_jdk8
export J2REDIR=/usr/lib/jvm/oracle_jdk8/jre
export PATH=$PATH:/usr/lib/jvm/oracle_jdk8/bin:/usr/lib/jvm/oracle_jdk8/db/bin:/usr/lib/jvm/oracle_jdk8/jre/bin
export JAVA_HOME=/usr/lib/jvm/oracle_jdk8
export DERBY_HOME=/usr/lib/jvm/oracle_jdk8/db

# *** eclipse
## http://www.eclipse.org/downloads/
## choose javase for java developers
cd /opt/ && sudo tar -zxvf ~/Downloads/eclipse-*.tar.gz
gksudo gedit /usr/share/applications/eclipse.desktop
# Above command will create and open the launcher file for eclipse with gedit text editor.
# Paste below content into the opened file and save it.
[Desktop Entry]
Name=Eclipse 4
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse

# *** sublime
# http://www.webupd8.org/2013/07/sublime-text-3-ubuntu-ppa-now-available.html
# http://askubuntu.com/questions/172698/how-do-i-install-sublime-text-2-3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
# https://kerrenortlepp.wordpress.com/2015/03/19/add-dictionary-to-sublime-text-3/
# https://github.com/titoBouzout/Dictionaries
ls /opt/sublime_text/Packages/
cd /opt/sublime_text/Packages/
sudo cp ~/Downloads/Language\ -\ English.sublime-package .

# *** Latex
# https://help.ubuntu.com/community/LaTeX
sudo apt-get install texlive-full
sudo apt-get install texlive-lang-swedish
sudo apt-get install texworks  
apt-get install myspell-sv-se
# put your custom latex .sty files from lth here:
# http://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te

# *** ms fonts
# http://www.pcworld.com/article/2863497/how-to-install-microsoft-fonts-in-linux-office-suites.html
# below must be run in terminal to accept EULA terms
# USE <TAB> BEFORE PRESSING <ENTER>
sudo apt-get install ttf-mscorefonts-installer

# *** pandoc
# check which latest version here: https://github.com/jgm/pandoc/releases/tag/1.15.0.6
# this is probably old: sudo apt-get install pandoc
wget https://github.com/jgm/pandoc/releases/download/1.15.0.6/pandoc-1.15.0.6-1-amd64.deb
sudo dpkg -i pandoc-1.15.0.6-1-amd64.deb

# *** xclip
#  to enable putting things in the paste buffer, e.g. xclip -sel clip < ~/.ssh/id_rsa.pub
sudo apt-get install xclip

# Fix menu in window title bar
#http://askubuntu.com/questions/541449/14-04-always-show-menu-items
# Aargh on tab-switcher. Hope for solution in coming LTS... Learn how to use super-W instead; probably quicker...
# http://askubuntu.com/questions/68151/how-do-i-revert-alt-tab-behavior-to-switch-between-windows-on-the-current-worksp/68171#68171
# http://ubuntuforums.org/showthread.php?t=2211863
# https://bugs.launchpad.net/ubuntu/+source/compiz/+bug/1282900
# Compizconfig is unfortunately shaky and dangerous (I tried below but the static swithcer crashed frequently)
