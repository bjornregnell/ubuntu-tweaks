## To access LU VPN on newer systems 16.04 and beyond
* Install FortiClient VPN (there are a lot of products from forticlient but you need the one called just that to not get alot of stuff you dont want) by downloading this deb  https://links.fortinet.com/forticlient/deb/vpnagent also available here also including rpm, Windows etc: https://www.fortinet.com/support/product-downloads#vpn 
(for old Ubuntu <= 18.05 see here https://www.forticlient.com/repoinfo  )
* Start the FortiClient app and:
  * Click on "Remote access" and make sure "SSL-VPN" is selected 
  * Remote gateway: vpn.lu.se
  * The port should be: 443
  * Do not click on SSO
  * Click save
  * When you click "Remote access" you should now be able to enter your credentials. Use LucatID (example: ldc-abc without @lu.se)
  
## To access cs network: On Ubuntu 18.04 and older
* Install Shrew Soft VPN Client with `sudo apt install ike`
* Import settings file `cs-connect.vpn` in this dir using "Import" within shrew
* Open and login with lucat id
