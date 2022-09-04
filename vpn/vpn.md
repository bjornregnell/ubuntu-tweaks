## How to access LU VPN on Linux/Debian Ubuntu from 18.04 and beyond

This guide is for students and employees at Lund University who want to access the internal university network securely via our Virtual Private Network. This is done via a special app called FortiClient VPN.

**NOTE:** When you access the internet via LU VPN your traffic is monitored and you should only use it for school and work at LU and **not for private traffic**. For example, the IT Security Dept at LU LDC will not be pleased if you run torrent downloads or other heavy private traffic through the LU network.

* Install **FortiClient VPN** (there are a lot of products from Forticlient but you need the one called exactly just that to not get alot of stuff you dont want) by downloading this deb  https://links.fortinet.com/forticlient/deb/vpnagent also available here also including rpm, Windows etc: https://www.fortinet.com/support/product-downloads#vpn 
(for old Ubuntu < 18.04 see here https://www.forticlient.com/repoinfo  )

* Install the deb with `sudo apt install ./nameofdebyousavedhere.deb`

* Start the FortiClient app and:
  * Accept the terms and conditions
  * Click on "Configure VPN" and make sure "SSL-VPN" is selected 
  * Remote gateway: vpn.lu.se
  * The port should be: 443
  * Do **NOT** click on SSO
  * If you want you can give an optional name and description in "Connection name" (e.g. `LU VPN`) and "Description" (e.g. left blank).
  * Click Save
  * When you click "Remote access" you should now be able to enter your credentials. If you are a student or employee at LU then use your LucatID (example: ldc-abc without @lu.se)
  * You can test that your VPN-connection is working by opening this link in your web browser: [http://www.ddg.lth.se/cgi-bin/showip](http://www.ddg.lth.se/cgi-bin/showip) and the text shown on the first line should start with 130.235 if you are connected via the LU domain.
  

## To access cs network (`deprecated`): On Ubuntu 18.04 and older
* Note that ike is now dead; this is for old systems:
* Install Shrew Soft VPN Client with `sudo apt install ike`
* Import settings file `cs-connect.vpn` in this dir using "Import" within shrew
* Open and login with lucat id
