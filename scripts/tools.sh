tools=(
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
)

echo -e "${colors[green]}------------ Install Tools ------------"

for pkg in "${tools[@]}"; do
  echo "------ Installing $pkg..."
  sudo apt install -y "$pkg"
done

cargo install exa bat rust

echo "------ All tools have been installed."