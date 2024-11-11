apps=(
  # Apps/softwares
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
  wezterm
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
  fzf
  virt-manager

  # Tools
  imwheel
  meson
  libnss3-tools
  libaio1
  libncurses5
  libevince-dev
  gir1.2-gstreamer-1.0
  librust-gstreamer-audio-sys-dev
  librust-gstreamer-audio-sys-dev
  libgtksourceview-4-dev
  libmusicbrainz5-dev
  libwebkit2gtk-4.0-dev
  libgirepository1.0-dev
  ninja-build
  git-all
  dirmngr
  gpg
  gawk
  ca-certificates
  gnupg
  lsb-release
  fakeroot
  flatpak
  dconf-cli
  make
  g++
  cargo
  pip
  libdvd-pkg
  mono-devel
  libqt5svg5
  qml-module-qtquick-controls
  libdaemon-dev
  libglade2-dev
  libgtk2.0-dev
  apt-transport-https
  sassc
  libglib2.0-dev-bin
  imagemagick
  dialog 
  optipng 
  ffmpeg
  libayatana-appindicator3-1
  gir1.2-ayatanaappindicator3-0.1
  gnome-shell-extension-appindicator
)

snapRepos=(
  android-studio
  bluemail
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
  vlc
  audacity
)

flatpakRepos=(
  com.belmoussaoui.Obfuscate
  com.bitwarden.desktop
  com.github.fabiocolacio.marker
  com.github.micahflee.torbrowser-launcher
  com.github.tchx84.Flatseal
  com.github.unrud.VideoDownloader
  com.google.AndroidStudio
  com.ktechpit.ultimate-media-downloader
  com.mattjakeman.ExtensionManager
  com.microsoft.Edge
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
  com.github.wwmm.easyeffects
  com.protonvpn.www
  me.proton.Mail
  me.proton.Pass
  net.codeindustry.MasterPDFEditor
  com.github.marktext.marktext
  net.xmind.XMind8
  com.google.Chrome
  com.github.Matoking.protontricks
  com.heroicgameslauncher.hgl
  org.qbittorrent.qBittorrent
  net.lutris.Lutris
)

echo -e "${colors[green]}------------ Install Apps and Tools ------------"

for pkg in "${apps[@]}"; do
  echo "------ Installing $pkg..."
  sudo apt install -y "$pkg"
done

# Configs

# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo gpasswd -a $USER docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo service docker start

# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

for pkg in "${snapRepos[@]}"; do
  echo "------ Installing $pkg..."
  sudo snap install "$pkg"
done

for pkg in "${flatpakRepos[@]}"; do
  echo "------ Installing $pkg..."
  flatpak install flathub -y "$pkg"
done

cargo install exa bat rust
sudo dpkg-reconfigure libdvd-pkg

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Zellij
cargo install --locked zellij

# RClone
sudo -v ; curl https://rclone.org/install.sh | sudo bash

echo "------ All apps and tools have been installed."