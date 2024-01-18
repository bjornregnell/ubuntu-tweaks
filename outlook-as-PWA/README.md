# MS Outlook and MS Teams on Linux/Ubuntu

If you install MS Edge on Linux you can install Outlook as a PWA (progressive web app).

One of the easiest ways to install MS Edge on Ubuntu is to use deb-get from here (which can also help you easilly install a bunch of other useful things such as Discord, Spotify, VS Code, Google Chrome, Zoom, and many more apps not in the official Ubuntu repos):

https://github.com/wimpysworld/deb-get

You then simply:
```
deb-get install microsoft-edge-stable

```

## Install MS Outlook as PWA

Inside edge you can install Outlook as a PWA on Ubuntu like so (it will turn up in your dash as a normal app icon after this):

1. In Microsoft Edge, sign in to your Outlook on the web or Outlook.com account.

2. Select Settings and more Settings and more at the top of the window.

3. Select Apps > Install this site as an app.

More information here: https://support.microsoft.com/en-us/office/use-the-web-version-of-outlook-like-a-desktop-app-b360bd9a-00dc-43a4-bdf8-71cdeeb78e83

I think **Gnome Evolution** is a much better Email client than Outlook, especially it's compact layout of your inbox and nicer shortcuts! You can see how to install and configure Gnome Evolution for Office365 with OAuth2 here: https://github.com/bjornregnell/ubuntu-tweaks/tree/master/evolution-email-client

## Install MS Teams for Linux based on Electron

You can use the Linux-version of MS Teams by:
```
deb-get install teams-for-linux
```
But that Electron-based build of MS Teams lacks some features of its windows counter part. 

## Install MS Teams as PWA

TODO: I have not yet tried  if MS Teams as an Edge-base PWA provides more functionality than the linux version ...