git clone https://github.com/iaia/dotfiles.git ~/dotfiles
ln -sd ~/dotfiles/.vim/ ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
mkdir ~/dotfiles/.vim
mkdir ~/dotfiles/.vim/.vimundo
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dotfiles/installer.sh 
sh ~/dotfiles/installer.sh ~/.vim/dein
rm ~/dotfiles/installer.sh
mkdir ~/.ssh/

