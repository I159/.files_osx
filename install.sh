echo -e "\e[96mRemove current installation of vim"
#sudo apt-get -y remove vim-common vim-runtime

DOTFILES="$(pwd)"
echo -e " \e[93mUpdate vim plugins and other funcy staff"
git submodule update --init --recursive

echo -e "\e[35mLink colors and autoload to a right places"
rm "$(pwd)/.vim/colors"
ln -s "$(pwd)/wombat256.vim/colors" "$(pwd)/.vim/colors"
rm "$(pwd)/.vim/autoload"
ln -s "$(pwd)/.vim/bundle/vim-pathogen/autoload" "$(pwd)/.vim/autoload"

echo -e "\e[92mBackup existing dot files"
DATE=$(date +%Y-%m-%d-%T)
mkdir $HOME/.backup_dot_files-$DATE
if [ -L $HOME/.vimrc ]
then
	rm -f $HOME/.vimrc
else
	mv -f $HOME/.vimrc $HOME/.backup_dot_files
fi

if [ -L $HOME/__git_ps1.sh ]
then
	rm -f $HOME/__git_ps1.sh
else
	mv -f $HOME/__git_ps1.sh $HOME/.backup_dot_files
fi

if [ -L $HOME/.gitconfig ]
then
	rm -f $HOME/.gitconfig
else
	mv -f $HOME/.gitconfig $HOME/.backup_dot_files
fi

if [ -L $HOME/.bashrc ]
then
	rm -f $HOME/.bashrc
else
	mv -f $HOME/.bashrc $HOME/.backup_dot_files
fi

echo -e "\e[90Create symbolic links to dot files"
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

echo -e "\e[94mInstall latest vim"
#sudo apt-get -y install vim
