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
# http://askubuntu.com/questions/760204/how-to-remove-the-unity-amazon-package-in-16-04
cp /usr/share/applications/ubuntu-amazon-default.desktop ~/.local/share/applications/ubuntu-amazon-default.desktop
echo Hidden=true >> ~/.local/share/applications/ubuntu-amazon-default.desktop
# Then clear history:
# System settings -> Security & Privacy -> files & applications -> clear usage data -> From all time

# http://www.webupd8.org/2016/04/things-to-do-after-installing-ubuntu-1604-lts-xenial-xerus.html

sudo apt install unity-tweak-tool
# If in virtualbox remove animations in unity tweak tool:
#     General-window animations OFF

sudo apt install ubuntu-restricted-extras
# after above: scroll down and hit tab until ok is red then press enter

sudo apt install libavcodec-extra 

# install gksudo to enable sudo with window apps:
sudo apt-get install gksu


### Programming tools:


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

      # *** Ammonite REPL alternative to scala REPL  --- OPTIONAL -- it seems slower than normal REPL
      #   http://lihaoyi.github.io/Ammonite/#Ammonite-REPL
      cd ~/Downloads
      wget https://git.io/vo4w5 -O amm
      chmod +x amm
      sudo mkdir /opt/ammonite
      sudo mv amm /opt/ammonite/.
      sudo ln -s /opt/ammonite/amm /usr/bin/amm 

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


        ### ?????? finns ej: ??? sudo apt-get install texlive-lang-swedish
        #### ovan kanske inte behövs eftersom denna finns???
        ######### https://launchpad.net/ubuntu/xenial/+package/texlive-lang-european


        # put your custom latex .sty files from lth here:
        # http://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te




#################################################  ovan är gjort till hit ### 




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






# *** scala ide
## http://scala-ide.org/download/sdk.html
cd ~/Downloads
mkdir scalaide
cd scalaide
wget http://downloads.typesafe.com/scalaide-pack/4.3.0-vfinal-luna-211-20151201/scala-SDK-4.3.0-vfinal-2.11-linux.gtk.x86_64.tar.gz   ## change to latest version
tar -zxvf scala-SDK-*.tar.gz
sudo mv eclipse /opt/scalaide
echo "[Desktop Entry]
Name=Scala IDE
Type=Application
Exec=/opt/scalaide/eclipse
Terminal=false
Icon=/opt/scalaide/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Scala IDE" > scalaide.desktop
sudo mv scalaide.desktop /usr/share/applications/.

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



# *** tweak texworks editor: http://latex-community.org/forum/viewtopic.php?f=56&t=6921 
# edit this file: 
# gksudo gedit /usr/share/applications/texworks.desktop
#    change the Exec= line to: 
#  Exec=texworks -stylesheet /home/bjornr/.TeXworks/configuration/mystyle.css %F
#
#  Create the css style file:
echo "QTextEdit {
  background-color: rgb(39, 40, 34);  
  color: white;            /* sets the main text color */
}
" > ~/.TeXworks/configuration/mystyle.css
# add alias tw -> texworks in bg with the new nice stylesheet
echo '
# alias for texworks
function tw() { texworks -stylesheet /home/bjornr/.TeXworks/configuration/mystyle.css "$@" & }
' >> ~/.bashrc

# Edit the colors in ~/.TeXworks/configuration/syntax-patterns.txt
#http://www.colourlovers.com/palette/1718713/Monokai
[LaTeX]             
# special characters #FD971Fo
#darkred		N	[$#^_{}&]
 #FD971F		N	[$#^_{}&]

# LaTeX environments   
#darkgreen	N	\\(?:begin|end)\s*\{[^}]*\}
 #A6E22E    N	\\(?:begin|end)\s*\{[^}]*\}
 
# LaTeX packages
#darkblue	N	\\usepackage\s*(?:\[[^]]*\]\s*)?\{[^}]*\}
 #FD971F  N	\\usepackage\s*(?:\[[^]]*\]\s*)?\{[^}]*\}
 
# control sequences
#blue		N	\\(?:[A-Za-z@]+|.)
 #66D9EF		N	\\(?:[A-Za-z@]+|.)

# comments
#red			Y	%.*
 #F92672	Y	%.*



# *** pandoc
# check which latest version here: https://github.com/jgm/pandoc/releases
wget https://github.com/jgm/pandoc/releases/download/1.17.1/pandoc-1.17.1-2-amd64.deb
sudo dpkg -i pandoc-xxxxx-amd64.deb

# *** xclip
# to enable putting things in the paste buffer, e.g. xclip -sel clip < ~/.ssh/id_rsa.pub
sudo apt-get install xclip

# *** tree
#  to enable tree listing in terminal
sudo apt-get install tree

# *** Filezilla
# multiflatform file transfer app
sudo apt-get install filezilla


# Fix menu in window title bar
# http://askubuntu.com/questions/25785/can-auto-hide-for-the-application-menu-be-turned-off-in-unity
gsettings set com.canonical.Unity always-show-menus false
#http://askubuntu.com/questions/541449/14-04-always-show-menu-items
# Aargh on tab-switcher. Hope for solution in coming LTS... Learn how to use super-W instead; probably quicker...
# http://askubuntu.com/questions/68151/how-do-i-revert-alt-tab-behavior-to-switch-between-windows-on-the-current-worksp/68171#68171
# http://ubuntuforums.org/showthread.php?t=2211863
# https://bugs.launchpad.net/ubuntu/+source/compiz/+bug/1282900
# Compizconfig is unfortunately shaky and dangerous (I tried but the static swithcer crashed frequently)

# Kojo --- check latest version number here: http://www.kogics.net/kojo-download
cd ~/Downloads
wget https://bitbucket.org/lalit_pant/kojo/downloads/kojoInstall-2.4.08.jar
java -jar kojoInstall-2.4.08.jar

# Virtualbox    https://www.virtualbox.org/wiki/Linux_Downloads
wget http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb 
## add the following line to your /etc/apt/sources.list: 
## deb http://download.virtualbox.org/virtualbox/debian vivid contrib
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - 
sudo apt-get install virtualbox-5.0
sudo apt-get install dkms
## Download some iso, fire up the machine and install
## Mount guest additions using virtualbox menu
## in the dir with VBOXADDITIONS run: sudo ./VBoxLinuxAdditions.run
## Restart the vbox machine

# i3 window manager and extra stuff
# https://i3wm.org/
# http://i3wm.org/docs/repositories.html

sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3

sudo apt-get install dmenu
sudo apt-get install dunst
sudo apt-get install i3lock
sudo apt-get install i3status
sudo apt-get install suckless-tools
sudo apt-get install gnome-settings-daemon


## Get old adobe 9 -- the only reader in linux that can view XFA Forms & comments
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
sudo dpkg -i --force-architecture AdbeRdr9.5.5-1_i386linux_enu.deb
sudo apt-get -f install
#    Add the missing 32-bit libraries: (skip this step for 32-bit)
sudo apt-get install libxml2:i386 lib32stdc++6
#    (OPTIONAL) Run for first time, to get icon in Unity menu bar.
#    acroread <path>/<MyDocument>.pdf


## Make java plugin available in Firefox:
cd /usr/lib/firefox-addons/plugins/
sudo ln -s /usr/lib/jvm/oracle_jdk8/jre/lib/amd64/libnpjp2.so .




