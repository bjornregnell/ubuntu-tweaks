## Location of settings in Ubuntu 20.04

`/etc/NetworkManager/system-connections`

The files are owned by root. Save a copy before editing with e.g. `sudo nano`

`[gsm]`

The apn= for Tele2 is: `mobileinternet.tele2.se`

The number= för Tele2 is: `*99#`

## Make a copy 

```bash
cd ~/git/hub/bjornregnell/ubuntu-tweaks/

sudo cp /etc/NetworkManager/system-connections/Tele2\ Mobilt\ Bredband.nmconnection mobile-broadband/.

sudo chown -R bjornr: mobile-broadband
```