# First make an update from Software Update Mgr in the Dash

## REMOVE Amazon stuf:
# http://askubuntu.com/questions/760204/how-to-remove-the-unity-amazon-package-in-16-04

gsettings get com.canonical.Unity.Lenses always-search
gsettings set com.canonical.Unity.Lenses always-search "['applications.scope', 'music.scope', 'videos.scope', 'files.scope']"

gsettings get com.canonical.Unity.Lenses home-lens-default-view
gsettings set com.canonical.Unity.Lenses home-lens-default-view "['applications.scope', 'files.scope']"

gsettings get com.canonical.Unity.Lenses disabled-scopes
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

cp /usr/share/applications/ubuntu-amazon-default.desktop ~/.local/share/applications/ubuntu-amazon-default.desktop
echo Hidden=true >> ~/.local/share/applications/ubuntu-amazon-default.desktop
# Then clear history:
# System settings -> Security & Privacy -> files & applications -> clear usage data -> From all time


## GET RESTRICTED EXTRA STUFF:
# http://www.webupd8.org/2016/04/things-to-do-after-installing-ubuntu-1604-lts-xenial-xerus.html
# http://askubuntu.com/questions/166655/how-do-i-remove-a-website-from-ubuntus-web-applications

sudo apt install ubuntu-restricted-extras
# after above: scroll down and hit tab until ok is red then press enter
### seems to be included in above: sudo apt install libavcodec-extra 

# install gksudo to enable sudo with window apps:
sudo apt-get install gksu

sudo apt install unity-tweak-tool
# If in virtualbox or no graphics HW remove animations in unity tweak tool:
#     General-window -> animations OFF

sudo apt-get install compizconfig-settings-manager

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

## tweak gedit
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


### ENABLE HBO: pipelight for HBO in Firefox:
# http://ubuntuforums.org/showthread.php?t=2274467
# still needs adobe-flash when I tested it
sudo apt-get install adobe-flashplugin
sudo add-apt-repository ppa:pipelight/stable
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi
sudo pipelight-plugin --update
sudo pipelight-plugin --enable flash
#are these really needed for HBO ???  :
#  sudo pipelight-plugin --enable widevine   
#  sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --update
sudo pipelight-plugin --create-mozilla-plugins

### ENABLE NETFLIX:
# Only way to get Netflix is to install Chrome
#  Install from here and accept terms...
# http://www.google.com/chrome/browser/?platform=linux 



