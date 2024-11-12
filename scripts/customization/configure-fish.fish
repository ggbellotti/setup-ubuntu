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