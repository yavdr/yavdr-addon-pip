
There are two systemd units for the user session which inherit the `DISPLAY` variable for the first resp. the second display. `vdr-pip@.service` allows to start a pip-vdr on the primary display, `vdr-pip-2nd-display@.service` starts a pip-vdr on the secondary display.

To allow for different window positions the name of script which moves the windows to the target positions can be specified by the instance value. The scripts are located in */etc/vdr-pip/scripts/*.

Each script should provide means to handle three actions which are passed as first argument to it:
 - pre_start :: collect information and prepare configuration before the pip vdr is started
 - post_start :: collect information and move windows after the pip vdr has been started
 - post_stop :: clean up after the pip vdr has been stopped
  Functions from `/etc/vdr-pip/scripts/pip-common` can be used to handle the most common cases.

See `/etc/vdr-pip/scripts/default` for an example.

## Starting VDR-PIP

Within the systemd user session a vdr-pip instance can be started with

```shell
systemctl --user start vdr-pip@default.service # primary display, small pip window
systemctl --user start vdr-pip-2nd-display@fullscreen.service # secondary display, fullscreen window
```

The script `/etc/vdr-pip/scripts/pipswap` can be used to exchange the currently tuned channel of the main vdr and the pip vdr.

A script toggle_pip can be used within vdr's commands.conf or menuorg to easily toggle the pip vdr:
```shell
# !/bin/bash

if [ -z "$1" ] || systemctl --user -q is-active 'vdr-pip@*' 'vdr-pip-2nd-display@*'; then

systemctl --user --no-block stop 'vdr-pip@*' 'vdr-pip-2nd-display@*'

elif [ -n "$1" ]; then

systemctl --user --no-block start "$1"

fi
```

## Customization

You can edit or add new pip scripts to `/etc/vdr-addon-pip/scripts/`.
