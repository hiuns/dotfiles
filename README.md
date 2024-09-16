/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install neovim\
brew install --cask font-monaspace\
brew install font-meslo-lg-nerd-font

mkdir -p ~/.config/nvim

rm -rf ~/.local/share/nvim\
rm -rf ~/.local/state/nvim\
rm -rf ~/.cachel/nvim

ln -s ~/[directory]/vimrc ~/.vimrc\
ln -s ~/[directory]/zshrc ~/.zshrc\
ln -s ~/[directory]/nvim ~/.config/nvim\
ln -s ~/[directory]/tmux.conf ~/.tmux.conf

