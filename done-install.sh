# Installed:

# to enable more system settings:
sudo apt install unity-tweak-tool

# to get ms fonts etc:
sudo apt install ubuntu-restricted-extras
# after above ^ scroll down and hit tab until ok is red then press enter

sudo apt install libavcodec-extra  # was not needed

# install gksudo to enable sudo with window apps:
sudo apt-get install gksu

# *** git
# http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
#https://help.github.com/articles/setting-your-username-in-git/
git config --global user.name "bjornregnell"
# http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid
cd ~                 #Your home directory
ssh-keygen -t rsa    #Press enter for all values
# If it is a GitHub repository and you have administrative privileges,
# go to settings and click 'add SSH key'.
# Copy the contents of your ~/.ssh/id_rsa.pub into the field labeled 'Key'.
# https://help.github.com/articles/changing-a-remote-s-url/
# http://stackoverflow.com/questions/9717137/displaying-git-branch-name-in-prompt-does-not-work-in-screen


# *** i3  https://i3wm.org/docs/repositories.html

#download keyring by this command in terminal in home:

/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f

sudo apt install ./keyring.deb

sudo sh -c 'echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list'

sudo apt update

sudo apt install i3

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
sudo dpkg -i --force-architecture --force-depends AdbeRdr9.5.5-1_i386linux_enu.deb
sudo apt-get -f install
#    Add the missing 32-bit libraries: (skip this step for 32-bit)
sudo apt-get install libxml2:i386 lib32stdc++6
#    Run for first time (it will take som time), accept EULA etc.



# tweak gedit
  ## Prohibit gedit to pollute folders with backup~ files:
gsettings set org.gnome.gedit.preferences.editor create-backup-copy 'false'
  ## Show line numbers:
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
  ## Dark theme:
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'


# *** editor Atom.io
# https://launchpad.net/~webupd8team/+archive/ubuntu/atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
# install packages in atom from terminal
apm install intellij-darcula-syntax
# in settings -> themes -> Choose a theme set syntax theme to Intellij Darcula
apm install language-scala
apm install language-latex


# *** JAVA
# http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java8-installer
sudo apt install oracle-java8-set-default


## add sudo without password for these things:
sudo -i
echo "bjornr  ALL=NOPASSWD: /usr/sbin/pm-suspend-hybrid" >> /etc/sudoers
echo "bjornr  ALL=NOPASSWD: /usr/sbin/pm-suspend" >> /etc/sudoers
exit

## configure vino for remote desktop access in Ubuntu 16.04
# https://help.ubuntu.com/community/VNC/Servers
# https://gist.github.com/samba/69e1ca11f9d04f218b9b
    # On a Win10 machine: open windows firewall
    # http://www.configserverfirewall.com/windows-10/enable-remote-desktop-windows-10/


# *** Latex
# https://help.ubuntu.com/community/LaTeX
sudo apt-get install texlive-full
sudo apt-get install myspell-sv-se

# https://launchpad.net/~texworks/+archive/ubuntu/stable
sudo add-apt-repository ppa:texworks/stable && sudo apt-get update
sudo apt-get install texworks

## install qpdfviewer -- good alternative to evince
sudo apt install qpdfview

# *** xclip ***
# to enable putting things in the paste buffer, e.g. xclip -sel clip < ~/.ssh/id_rsa.pub
sudo apt-get install xclip

# *** tree  *** to enable tree listing in terminal
sudo apt-get install tree

#

# *** java oracles JDK8  # press TAB to get to YES in EUAL agreement then ENTER
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default


# *** sbt  http://www.scala-sbt.org/download.html

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt


# *** SCALA   check the latest version number here:
#             http://www.scala-lang.org/download/all.html
cd ~/Downloads
wget http://www.scala-lang.org/files/archive/scala-2.12.3.deb
sudo dpkg -i scala-2.12.3.deb
# the above command will install some shell scripts to run scala stuff in /usr/bin/scala*
ls /usr/bin/scala*
# the scala libs will be placed here:
whereis scala
# scala: /usr/bin/scala /usr/bin/X11/scala /usr/share/scala /usr/share/man/man1/scala.1.gz
# add SCALA_HOME to your ~/.profile if it is not already there:
echo 'export SCALA_HOME=/usr/share/scala' >>~/.profile

# *** git
# http://stackoverflow.com/questions/19109542/installing-latest-version-of-git-in-ubuntu
sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update
sudo apt-get install git
# http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid
# https://help.github.com/articles/changing-a-remote-s-url/
# http://stackoverflow.com/questions/9717137/displaying-git-branch-name-in-prompt-does-not-work-in-screen


# Kojo --- check latest version number here: http://www.kogics.net/kojo-download
cd ~/Downloads
wget https://bitbucket.org/lalit_pant/kojo/downloads/kojoInstall-2.4.10.jar
java -jar kojoInstall-2.4.10.jar


# How to mount Dlink nas bithinken
# https://wiki.ubuntu.com/MountWindowsSharesPermanently
# https://wiki.samba.org/index.php/Mounting_samba_shares_from_a_unix_client
# https://askubuntu.com/questions/525243/why-do-i-get-wrong-fs-type-bad-option-bad-superblock-error
sudo apt-get install cifs-utils
sudo mkdir /mnt/bithinken
# Then when you only want to mount ince:
sudo mount -t cifs -o user=admin //192.168.0.32/Volume_1 /mnt/bithinken
# Or append this line to /etc/fstab:
sudo sh -c "echo '//192.168.0.32/Volume_1  /mnt/bithinken  cifs  guest,uid=1000,iocharset=utf8  0' >> /etc/fstab"
# Colors in ls get strange beacuse:
#  https://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output


# How to install printer BROTHER dcp9055cdn
#
#
http://support.brother.com/g/s/id/linux/en/instruction_prn1a.html?c=us_ot&lang=en&redirect=on
http://support.brother.com/g/s/id/linux/en/download_prn.html#DCP-9055CDN
http://www.brother.com/cgi-bin/agreement/agreement.cgi?dlfile=http://www.brother.com/pub/bsc/linux/dlf/dcp9055cdnlpr-1.1.1-5.i386.deb&lang=English_lpr
http://www.brother.com/cgi-bin/agreement/agreement.cgi?dlfile=http://www.brother.com/pub/bsc/linux/dlf/dcp9055cdncupswrapper-1.1.1-5.i386.deb&lang=English
_gpl
http://askubuntu.com/questions/460729/duplex-double-sided-print-not-available

sudo ln -s /etc/init.d/cups /etc/init.d/lpd  # is this really needed???

sudo mkdir -p /var/spool/lpd/dcp9055cdn

sudo dpkg -i --force-all dcp9055cdnlpr-1.1.1-5.i386.deb


sudo dpkg  -i  --force-all dcp9055cdncupswrapper-1.1.1-5.i386.deb

dpkg  -l  |  grep  Brother

# append this to
gksudo gedit /etc/printcap

DCP9055CDN:\
        :mx=0:\
        :sd=/var/spool/lpd/dcp9055cdn:\
        :sh:\
        :rm=192.168.0.15\
        :rp=lp\
        :if=/usr/local/Brother/Printer/dcp9055cdn/lpd/

# Open Printers in dash and select properties
# Set device URI to:
dnssd://Brother%20DCP-9055CDN._pdl-datastream._tcp.local/
# If you press Change... the above should be set if you choose network printer on specific IP address
# Set make and model to
Brother DCP-9055CDN CUPS


# Install this tpo access Samsung external SSD with exfat file system
#  https://askubuntu.com/questions/364270/mount-unknown-filesystem-exfat
sudo apt-get install exfat-fuse exfat-utils
