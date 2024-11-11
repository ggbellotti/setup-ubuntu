# Starship
curl -sS https://starship.rs/install.sh | sh
curl -fsSL https://bun.sh/install | bash

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Node
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf install nodejs 20.13.1
asdf global nodejs 20.13.1 && npm install --global yarn npm pnpm gatsby-cli gulp @shopify/cli @shopify/theme 
asdf global nodejs latest && npm install --global yarn npm pnpm gatsby-cli gulp @shopify/cli @shopify/theme

# Lazydocker
asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
asdf install lazydocker latest
asdf global lazydocker latest

sleep 3