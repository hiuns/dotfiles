#!/bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install neovim stuff
mkdir -p ~/.config/nvim
brew install neovim
brew install --cask font-monaspace
brew install font-meslo-lg-nerd-font

# clean up existing neovim stuff
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cachel/nvim

# make symlinks
ln -s [directory]/zshrc ~/.zshrc
ln -s [directory]/nvim ~/.config/nvim
ln -s [directory]/tmux.conf ~/.tmux.conf
ln -s [directory]/scripts/tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer

