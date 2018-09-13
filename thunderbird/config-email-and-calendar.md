# How to get email and calendar working with Exquilla and DavMail

## Email

### General tweaks of Thunderbird

* Open Thunderbird
   * If auto-config is triggered press the "Skip this ..." button and press "Cancel" in the configure email dialog
* Select little striped menu to the right and select Preverences and tick "Menu bar"

* Menu -> View -> Layout -> Vertical

* Add AddOn TT Deep Dark

* In addons manager click "Languages" to the right and search for "Svenska" in the search box and click install on "Svenska Language Pack" and "Swedish "


### Configure Exquilla email


  * Goto "add-ons" in the striped settings menu to the right. Select "Get Addons" and scroll down to the right and click "Browse more addons".

  * Search for Exquilla and "Add" the Addon and click "Restart".

  * Follow the instructions in the Exquilla tab:
    * Enter email address and password for Lucat
    * Click radio button "Login with username and domain" and enter in field "User name" `lucat-id@lu.se`
    * Click next
    * Click "Do autodiscover"; should yield "Success" after some seconds.

 * You should now have a lot of folders from your IMAP account

 * Allow Thunderbird to synch everything in your inbox -- this may an hour or more


### Configure Calendar

* Make sure Thunderbird has synched everything in previous step; may take ages...

* Get the AddOn Lightning by searching in the addon manager and click install

* Make sure java is installed:

* Installation of DavMail download latest deb, e.g. davmail_4.8.0.3-2488-1_all.deb
from here and install http://davmail.sourceforge.net/download.html
You should install it using gdebi to get all dependencies:

    sudo apt install gdebi

The run gdebi from dash menu and select davmail_4.8.0.3-2488-1_all.deb

* Install system indicator

    sudo apt-add-repository ppa:fixnix/indicator-systemtray-unity
    sudo apt-get update
    sudo apt-get install indicator-systemtray-unity


* Instructions for setup see below
  * run davmail in terminal
  * rightclick on the tray icon and select settings
  * In the Main tab:
    * In the OWA field: https://webmail.lu.se/owa/
    * Only tick CalDav and set http port to 10080
  * In the Advanced Tab: only tick these items
    * Display startup banner
    * IMAP auto expunge
    * Use Exange message size in IMAP
    * Enable KeepAlive
    * SMTP save in sent
    * Caldav auomatic scheduling ???
   * Click on the Save button

* In Thunderbird: rightclick in the calendar left field an choose "New calendar"
  * choose "On the network"
  * choose "Format" = "CalDav"
  * "Location" :
http://localhost:10080/users/bjorn.regnell@cs.lth.se/calendar
  * Tick "available offline"
  * Name: e.g. "work"
  * Email should be filled in
  * User name: lucat-id@lu.se
  * Tick "Use pw manager to keep this pw"
  * Click ok

* Make DavMail start on startup in Unity:
  * Open "Startup Applications" in the dash
  * Add Name "DavMail" Command "/usr/bin/davmail"   

* Make DavMail start on startup in i3:
  * put these lines in .config/i3/config:

    # start calendar DavMail Exchange CalDav server:
    exec --no-startup-id /usr/bin/davmail
