#  UI Tweaks: 
#   System settings -> Appearance -> Behaviour -> 
#       TICK: in the widow's title
#       Enable workspaces
#       Add desktop icon
#  Security & Privacy: Untick Require my password
#  Brightness & Lock: Turn screen off when active: Never

# https://fixubuntu.com/ 
# http://askubuntu.com/questions/760204/how-to-remove-the-unity-amazon-package-in-16-04
cp /usr/share/applications/ubuntu-amazon-default.desktop ~/.local/share/applications/ubuntu-amazon-default.desktop
echo Hidden=true >> ~/.local/share/applications/ubuntu-amazon-default.desktop
# Then clear history:
# System settings -> Security & Privacy -> files & applications -> clear usage data -> From all time
# http://www.webupd8.org/2016/04/things-to-do-after-installing-ubuntu-1604-lts-xenial-xerus.html

## Fix menu in window title bar
gsettings get com.canonical.Unity integrated-menus true
gsettings set com.canonical.Unity always-show-menus false


# To tweak unity with more options than standard system settings:
sudo apt install unity-tweak-tool
# then:     General-window animations OFF

# Add non-free extra codecs and fonts:
sudo apt install ubuntu-restricted-extras
# then: scroll down and hit tab until ok is red then press enter
sudo apt install libavcodec-extra 
# then: press enter on ok (perhaps need to use tab to get there)

# install gksudo to enable sudo with window apps:
sudo apt-get install gksu

# *** xclip
# to enable putting things in the paste buffer, e.g. xclip -sel clip < ~/.ssh/id_rsa.pub
sudo apt-get install xclip

# *** tree
#  to enable tree listing in terminal
sudo apt-get install tree


# *** JAVA
# http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer
sudo apt-get install oracle-java8-set-default

# to make sure make is of latest version:
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt update
sudo apt install ubuntu-make


# *** SCALA   check the latest version number here: 
#             http://www.scala-lang.org/download/all.html
cd ~/Downloads
wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb
rm scala-2.11.8.deb
# the above command will install some shell scripts to run scala stuff in /usr/bin/scala*
ls /usr/bin/scala*
# the scala libs will be placed here:
whereis scala
# scala: /usr/bin/scala /usr/bin/X11/scala /usr/share/scala /usr/share/man/man1/scala.1.gz
# add SCALA_HOME to your ~/.profile if it is not already there:
echo 'export SCALA_HOME=/usr/share/scala' >>~/.profile



# *** sbt Scala Build Tool
# http://www.scala-sbt.org/0.13/tutorial/Installing-sbt-on-Linux.html 
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt
sbt   # this will take long time the first time.....


 
# *** git
# http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git  
# http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid
# https://help.github.com/articles/changing-a-remote-s-url/
# http://stackoverflow.com/questions/9717137/displaying-git-branch-name-in-prompt-does-not-work-in-screen


# tweak gedit
  ## Prohibit gedit to pollute folders with backup~ files:
gsettings set org.gnome.gedit.preferences.editor create-backup-copy 'false'
  ## Show line numbers:
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
  ## Dark theme:
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'


# *** Latex
# https://help.ubuntu.com/community/LaTeX
sudo apt-get install texlive-full
sudo apt-get install myspell-sv-se

# https://launchpad.net/~texworks/+archive/ubuntu/stable
sudo add-apt-repository ppa:texworks/stable
sudo apt-get update
sudo apt-get install texworks


# *** scala ide
## http://scala-ide.org/download/sdk.html
cd ~/Downloads
mkdir scalaide
cd scalaide
wget http://fileadmin.cs.lth.se/pgk/scalaide441mars2-linux.gtk.x86_64.tar.gz  
tar -zxvf scalaide*.tar.gz
sudo mv scalaide441mars2 /opt/scalaide441mars2
echo "[Desktop Entry]
Name=Scala IDE
Type=Application
Exec=/opt/scalaide441mars2/eclipse
Terminal=false
Icon=/opt/scalaide441mars2/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Scala IDE 4.4.1 Mars 2" > scalaide.desktop
sudo mv scalaide.desktop /usr/share/applications/.
cd ..
rm -r scalaide 


# Kojo --- check latest version number here: http://www.kogics.net/kojo-download
cd ~/Downloads
wget https://bitbucket.org/lalit_pant/kojo/downloads/kojoInstall-2.4.09.jar
wget http://kogics.wdfiles.com/local--files/kojo-silent-install/auto-install.xml
sed -i -e 's#/home/lalit/Kojo2.auto#/opt/kojo#g' auto-install.xml 
sudo java -jar kojoInstall-2.4.09.jar auto-install.xml
echo "[Desktop Entry]
Name=Kojo
Type=Application
Exec=/opt/kojo/bin/kojo
Terminal=false
Icon=/opt/kojo/icons/kojo48.ico
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Kojo 2.4.09" > kojo.desktop
sudo mv kojo.desktop /usr/share/applications/.
rm kojoInstall*
rm auto-install.xml

# IntelliJ https://launchpad.net/~mmk2410/+archive/ubuntu/intellij-idea-community
sudo add-apt-repository ppa:mmk2410/intellij-idea-community
sudo apt-get update
# Select Scala plugin on first run
# https://youtrack.jetbrains.com/issue/IDEA-78860
# Keyboard input sometimes is blocked when IBus is active 
export IBUS_ENABLE_SYNC_MODE=1


 # i3 window manager and extra stuff
# https://i3wm.org/
# http://i3wm.org/docs/repositories.html
sudo apt-get update
sudo apt-get install i3

#################################################  ovan är gjort till hit ###

#sudo apt-get install dmenu
#sudo apt-get install dunst
#sudo apt-get install i3lock
#sudo apt-get install i3status
#sudo apt-get install suckless-tools
sudo apt-get install gnome-settings-daemon

cd ~
mkdir .i3
cd .i3
wget https://github.com/bjornregnell/ubuntu-tweaks/raw/master/ubuntu-16.04-tweaks/introprog-vm/i3/config
wget https://github.com/bjornregnell/ubuntu-tweaks/raw/master/ubuntu-16.04-tweaks/introprog-vm/i3/i3status.conf

