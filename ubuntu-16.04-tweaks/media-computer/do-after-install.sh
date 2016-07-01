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


# tweak gedit
  ## Prohibit gedit to pollute folders with backup~ files:
gsettings set org.gnome.gedit.preferences.editor create-backup-copy 'false'
  ## Show line numbers:
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
  ## Dark theme:
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'


##  FIX Firefox 
# too slow mouse wheel scroll in linux
# about:config
# general.smoothScroll.mouseWheel.durationMaxMS;1000
# mousewheel.acceleration.factor;50
# mousewheel.min_line_scroll_amount;60
# 
#  Install extensions: 
#     adblock 
#     tree style tab
#     tree style tabs toplevel
# Disable: Ubuntu modifications


### ENABEL HBO AND NETFLIX  
# pipelight for HBO in Firefox:
# http://ubuntuforums.org/showthread.php?t=2274467
sudo add-apt-repository ppa:pipelight/stable
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi
sudo pipelight-plugin --update
sudo pipelight-plugin --enable flash
sudo pipelight-plugin --enable widevine
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --update
sudo pipelight-plugin --create-mozilla-plugins

# Only way to get Netflix is to install Chrome
#  Install from here and accept terms...
# http://www.google.com/chrome/browser/?platform=linux 



