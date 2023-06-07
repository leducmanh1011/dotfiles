#!/bin/bash

current=$(ibus engine)

# Switch keyboard
if [ "$current" = "xkb:us::eng" ]
then
  echo "English (US)"
else
  echo "Vietnamese (Bamboo)"
fi
