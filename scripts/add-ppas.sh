echo -e "${colors[green]}------------ Add PPAs and keys ------------"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null

sudo add-apt-repository ppa:obsproject/obs-studio
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:pj-assis/testing
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:fish-shell/release-3
sudo add-apt-repository multiverse

source scripts/update-system.sh