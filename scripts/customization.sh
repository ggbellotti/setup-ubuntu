ICON_THEME="WhiteSur"
CURSOR_THEME="MacOSBigSur"
WALLPAPER_PATH="~/setup-ubuntu/scripts/customization/wallpaper-4k-naut-icon.png"

install_theme() {
  local REPO_URL=$1
  local THEME_NAME=$2
  local INSTALL_OPTIONS=$3

  local THEME_DIR="$HOME/.icons/$THEME_NAME"

  echo "Clonando o repositório $THEME_NAME..."
  git clone --depth=1 "$REPO_URL" "$THEME_DIR"

  echo "Instalando $THEME_NAME..."
  cd "$THEME_DIR" || exit
  chmod +x install.sh
  ./install.sh $INSTALL_OPTIONS

  echo "Atualizando o cache de ícones para $THEME_NAME..."
  gtk-update-icon-cache "$THEME_DIR"
  echo "Instalação de $THEME_NAME concluída!"
}

echo -e "${colors[green]}------------ Customization ------------"

source ~/setup-ubuntu/scripts/update-system.sh

echo "------ Create folders and copy files..."
mkdir ~/Videos/OBS
mkdir ~/www
cp ~/setup-ubuntu/scripts/customization/config ~/.ssh/
cp ~/setup-ubuntu/scripts/customization/.gitconfig ~/

echo "------ Generate SSH..."
ssh-keygen -t rsa -C "guibellotti@hotmail.com" -f ~/.ssh/guilhermebellotti -N ""

echo "------ Download themes, cursor, wallpapers etc..."

# WhiteSur icons
install_theme "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "WhiteSur-icon-theme" "-b"

# Apple cursor
install_theme "https://github.com/ful1e5/apple_cursor.git" "apple_cursor"

# Configs gnome
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.8
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false

if [ -f "$WALLPAPER_PATH" ]; then
    echo "Configurando o wallpaper para $WALLPAPER_PATH..."
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_PATH"
    gsettings set org.gnome.desktop.background picture-options 'zoom'
    echo "Wallpaper configurado com sucesso!"
else
    echo "Arquivo de wallpaper não encontrado em $WALLPAPER_PATH. Verifique o caminho e tente novamente."
fi

echo "------ Installing fonts..."
source ~/setup-ubuntu/scripts/customization/fonts.sh

echo "------ Configuration shell..."
source ~/setup-ubuntu/scripts/customization/shell.sh