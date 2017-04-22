#!/bin/sh
# You should already have git, sudo and the dotfiles repo cloned

# First get packages
sudo pacman -S vim cmake wget zsh tmux i3 termite redshift xorg-server xorg-xinit openssh adobe-source-code-pro-fonts \
adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts python2 xorg-xrandr

# Set up vim
mkdir -p $HOME/.vim $HOME/.VIM_UNDO_FILES .$HOME/.vim/after
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

# Set up zsh
ln -s $PWD/zprofile $HOME/.zprofile
ln -s $PWD/xinitrc $HOME/.xinitrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

