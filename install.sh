echo "Remove current installation of vim"
sudo apt-get -y remove vim-common vim-runtime

DOTFILES="$(sudo find $HOME -name '\.files')"
echo ".files located at $DOTFILES"
cd $DOTFILES
echo "Update vim plugins and other funcy staff"
git submodule update --init --recursive

echo "Link colors and autoload to a right places"
ln -s "$(pwd)/wombat256.vim/colors" "$(pwd)/.vim/colors" 
ln -s "$(pwd)/.vim/bundle/vim-pathogen/autoload" "$(pwd)/.vim/autoload"

echo "Backup existing dot files"
DATE=$(date +%Y-%m-%d-%T)
mkdir $HOME/.backup_dot_files-$DATE
if [ -L $HOME/.vimrc ]
then
	rm $HOME/.vimrc
else
	mv -f $HOME/.vimrc $HOME/.backup_dot_files
fi

if [ -L $HOME/__git_ps1.sh ]
then
	rm $HOME/__git_ps1.sh
else
	mv -f $HOME/__git_ps1.sh $HOME/.backup_dot_files
fi

if [ -L $HOME/.gitconfig ]
then
	rm $HOME/.gitconfig
else
	mv -f $HOME/.gitconfig $HOME/.backup_dot_files
fi

if [ -L $HOME/.bashrc ]
then
	rm $HOME/.bashrc
else
	mv -f $HOME/.bashrc $HOME/.backup_dot_files
fi

echo "Create symbolic links to dot files"
ln -s $DOTFILES/.gitconfig.exmpl  $HOME/.gitconfig
ln -s $DOTFILES/dev-bash-git-ps1/bash_git_ps1.sh $HOME/__git_ps1.sh
ln -s $DOTFILES/.bashrc $HOME/.bashrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc
rm $HOME/.vim
ln -s $DOTFILES/.vim $HOME/.vim
rm $HOME/.vimpy
ln -s $DOTFILES/.vimpy $HOME/.vimpy
rm $HOME/.vimgo
ln -s $DOTFILES/.vimgo $HOME/.vimgo

echo "Install latest vim"
sudo apt-get -y install vim
