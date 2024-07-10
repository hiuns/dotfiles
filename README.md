brew install neovim\
brew tab homebrew/cask-fonts\
brew install font-meslo-lg-nerd-font

mkdir -p ~/.config/nvim

ln -s ~/dotfiles/vimrc ~/.vimrc\
ln -s ~/dotfiles/zshrc ~/.zshrc\
ln -s ~/dotfiles/nvim ~/.config/nvim\
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

