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

# install gksudo to enable sudo with window apps:
sudo apt-get install gksu

# tweak gedit
  ## Prohibit gedit to pollute folders with backup~ files:
gsettings set org.gnome.gedit.preferences.editor create-backup-copy 'false'
  ## Show line numbers:
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
  ## Dark theme:
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
  ## Enable Scala syntax highlighting: 
  ## http://shanky.org/2011/09/27/scala-syntax-highlighting-in-gedit/  
cd ~/Downloads
wget https://raw.githubusercontent.com/bjornregnell/ubuntu-tweaks/master/ubuntu-14.04.03-tweaks/scala.lang
mkdir ~/.gnome2/
mkdir ~/.gnome2/gtksourceview-1.0/
mkdir ~/.gnome2/gtksourceview-1.0/language-specs/
mv scala.lang ~/.gnome2/gtksourceview-1.0/language-specs/.
echo "<?xml version='1.0' encoding='UTF-8'?>
<mime-info
 xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
<mime-type type='text/x-scala'>
<comment>Scala programming language</comment>
<glob pattern='*.scala'/>
</mime-type>
</mime-info>" > scala-mime.xml
sudo mv scala-mime.xml /usr/share/mime/packages/scala-mime.xml
sudo update-mime-database /usr/share/mime

# *** git
# http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
# http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid
# https://help.github.com/articles/changing-a-remote-s-url/
# http://stackoverflow.com/questions/9717137/displaying-git-branch-name-in-prompt-does-not-work-in-screen

# *** java first time install
# http://askubuntu.com/questions/521145/how-to-install-oracle-java-on-ubuntu-14-04
# http://www.oracle.com/technetwork/java/javase/downloads/index.html 
#   click accept above and download e.g. Linux x64 jdk-8u73-linux-x64.tar.gz 
#     into Downloads and 
#     extraxt to ~/Downloads/jdk1.8.0_?? 
#     with some number instead of ?? and update ?? below
sudo mkdir /usr/lib/jvm
sudo mv ~/Downloads/jdk1.8.0_?? /usr/lib/jvm/oracle_jdk8
gksudo gedit /etc/profile.d/oraclejdk.sh
# to set vital paths paste the code below 
# until but not including ## in the file /etc/profile.d/oraclejdk.sh open in gedit 
export J2SDKDIR=/usr/lib/jvm/oracle_jdk8
export J2REDIR=/usr/lib/jvm/oracle_jdk8/jre
export JAVA_HOME=/usr/lib/jvm/oracle_jdk8
export DERBY_HOME=/usr/lib/jvm/oracle_jdk8/db
export PATH=$J2SDKDIR/bin:$DERBY_HOME/bin:$J2REDIR/bin:$PATH
##
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/oracle_jdk8/jre/bin/java 2000
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/oracle_jdk8/bin/javac 2000

# *** to update oracle javaSE 8 jdk 
# download new version of jdk-8u??-linux-x64.tar.gz from (click accept then download)
#    http://www.oracle.com/technetwork/java/javase/downloads/index.html 
# extraxt to ~/Downloads/jdk1.8.0_?? with some number instead of ?? and update ?? below
sudo mv /usr/lib/jvm/oracle_jdk8 /usr/lib/jvm/oracle_jdk8_old
sudo mv ~/Downloads/jdk1.8.0_?? /usr/lib/jvm/oracle_jdk8
# test it:
java -version
# remove old:
sudo rm -rf /usr/lib/jvm/oracle_jdk8_old
##

# *** scala   check the latest version number here: 
#             http://www.scala-lang.org/download/all.html
cd ~/Downloads
wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb
# the above command will install some shell scripts to run scala stuff in /usr/bin/scala*
ls /usr/bin/scala*
# the scala libs will be placed here:
whereis scala
# scala: /usr/bin/scala /usr/bin/X11/scala /usr/share/scala /usr/share/man/man1/scala.1.gz
# add SCALA_HOME to your ~/.profile if it is not already there:
grep -q 'export SCALA_HOME' ~/.profile || echo 'export SCALA_HOME=/usr/share/scala' >>~/.profile

# *** sbt Scala Build Tool
# http://www.scala-sbt.org/0.13/tutorial/Installing-sbt-on-Linux.html 
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt

# Syntax highligting in REPL:
# 
# Put this into your ~/.sbt/0.13/user.sbt:
echo "initialize ~= { _ =>
  val ansi = System.getProperty(\"sbt.log.noformat\", \"false\") != "true"
  if (ansi) System.setProperty(\"scala.color\", \"true\")
}" >>  ~/.sbt/0.13/user.sbt

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

# *** tweak texworks editor: http://latex-community.org/forum/viewtopic.php?f=56&t=6921 
# edit this file: /usr/share/applications/texworks.desktop
#    change the Exec= line to: 
#  Exec=texworks -stylesheet /home/bjornr/.TeXworks/configuration/mystyle.css %F
echo "QTextEdit {
  background-color: rgb(39, 40, 34);  
  color: black;            /* sets the main text color */
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
# check which latest version here: https://github.com/jgm/pandoc/releases/tag/1.15.0.6
# this is probably old: sudo apt-get install pandoc
wget https://github.com/jgm/pandoc/releases/download/1.15.0.6/pandoc-1.15.0.6-1-amd64.deb
sudo dpkg -i pandoc-1.15.0.6-1-amd64.deb

# *** xclip
# to enable putting things in the paste buffer, e.g. xclip -sel clip < ~/.ssh/id_rsa.pub
sudo apt-get install xclip

# *** tree
#  to enable tree listing in terminal
sudo apt-get install tree

# *** Filezilla
# multiflatform file transfer app
sudo apt-get install filezilla

# *** Ammonite REPL alternative to scala REPL
#   http://lihaoyi.github.io/Ammonite/#Ammonite-REPL
cd ~/Downloads
wget https://git.io/v0FGO -O amm
chmod +x amm
sudo mkdir /opt/ammonite
sudo mv amm /opt/ammonite/.
sudo ln -s /opt/ammonite/amm /usr/bin/amm 

#using the Ammonite REPL as a replacement for the standard REPL (also known as the console). Ammonite features pretty printing, loading of dependencies directly from the REPL, multiline input and many more. Add to global.sbt
#  http://lihaoyi.github.io/Ammonite/ 
#  http://underscore.io/blog/posts/2015/11/09/sbt-commands.html 
libraryDependencies += "com.lihaoyi" % "ammonite-repl" % "0.4.8" % "test" cross CrossVersion.full
initialCommands in (Test, console) := """ammonite.repl.Repl.run("")"""

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



