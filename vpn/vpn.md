## To access LU VPN on newer systems 16.04 and beyond
* Install FortiClient by following steps here: https://www.forticlient.com/repoinfo
* Start the FortiClient app and:
  * Click on "Remote access" and make sure "SSL-VPN" is selected 
  * Remote gateway: vpn.lu.se
  * The port should be: 443
  * Do not click on SSO
  * Click save
  * When you click "Remote access" you should now be able to enter your credentials. Use LucatID (example: ldc-abc without @lu.se)
  
Lösenord: LucatLösenord eller StudentLösenord  
## To access cs network: On Ubuntu 18.04 and older
* Install Shrew Soft VPN Client with `sudo apt install ike`
* Import settings file `cs-connect.vpn` in this dir using "Import" within shrew
* Open and login with lucat id
