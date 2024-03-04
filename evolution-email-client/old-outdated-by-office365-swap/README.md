## DEPRECATED: Old settings for authentication NTLM

Before we switched to OAuth2 athentication and Office365 these were the old settings but it **DOES NOT work** anymore at Lund University:

### Wizard dialogs

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

### Bad settings for Office365

I got these settings partly to work but they were wrong as they did not use the correct userid and did not use the right "Advanced Settings". See correct settings [here]().

![identity](identity.png)
![receiving-email](receiving-email.png)
![receiving-options](receiving-options.png)

