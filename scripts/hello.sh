echo -e "${colors[green]}"
cat << "EOF"
     _________
    / ======= \
   / __________\
  | ___________ |
  | | -       | |
  | |         | |
  | |_________| |______________________________________________
  \=____________/            Guilherme G. Bellotti            /
  / """"""""""" \        -> Setup for Ubuntu Desktop <-      /
 / ::::::::::::: \     -> Packages, Drivers, Games etc <-   /
(_________________)________________________________________/
EOF

gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.desktop.session idle-delay 0
