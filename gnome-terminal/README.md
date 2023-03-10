## HOW TO BACKUP PROFILES

### Export config

`dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf`

### Import config

`dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf`

### Reset config

`dconf reset -f /org/gnome/terminal/`

