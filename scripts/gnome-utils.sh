utils=(
  network-manager-openconnect 
  network-manager-openconnect-gnome 
  network-manager-gnome 
  network-manager-vpnc 
  network-manager-vpnc-gnome 
  network-manager-openvpn 
  gnome-tweaks
  chrome-gnome-shell
  gnome-shell-extensions
  gnome-shell-pomodoro
  gnome-software-plugin-flatpak
  gnome-sushi
  folder-color
  gnome-shell-extension-prefs
)

echo -e "${colors[green]}------------ Install Utils ------------"
for pkg in "${utils[@]}"; do
    echo "------ Installing $pkg..."
    sudo apt install -y "$pkg"
done

source update-system.sh

echo "------ All utils have been installed."
