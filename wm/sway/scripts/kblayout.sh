#!/bin/bash

current=$(ibus engine)
next=""

# Switch keyboard
if [ "$current" = "xkb:us::eng" ]
then
  ibus engine Bamboo
  next="Vietnamese (Bamboo)"
else
  ibus engine xkb:us::eng
  next="English (US)"
fi


# Signal waybar to update
pkill -RTMIN+15 waybar

notify-send "Switch to $next"
