fonts=("Hack" "FiraCode" "RobotoMono", "FiraMono", "Meslo", "JetBrainsMono")
font_dir="$HOME/.local/share/fonts/NerdFonts"

mkdir -p "$font_dir"

install_font() {
  local font_name="$1"
  echo "Install font $font_name..."


  url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font_name}.zip"


  wget -q "$url" -O "/tmp/${font_name}.zip"
  unzip -o "/tmp/${font_name}.zip" -d "$font_dir"


  rm "/tmp/${font_name}.zip"
}

for font in "${fonts[@]}"; do
    install_font "$font"
done

echo "------ Installing cache fonts..."
fc-cache -fv

echo "------ All fonts have been installed."
