# MS Outlook and MS Teams as Progressive Web Apps

If you install MS Edge on Linux you can install Outlook as a PWA (progressive web app).

One of the easiest ways to install MS Edge on Ubuntu is to use deb-get from here (which can also help you easilly install a bunch of other stuff such as MS Teams, Discord, vs code, google chrome, zoom, and many more):

https://github.com/wimpysworld/deb-get

You then simply:
```
deb-get install microsoft-edge-stable

```

Inside edge you can install Outlook as a PWA on Ubuntu like so (it will turn up in your dash as a normal app icon after this):

https://support.microsoft.com/en-us/office/use-the-web-version-of-outlook-like-a-desktop-app-b360bd9a-00dc-43a4-bdf8-71cdeeb78e83

I still think Gnome Evolution is much better than Outlook though! You can see how to install and configure Gnome Evolution for Office365 with OAuth2 here: https://github.com/bjornregnell/ubuntu-tweaks/tree/master/evolution-email-client

You can use the Linux-version of MS Teams by:
```
deb-get install teams-for-linux
```
But that Electron-based build of MS Teams lacks some features of its windows counter part. TODO: I have not yet tried  if MS Teams as an Edge-base PWA provides more functionality than the linux version ...