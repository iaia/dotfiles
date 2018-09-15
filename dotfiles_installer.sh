git clone https://github.com/iaia/dotfiles.git ~/dotfiles

ln -sd ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.tigrc ~/.tigrc

mkdir ~/dotfiles/.vim
mkdir ~/dotfiles/.vim/.vimundo

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dotfiles/installer.sh
sh ~/dotfiles/installer.sh ~/.vim/dein
rm ~/dotfiles/installer.sh

mkdir ~/.ssh/
mkdir ~/.vim/.vimundo
