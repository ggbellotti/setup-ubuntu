# Ubuntu Setup Script
Script for installing essential software, tools and customizations on Ubuntu.

# Requirements to run the script
```bash
sudo apt install git -y
```

# How to use script
```bash
git clone https://github.com/ggbellotti/setup-ubuntu.git
cd setup-ubuntu
chmod +x install.sh
./install.sh
```
# What is included / What will you do?

## Update OS
* Update and upgrade system packages

## Install tools, packages and drivers
* **Build Tools**: `meson`, `ninja-build`, `make`, `g++`
* **Development Libraries**: `libnss3-tools`, `libaio1`, `libevince-dev`, `gir1.2-gstreamer-1.0`, `librust-gstreamer-audio-sys-dev`, `libgtksourceview-4-dev`, `libmusicbrainz5-dev`, `libwebkit2gtk-4.0-dev`, `libgirepository1.0-dev`
* **Version Control and Utilities**: `git-all`, `dirmngr`, `gpg`, `gawk`, `ca-certificates`, `gnupg`, `lsb-release`
* **Package Managers**: `flatpak`, `nala`, `cargo`, `pip`
* **System Utilities**: `imwheel`, `fakeroot`, `libdvd-pkg`, `apt-transport-https`, `dialog`, `optipng`
* **Qt Dependencies**: `libqt5svg5`, `qml-module-qtquick-controls`
* **AMD GPU**: `mesa-vulkan-drivers`, `mesa-vulkan-drivers:i386`, `amdgpu-dkms`, `rocm-hip-libraries`

## Install software
* **Text Editors and IDEs**: `neovim`, `code`
* **Multimedia and Graphics**: `ubuntu-restricted-extras`, `gnome-sushi`, `obs-studio`, `guvcview`, `imagemagick`, `ffmpeg`, `p7zip-full`
* **Shells and Terminals**: `fish`, `exa`, `bat`, `wezterm`
* **Docker Tools**: `docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-compose-plugin`, `docker-compose`
* **Virtualization**: `virt-manager`
* **Razer Device Support**: `openrazer-meta`
* **HTTP Client**: `httpie`

## Configure shell and theme
* **Shell Extensions and Configs**: `compizconfig-settings-manager`, `dconf-editor`, `gnome-shell-extensions`, `gnome-shell-extension-appindicator`, `alacarte`
* **Customization Utilities**: `imwheel` (for mouse settings)
* **Folder Setup and File Copying**: Creates custom folders (`~/Videos/OBS`, `~/www`) and copies configuration files to `~/.ssh` and home directory.
* **SSH Key Generation**: Generates SSH keys for secure access with `ssh-keygen`.
* **Download Themes and Cursors**: Downloads and installs the Bibata cursor theme and WhiteSur GTK and icon themes.
* **Install Fonts**: Executes custom font installation script from `scripts/customization/fonts.sh`.
* **Shell Configuration**: Applies shell customizations from `scripts/customization/shell.sh`.
