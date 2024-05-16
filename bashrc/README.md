# My tweaks to .bashrc  

The hidden file .bashrc here includes init stuff for bash terminal sessions:

https://github.com/bjornregnell/ubuntu-tweaks/blob/master/bashrc/.bashrc

In particular it includes:

* nicer prompt

* nice coloring in git repos

* some handy aliases/functions

**Read all comments carefully**

My config of prompt on 18.04 (old background behavior):
```bash
  #---- replace below
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n$(__git_ps1 "\[\033[0;31m\](%s) \[\e[0m\]")\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
#-------- END GIT PROMPT

```
My config of prompt on 22.04 and after (new background behavior):
```bash
  #---- replace below
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[42m\]\[\033[30m\]\h\[\033[00m\]  \[\033[01;34m\]\w\[\033[00m\]\n$(__git_ps1 "\[\033[0;31m\](%s) \[\e[0m\]")\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
#-------- END GIT PROMPT

```

