echo -e "${colors[green]}------------ Customization ------------"

echo "------ Create folders..."
mkdir ~/Projects
mkdir ~/.ssh
mkdir ~/Videos/OBS

echo "------ Download themes, cursor, wallpapers etc..."
BIBATA="https://api.github.com/repos/ful1e5/Bibata_Cursor/releases/latest"
DOWNLOAD_URL=$(curl -s $BIBATA | jq -r '.assets[] | select(.name | endswith(".tar.gz")).browser_download_url')
if [ -z "$DOWNLOAD_URL" ]; then
    echo "URL de download não encontrada."
    exit 1
fi
echo "Baixando $DOWNLOAD_URL..."
curl -L -o "Bibata.tar.gz" "$DOWNLOAD_URL"
mv Bibata-* ~/.icons/
echo "Download completo."

echo "------ Installing themes..."

echo "------ Installing themes..."
cd
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd ~/WhiteSur-gtk-theme && chmod +x install.sh && ./install.sh && ./tweaks.sh -F && sudo ./tweaks.sh -g

echo "------ Installing icons..."
cd ~/WhiteSur-icon-theme && chmod +x install.sh && ./install.sh -b

echo "------ Installing fonts..."
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd nerd-fonts && chmod +x install.sh && ./install.sh

echo "------ Configuration shell fish..."
CONFIG_FILE_FISH="$HOME/.config/fish/config.fish"
curl -sS https://starship.rs/install.sh | sh
mkdir -p "$(dirname "$CONFIG_FILE_FISH")"
touch "$CONFIG_FILE_FISH"

if ! grep -q 'starship init fish \| source' "$CONFIG_FILE_FISH"; then
    echo 'starship init fish | source' >> "$CONFIG_FILE_FISH"
    echo "Linha adicionada ao config.fish."
else
    echo "A linha já existe no config.fish."
fi

echo "------ Configuration node..."
CONFIG_FILE_ASDF="$HOME/.config/fish/config.fish"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

mkdir -p "$(dirname "$CONFIG_FILE_ASDF")"
touch "$CONFIG_FILE_ASDF"

add_line_if_not_exists() {
    local line=$1
    if ! grep -qF -- "$line" "$CONFIG_FILE_ASDF"; then
        echo "$line" >> "$CONFIG_FILE_ASDF"
        echo "Linha adicionada: $line"
    else
        echo "A linha já existe: $line"
    fi
}

add_line_if_not_exists 'starship init fish | source'
add_line_if_not_exists 'source ~/.asdf/asdf.fish'

COMPLETIONS_DIR="$HOME/.config/fish/completions"
mkdir -p "$COMPLETIONS_DIR"
ln -sf ~/.asdf/completions/asdf.fish "$COMPLETIONS_DIR/asdf.fish"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf nodejs update-nodebuild
asdf install nodejs latest
asdf install nodejs $(asdf nodejs resolve lts --latest-available)
asdf install nodejs 16.20.0
asdf global nodejs 16.20.0 && npm install --global yarn gatsby-cli gulp
asdf global nodejs latest && npm install --global yarn npm pnpm gatsby-cli gulp @shopify/cli @shopify/theme
asdf global nodejs $(asdf nodejs resolve lts --latest-available) && npm install --global yarn npm pnpm gatsby-cli gulp @shopify/cli @shopify/theme