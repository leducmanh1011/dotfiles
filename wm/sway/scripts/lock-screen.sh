#! /bin/sh

# Screenshoots
grim /tmp/_sway_lock_image.png

# Blurred lock screen
ffmpeg -i /tmp/_sway_lock_image.png -filter_complex 'gblur=sigma=50' /tmp/sway_lock_image.png -y

# Run swaylock
swaylock -f -i /tmp/sway_lock_image.png
