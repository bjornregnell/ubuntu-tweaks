# Enable SSH 

https://ubuntuhandbook.org/index.php/2022/04/enable-ssh-ubuntu-22-04/

```bash
sudo apt update && sudo apt install ssh

sudo systemctl enable sshd && sudo systemctl start sshd

systemctl status sshd.service

sudo nano /etc/ssh/sshd_config
```

Settings in `/etc/ssh/sshd_config`

# install and start fail2ban

https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-22-04

```bash
sudo apt update
sudo apt install fail2ban

systemctl status fail2ban.service

head -20 /etc/fail2ban/jail.conf
cd /etc/fail2ban
sudo cp jail.conf jail.local
sudo nano jail.local

sudo systemctl enable fail2ban

sudo systemctl start fail2ban

sudo systemctl status fail2ban
```