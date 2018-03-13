
# How to auto-switch active screens when docking laptop using autorandr and poll-xrandr

* `autorandr` is a bash script for saving monitor setup and then change to those setups. It uses `xrandr`.

* `poll-xrandr` is a bash script that polls xrandr and runs `autorandr --change --force` if undocked

The old version is unmaintained; the new version (a rewrite in python) is here: https://github.com/phillipberndt/autorandr/

Deb is here: https://packages.debian.org/sid/all/autorandr/download

Install with

    dpkg -i [file]

Setup autorandr with stored screen layouts

    autorandr --save [docked|mobile|home|etc]

This line is active in my .config/i3/config

    # script to monitor undocking:
    exec --no-startup-id /usr/bin/poll-xrandr

And below is the tweaked contents of my `/usr/bin/poll-xrandr` where I removed the if-check on running process as it did not work:


    #!/bin/bash

    # Help
    if [ -n "$1" ] && [[ $1 == "--help" ||  $1 == "-h" ]]; then
      case $1 in
        -h|--help)
            echo "Usage:
      poll-xrandr COMMAND [OPTIONS]

    Help Options:
      -h, --help      Show this help

    COMMAND is required and is a command to be executed on any detected change to xrandr displays.

    Application Options:
      -i, --interval     The interval for polling, defaults to 4 seconds (-i=4)
    "     ;;
        *)
          poll-xrandr --help
          ;;
      esac
      exit
    fi

    #if [ -z "$(pgrep poll-xrandr)" ]; then
      i=4 # default interval for polling.

      connected="$(xrandr -q | grep " connected"|cut -d ' ' -f1|xargs)"

      # Endless loop
      while : ; do
        # Re-read the status
        #new_cat="`cat $f`"
        connected_recheck="$(xrandr -q | grep " connected"|cut -d ' ' -f1|xargs)"

        # If original contents don't match new we need to run command.
        if [ "$connected" != "$connected_recheck" ]; then
          # Set the original contents the same as new to avoid unnecessarily repeating
          connected=$connected_recheck
          autorandr --change --force
        fi

        shift 1
        while [[ $# > 0 ]]; do
          key=$1

          case $key in
            -i=*|--interval=*)
              i="${key#*=}"
              ;;
            *)
              echo "Unknown option provided, you should fix that."
              ;;
          esac
          shift
        done

        sleep $i
      done

    #else
    #  echo "poll-xrandr is already running: aborting..."



## OLD Instructions by nalipaz

The maintained version is described above.

The OLD, unmaintained version: https://github.com/nalipaz/autorandr/

https://unix.stackexchange.com/questions/4489/a-tool-for-automatically-applying-randr-configuration-when-external-display-is-p/22462#22462
