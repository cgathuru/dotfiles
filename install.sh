#!/bin/sh
# You should already have git, sudo and the dotfiles repo cloned

# First get packages
sudo pacman -S vim cmake wget zsh tmux i3 termite redshift xorg-server xorg-xinit openssh adobe-source-code-pro-fonts \
adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts python2 xorg-xrandr numlockx \
ttf-dejavu xorg-xset polkit

# Set up vim
mkdir -p $HOME/.vim/after $HOME/.VIM_UNDO_FILES
ln -s $PWD/vim/after/ftplugin $HOME/.vim/after/ftplugin
ln -s $PWD/vimrc $HOME/.vimrc
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set up tmux
ln -s $PWD/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Set up i3 and termite and redshift
mkdir -p $HOME/.config
ln -s $PWD/config/i3 $HOME/.config/i3
ln -s $PWD/config/termite $HOME/.config/termite
ln -s $PWD/config/systemd $HOME/.config/systemd
ln -s $PWD/config/redshift.conf $HOME/.config/redshift.conf

# Set up pacman mirrorlist auto-update
sudo pacman -S reflector
sudo mkdir -p /etc/pacman.d/hooks
sudo ln -s $PWD/mirrorupgrade.hook /etc/pacman.d/hooks/mirrorupgrade.hook

# Set up packer
sudo pacman -S expac jshon
mkdir packer && cd packer
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD?h=packer PKGBUILD
makepkg
sudo pacman -U packer-*
cd ..
rm -rf packer

# Install font-awesome
packer -S ttf-font-awesome

# Install enpass and caffeine
packer -S enpass-bin caffeine-ng

# Setup audio
packer -S pulseaudio pavucontrol pulseaudio-ctl

# Setup network
packer -S networkmanager network-manager-applet networkmanager-openvpn private-internet-access-vpn gnome-keyring libsecret

# Set up zsh
ln -s $PWD/zprofile $HOME/.zprofile
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/xinitrc $HOME/.xinitrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

