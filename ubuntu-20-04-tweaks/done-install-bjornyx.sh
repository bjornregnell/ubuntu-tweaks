sudo apt install fonts-firacode
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install exfat-fuse exfat-utils
sudo apt install ubuntu-restricted-extras
sudo apt install curl

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

# install gdebi to install deb packages with dependencies
sudo apt install gdebi

# apps better installed via snaps to get latest version
sudo snap install tree spotify

