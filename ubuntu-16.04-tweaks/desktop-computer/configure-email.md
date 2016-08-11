# Uninstall old thunderbird if any

# Download latest Thunderbird from here:
https://www.mozilla.org/en-US/thunderbird/all/
https://download.mozilla.org/?product=thunderbird-45.2.0-SSL&os=linux64&lang=en-US
cd ~/Downloads
sudo mv thunderbird /opt/thunderbird45en
sudo ln -s /opt/thunderbird45en/thunderbird /usr/bin/thunderbird

echo "[Desktop Entry]
Name=Thunderbird
Type=Application
Exec=/usr/bin/thunderbird
Terminal=false
Icon=/opt/thunderbird45en/chrome/icons/default/default256.png
Comment=Email Clienr
NoDisplay=false
Categories=Email
Name[en]=Thunderbird" > thunderbird.desktop
sudo mv thunderbird.desktop /usr/share/applications/.

# Install DavMail
http://cs.lth.se/index.php?id=91923
  http://davmail.sourceforge.net/index.html
  https://sourceforge.net/projects/davmail/files/latest/download?source=files
  http://davmail.sourceforge.net/linuxsetup.html

Install davmail dep using using GDebi as Ubuntu SW Center does not install debs after download as below
  
## Optional: http://www.webupd8.org/2015/05/on-demand-system-tray-for-ubuntu.html
You may want to install this indicator or else it is only possible to configure davmail on its first run (but that is often enough to do once):
    sudo apt-add-repository ppa:fixnix/indicator-systemtray-unity
    sudo apt-get update
    sudo apt-get install indicator-systemtray-unity
   
    Uninstall: sudo apt-get purge indicator-systemtray-unity
-- END OPTIONAL

It may work to put this file in your home dir:
https://github.com/bjornregnell/ubuntu-tweaks/raw/master/ubuntu-16.04-tweaks/desktop-computer/.davmail.properties

Or use the davmail GUI and enter these settings:
DavMail, Main: (you can leave the other tabs as is)
  Exchange Protocol: EWS
  OWA (Exchange) URL: https://webmail.lu.se/owa/
  Local POP port: none
  Local IMAP port: 10143
  Local SMTP port: 10025
  Caldav HTTP port: 10080
  Local LDAP port: 10389

# Then Configure Thunderbird

Thunderbird, ”Server Settings”:

  Server Type: IMAP Mail Server
  Server Name: localhost
  Port: 10143
  User Name: lucat-id
  Connection Security: None
  Authentication method: Password, transmitted insecurely

  Outgoing Server (SMTP):
  Server Name: localhost
  Port: 10025
  Connection Security: None
  Authentication method: Password, transmitted insecurely
  User Name: lucat-id

## Tweak Thunderbird settings and GUI



## Fix calendar connection

* Download if not already bundled the lightning add-on

* Create new calendar:
  * Format: CalDav
  * 
  * Location: http://localhost:10080/users/bjorn.regnell@cs.lth.se/calendar
  * 
