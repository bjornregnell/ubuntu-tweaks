# Install MS Teams



## deb-get

TODO check how to `deb-get install teams-for???` 

## as pwa

TODO using Edge


## ppa + deb

For 18.04 and onwards:

Instructions below based on https://itsubuntu.com/how-to-install-microsoft-teams-on-ubuntu/ last visited 2023-03-06


```
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

sudo apt update
sudo apt install teams
```


