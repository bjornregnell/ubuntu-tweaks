# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#------ BEGIN GIT PROMT
#http://stackoverflow.com/questions/9717137/displaying-git-branch-name-in-prompt-does-not-work-in-screen
source /etc/bash_completion.d/git-prompt #(for Ubuntu 13.04 and higher)
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCONFLICTSTATE=yes

#PS1=$PS1'$(__git_ps1 "(%s) ")'

#https://help.ubuntu.com/community/CustomizingBashPrompt
NORM="\[\e[0m\]"
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
  #---- replace below
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n$(__git_ps1 "\[\033[0;31m\](%s) \[\e[0m\]")\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
#-------- END GIT PROMPT

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

### BEGIN some nice extra aliases
alias ls='ls --color=auto'
alias lh='ls -ACdF .*'
alias cal='ncal -Mbwy'

alias sbtn=sbtn-x86_64-pc-linux
alias g='echo -e "git fetch && git status\n" && git fetch && git status && echo -e "\ngit --summary\n" && git show --summary'
alias p='echo -e "git pull && git push\n" && git pull && git push'
alias c='code .'
alias o='xdg-open'
alias s=scala-cli 

### END some nice extra aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# alias for texworks
function tw() { texworks -stylesheet /home/bjornr/.TeXworks/configuration/mystyle.css "$@" & }

# aliases for git
function gf() { echo git fetch "$@"; git fetch "$@"; }
function gis() { echo git status "$@"; git status "$@"; }
function gil() { echo git log "$@"; git log "$@"; }
function gia() { echo git add "$@"; git add "$@"; }
function gidi() { echo git diff "$@"; git diff "$@"; }
function gic() { echo git commit -m "$@"; git commit -m "$@"; }
function gica() { echo git commit -am "$@"; git commit -am "$@"; }
function gipp() { echo git pull; git pull; echo git push "$@"; git push "$@"; }

# aliases for restart and sleep
function reboot() {
  read -p "pm-reboot? Type y<ENTER> to continue: " CONT;
  if [ "$CONT" = "y" ]; then
    xvkbd -window Firefox -text "\Cq" && sudo reboot;
  else
    echo "Abort.";
  fi
}
function z() {
  read -p "pm-suspend-hybrid? Type y<ENTER> to continue: " CONT;
  if [ "$CONT" = "y" ]; then
    xvkbd -window Firefox -text "\Cq" && sudo pm-suspend-hybrid;
  else
    echo "Abort.";
  fi
}
export LUCATID=IfYouAreEmployedAtLUGiveYourLucatIDHere

my-ip() {
  echo $(curl -s https://bot.whatismyipaddress.com); 
}

# Set the title string at the top of your current terminal window or terminal window tab
set-title() {
    # If the length of string stored in variable `PS1_BAK` is zero...
    # - See `man test` to know that `-z` means "the length of STRING is zero"
    if [[ -z "$PS1_BAK" ]]; then
        # Back up your current Bash Prompt String 1 (`PS1`) into a global backup variable `PS1_BAK`
        PS1_BAK=$PS1 
    fi

    # Set the title escape sequence string with this format: `\[\e]2;new title\a\]`
    # - See: https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Customizing_the_terminal_window_title
    TITLE="\[\e]2;$@\a\]"
    # Now append the escaped title string to the end of your original `PS1` string (`PS1_BAK`), and set your
    # new `PS1` string to this new value
    PS1=${PS1_BAK}${TITLE}
}
