echo "------ Installing plugins terminal..."

mkdir -p ~/.config/fish
cp ~/setup-ubuntu/scripts/customization/config.fish ~/.config/fish
chsh -s /usr/bin/fish

cp ~/setup-ubuntu/scripts/customization/.wezterm.lua ~/

sleep 3

echo "------ Configuration plugins in fish..."
fish ~/setup-ubuntu/scripts/customization/configure-fish.fish