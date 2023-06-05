#! /bin/bash

# Screenshoots
# grim /tmp/_sway_lock_image.png

# Blurred lock screen
# ffmpeg -i /tmp/_sway_lock_image.png -filter_complex 'gblur=sigma=50' /tmp/sway_lock_image.png -y

# Run swaylock
# swaylock -f -i /tmp/sway_lock_image.png

# Improve display per-output
# Dependencies:
# --------
# swaylock
#---------
# grim
# --------
# ffmpeg
# or
# corrupter (https://github.com/r00tman/corrupter)
# imagemagick
# --------
IMAGE=/tmp/_sway_lock_image.png
LOCKARGS=""
ICON=$HOME/.config/swaylock/icons/linux.png

for OUTPUT in `swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | .name'`
do
    IMAGE=/tmp/$OUTPUT-sway-lock.png
    LOCK_IMAGE=$IMAGE-blur.png

    grim -o $OUTPUT $IMAGE

    # Only blur
    # ffmpeg -i $IMAGE -filter_complex 'gblur=sigma=20' $LOCK_IMAGE -y
    # Blur image and over lay icon center
    ffmpeg -i $IMAGE -vf \
      "[in] gblur=sigma=20  [blurred]; movie=$ICON [logo];
      [blurred][logo] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [out]" \
      $LOCK_IMAGE

    LOCKARGS="${LOCKARGS} --image ${OUTPUT}:${LOCK_IMAGE}"
    IMAGES="${IMAGES} ${IMAGE} ${LOCK_IMAGE}"
done

swaylock $LOCKARGS
rm $IMAGE
