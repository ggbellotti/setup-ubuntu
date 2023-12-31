flatpakRepos=(
  com.belmoussaoui.Obfuscate
  com.bitwarden.desktop
  com.github.fabiocolacio.marker
  com.github.micahflee.torbrowser-launcher
  com.github.tchx84.Flatseal
  com.github.unrud.VideoDownloader
  com.google.AndroidStudio
  com.ktechpit.ultimate-media-downloader
  com.ktechpit.whatsie
  com.mattjakeman.ExtensionManager
  com.microsoft.Edge
  com.obsproject.Studio
  com.snes9x.Snes9x
  com.unity.UnityHub
  com.usebottles.bottles
  fr.handbrake.ghb
  io.github.Figma_Linux.figma_linux
  md.obsidian.Obsidian
  net.pcsx2.PCSX2
  net.rpcs3.RPCS3
  nl.hjdskes.gcolor3
  org.audacityteam.Audacity
  org.citra_emu.citra
  org.darktable.Darktable
  org.flozz.yoga-image-optimizer
  org.gimp.GIMP
  org.gnome.Boxes
  org.gnome.Geary
  org.gustavoperedo.FontDownloader
  org.inkscape.Inkscape
  org.libretro.RetroArch
  org.ryujinx.Ryujinx
  org.videolan.VLC
  org.yuzu_emu.yuzu
  rest.insomnia.Insomnia
)

snapRepos=(
  android-studio
  bluemail
  code
  dbeaver-ce
  discord
  drawio
  emote
  ferdi
  libreoffice
  postman
  slack
  spotify
  telegram-desktop
  whatsie
  zoom-client
)

# Check if the ppa of the packages below have been added
softwaresIndependent=(
  obs-studio
  steam
  httpie
  neovim
  openrazer-meta

  docker-ce
  docker-ce-cli
  containerd.io
  docker-compose-plugin
  docker-compose
  nala
)

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo gpasswd -a $USER docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo service docker start

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${colors[green]}------------ Install Softwares ------------"

for pkg in "${flatpakRepos[@]}"; do
  echo "------ Installing $pkg..."
  flatpak install flathub -y "$pkg"
done

for pkg in "${snapRepos[@]}"; do
  echo "------ Installing $pkg..."
  sudo snap install "$pkg"
done

echo "------ All softwares have been installed."