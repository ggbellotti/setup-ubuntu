apps=(
  ubuntu-restricted-extras
  fish
  exa
  bat
  compizconfig-settings-manager
  ffmpeg
  p7zip-full
  imagemagick
  alacarte
  neovim
  gnome-sushi
  wine64
  guvcview
  dconf-editor
  alacarte
  code
  gnome-shell-extensions
)

echo -e "${colors[green]}------------ Install Apps ------------"

for pkg in "${apps[@]}"; do
  echo "------ Installing $pkg..."
  sudo apt install -y "$pkg"
done

echo "------ All apps have been installed."