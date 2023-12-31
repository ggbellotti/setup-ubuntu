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
)

echo -e "${colors[green]}------------ Install Utils ------------"
for pkg in "${utils[@]}"; do
    echo "------ Installing $pkg..."
    sudo apt install -y "$pkg"
done

declare -A extensions=(
  ["user-themes@gnome-shell-extensions.gcampax.github.com"]="user-themes%40gnome-shell-extensions.gcampax.github.com.v44.shell-extension.zip"
  ["dash-to-dock@michele_g.github.com"]="dash-to-dock%40michele_g.github.com.v69.shell-extension.zip"
  ["blur-my-shell@aunetx"]="blur-my-shell%40aunetx.v44.shell-extension.zip"
  ["drive-menu@gnome-shell-extensions.gcampax.github.com"]="drive-menu%40gnome-shell-extensions.gcampax.github.com.v44.shell-extension.zip"
  ["gsconnect@andyholmes.github.io"]="gsconnect%40andyholmes.github.io.v44.shell-extension.zip"
  ["openweather-extension@jenslody.de"]="openweather-extension%40jenslody.de.v44.shell-extension.zip"
  ["cast-to-tv@rafostar.github.com"]="cast-to-tv%40rafostar.github.com.v44.shell-extension.zip"
  ["topIcons@phocean.net"]="topIcons%40phocean.net.v44.shell-extension.zip"
  ["ds4-battery@amezin.github.com"]="ds4-battery%40amezin.github.com.v44.shell-extension.zip"
  ["center-area-horizontal-spacing@berend.de.schouwer.gmail.com"]="center-area-horizontal-spacing%40berend.de.schouwer.gmail.com.v44.shell-extension.zip"
)

base_url="https://extensions.gnome.org/extension-data/"

for uuid in "${!extensions[@]}"; do
  file=${extensions[$uuid]}
  echo "Instalando a extensão $uuid..."
  gnome-extensions install "$base_url$file" --force
  gnome-extensions enable "$uuid"
done

echo "Todas as extensões foram instaladas."