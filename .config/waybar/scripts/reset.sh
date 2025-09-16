#!/usr/bin/env bash

# Reload Waybar (no new instance)
pkill -SIGUSR2 waybar

# Reload swaync safely
if pgrep -x swaync >/dev/null; then
  pkill -SIGUSR1 swaync # or whatever signal triggers reload if supported
else
  swaync &
fi
