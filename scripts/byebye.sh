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
  / """"""""""" \            -> Setup successful <-          /
 / ::::::::::::: \           -> REBOOTING SYSTEM <-         /
(_________________)________________________________________/
EOF

gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
gsettings set org.gnome.desktop.session idle-delay 300
