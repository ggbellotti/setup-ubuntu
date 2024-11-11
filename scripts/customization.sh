echo -e "${colors[green]}------------ Customization ------------"

source update-system.sh

echo "------ Create folders and copy files..."
mkdir ~/Videos/OBS
mkdir ~/www
cp ~/setup-ubuntu/scripts/customization/config ~/.ssh/
cp ~/setup-ubuntu/scripts/customization/.gitconfig ~/

echo "------ Generate SSH..."
ssh-keygen -t rsa -C "guibellotti@hotmail.com" -f ~/.ssh/guilhermebellotti -N ""

echo "------ Download themes, cursor, wallpapers etc..."
BIBATA="https://api.github.com/repos/ful1e5/Bibata_Cursor/releases/latest"
DOWNLOAD_URL=$(curl -s $BIBATA | jq -r '.assets[] | select(.name | endswith(".tar.xz")).browser_download_url')
if [ -z "$DOWNLOAD_URL" ]; then
    echo "URL de download não encontrada."
    exit 1
fi
echo "Baixando $DOWNLOAD_URL..."
curl -L -o "Bibata.tar.gz" "$DOWNLOAD_URL"
mv Bibata-* ~/.icons/
echo "Download completo."

echo "------ Installing themes..."
cd
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd ~/WhiteSur-gtk-theme && chmod +x install.sh && ./install.sh && ./tweaks.sh -F && sudo ./tweaks.sh -g

echo "------ Installing icons..."
cd ~/WhiteSur-icon-theme && chmod +x install.sh && ./install.sh -b

echo "------ Installing fonts..."
source customization/fonts.sh

echo "------ Configuration shell..."
source customization/shell.sh