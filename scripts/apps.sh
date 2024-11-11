apps=(
  # Apps/softwares
  libguvcview-dev
  ubuntu-restricted-extras
  fish
  bat
  compizconfig-settings-manager
  p7zip-full
  alacarte
  neovim
  gnome-sushi
  wine64
  guvcview
  dconf-editor
  code
  gnome-shell-extensions
  wezterm
  obs-studio
  httpie
  openrazer-meta
  docker-ce
  docker-ce-cli
  containerd.io
  docker-compose-plugin
  docker-compose
  nala
  fzf
  virt-manager
  gimagereader
  tesseract-ocr

  # Tools
  imwheel
  meson
  libnss3-tools
  libevince-dev
  gir1.2-gstreamer-1.0
  librust-gstreamer-audio-sys-dev
  libgtksourceview-4-dev
  libmusicbrainz5-dev
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
  uidmap
  exa
  bat
  pandoc
)

snapRepos=(
  bluemail
  dbeaver-ce
  discord
  drawio
  emote
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
  org.gnome.NetworkDisplays
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
  com.valvesoftware.Steam
  io.beekeeperstudio.Studio
)

echo -e "${colors[green]}------------ Install Apps and Tools ------------"

for pkg in "${apps[@]}"; do
  echo "------ Installing $pkg..."
  sudo apt install -y "$pkg"
done

source ~/setup-ubuntu/scripts/update-system.sh

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
dockerd-rootless-setuptool.sh install

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

sudo dpkg-reconfigure libdvd-pkg

sudo gpasswd -a $USER plugdev

sudo systemctl daemon-reload

# Rust
curl https://sh.rustup.rs -sSf | sh

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Zellij
cargo install --locked zellij

# RClone
sudo -v ; curl https://rclone.org/install.sh | sudo bash

# Exa (cargo)
cargo install exa

source ~/setup-ubuntu/scripts/update-system.sh

echo "${colors[green]}------------ All apps and tools have been installed ------------"