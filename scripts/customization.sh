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

# Instalar WhiteSur icons
install_theme "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "WhiteSur-icon-theme" "-b"

# Instalar Apple cursor
install_theme "https://github.com/ful1e5/apple_cursor.git" "apple_cursor"

echo "------ Installing fonts..."
source ~/setup-ubuntu/scripts/customization/fonts.sh

echo "------ Configuration shell..."
source ~/setup-ubuntu/scripts/customization/shell.sh