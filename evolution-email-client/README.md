# Evolution email client

Apt install does not work on ubuntu 20.04 as it installs an old version that does not work with EWS and gives this strange error: 

`Error performing TLS handshake: The Diffie-Hellman prime sent by the server is not acceptable (not long enough)`

*DOES NOT WORK: sudo apt update && sudo apt install evolution evolution-ews*

## Install flatpak version 

Install flatpak and flathub, see  https://www.omgubuntu.co.uk/2019/02/how-to-install-flatpak-on-ubuntu-flathub
```
sudo add-apt-repository ppa:alexlarsson/flatpak

sudo apt update && sudo apt install flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo apt install gnome-software-plugin-flatpak

flatpak install flathub org.gnome.Evolution
```


USE FLATPAK VERSION and bootstrap from backup as described above or if it is the first time, use the wizard.

# Bootstrap form existing install

To bootstrap using another machine where you already have Evolution:
   * File -> Back up Evolution Data
Save file somewhere and transfer to this machine and use "Restore from backup in the wizard" or do:
   * File -> Restore Evolution Data
If it is the first time use below wizard guide



## Installation wizard

In the identity step enter name, email, and org.

![Wizard1](wizard1-identity.png)

In the "Receiving Email" step enter:

* Server Type: Exchange Web Services
* User Name: your lucat id without @lu.se
* Host URL: https://webmail.lu.se/EWS/Exchange.asmx
* Authentication, check for supported type: NTLM

Then press "Fetch URL".
The fetched URL is filled into the OAB URL field similar to 
https://webmail.lu.se/OAB/longhashnumberhere/oab.xml

![Wizard2a](wizard2a-receiving-email-before-fetch-url.png)

After pressing "Fetch URL":

![Wizard2b](wizard2b-receiving-email-after-fetch-url.png)

This is my settings in the Receiving Options:

![Wizard3](wizard3-receiving-options.png)

This is how my Account Summary looks:

![Wizard4](wizard4-account-summary.png)



## List of important shortcuts after mod (se next section)

* `Alt-c ` focus search field, then enter to filter
* `Ctrl-j ` mark as junk
* `Ctrl-k ` mark as read
* `Ctrl-u ` mark as unread
* `1 ` mark as important
* `0 ` mark as important

https://defkey.com/evolution-linux-shortcuts

## Mod shortcuts

```
cp  ~/.config/evolution/accels ~/git/hub/bjornregnell/ubuntu-tweaks/evolution-email-client/.
```

https://askubuntu.com/questions/1125058/how-to-change-evolutions-keyboard-shortcuts

1. Make sure that Evolution is not running.

2. Open the file ~/.config/evolution/accels with a text editor

3. Find the line for the command you want to edit, for example Reply to All which looks like:
; (gtk_accel_path "<Actions>/mail/mail-reply-all" "<Primary><Shift>r").

4. Here the spaces are only for indentation, but the semicolon at the beginning of the line comments-out the line.

5. Remove the semicolon and make your change so that line might look now like, for example: 
```
(gtk_accel_path "<Actions>/mail/mail-reply-all" "<Super>r")
```

6. Make sure you save, and then close the file in your text editor.

7. Now, re-open Evolution and you should see that the keyboard shortcut for Message->Reply to All has changed.

My mods are in the [accels](accels)

