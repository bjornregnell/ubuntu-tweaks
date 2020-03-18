# Evolution email client

`sudo apt update && sudo apt install evolution evolution-ews`

## Installation wizard

Server Type: Exchange Web Services
User Name: tts-bre
Host URL: https://webmail.lu.se/EWS/Exchange.asmx

Then press "Fetch URL"
Fetched URL filled in the OAB URL field:
https://webmail.lu.se/OAB/71176bb8-e245-4d8e-829b-56753533707f/oab.xml
Authentication, check for supprted type: NTLM

## List of important shortcuts after mod (se next section)

* `Alt-c ` focus search field, then enter to filter
* `j ` mark as junk
* `m ` mark as read
* `u ` mark as unread
* `1 ` mark as important

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

My mods:
```
(gtk_accel_path "<Actions>/mail/mail-mark-junk" "j")
(gtk_accel_path "<Actions>/mail/mail-mark-important" "1")
(gtk_accel_path "<Actions>/mail/mail-mark-read" "m")
(gtk_accel_path "<Actions>/mail/mail-mark-unread" "u")
```

