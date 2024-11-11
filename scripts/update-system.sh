echo -e "${colors[green]}------------ Update System ------------"

sudo apt-get check
sudo apt update
sudo apt list --upgradable
sudo apt upgrade -y
sudo apt autoremove -y