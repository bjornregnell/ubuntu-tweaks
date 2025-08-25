# Guide for Ubuntu 24.04 to install printer using LU Papercut via Samba

1. Install printer settings:
  * In terminal: `sudo apt install system-config-printer`
  * Or use the graphical interface:
    - press the windows-button and type app center
    - search for `Printer Settings`
    - choose "Filter By" `Debian packages`
    - Install "Printer Setting"

2. Install samba client: 
  * In terminal: `sudo apt install smbclient` 

3. Set your lucat id as environment variable CUPS_USER
  * open `~/.bashrc` in a text editor 
  * add this line:  `export CUPS_USER=yourlucatid`

4. Restart your computer.

5. Encode special characters in your password with percentage codes
  * For explanation see:https://en.wikipedia.org/wiki/Percent-encoding
  * How to do this automatically:
    1. Install scala: `curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup`
    2. Start the Scala REPL: `scala`
    3. Paste this helper function: 
      ```scala
      def esc(s: String) = java.net.URLEncoder.encode(s, java.nio.charset.StandardCharsets.UTF_8.toString())
      ```
    4. Encode your password: `esc("mysecretpasswordwithspecialstuff!\"#@?/")`
    5. copy paste the secret escaped output (below called `yourescapedpassword`)

6. Add and configure a new LU Papercut printer:
  * press the window button and type "Printers" and open the app (not the setting)
  * press the "Add+" button
  * Enter the following in "Enter Device URI": `smb://uw/yourlicatid:yourescapedpassword@wpr764.uw.lu.se/LU-Papercut` where you replace  yourlicatid with your real Lucat ID and yourescapedpassword with the strange percentage-equiped string you get after encoding your password. Then click the "Forward" button. 
    - Don't forget the colon between your Lucat ID and your escaped password
    - Note: protect your password from being peeked over your shoulder...
  * Wait while "searching for drivers" 
  * In Choose Driver: "Select printer from database" and under "Makes" select the top most one called "Generic" the click the "Forward" button 
  * When asked for "Models" select "PDF" and Driver: "Generic PDF Printer [en] (Recommended)" and click the "Forward" button
  * Given an optional location e.g. "Papercut" and press apply



You should now be able to print using Papercut by selecting "Generic-PDF" as printer and then blip your LUCAT card at any LU papercut printer and press Release from the printer interface.