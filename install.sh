DOTFILES="$(pwd)"
echo -e "Update vim plugins and other funcy staff"
git submodule update --init --recursive

echo -e "Link colors and autoload to a right places"
rm "$(pwd)/.vim/colors"
ln -s "$(pwd)/wombat256.vim/colors" "$(pwd)/.vim/colors"
rm "$(pwd)/.vim/autoload"
ln -s "$(pwd)/.vim/bundle/vim-pathogen/autoload" "$(pwd)/.vim/autoload"

echo -e "Backup existing dot files"
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

if [ -L $HOME/.bash_profile ]
then
	rm -f $HOME/.bash_profile
else
	mv -f $HOME/.bash_profile $HOME/.backup_dot_files
fi

echo -e "Create symbolic links to dot files"
ln -s $DOTFILES/.gitconfig.exmpl  $HOME/.gitconfig
ln -s $DOTFILES/bash_git_ps1.sh $HOME/__git_ps1.sh
ln -s $DOTFILES/.bashrc $HOME/.bashrc
ln -s $DOTFILES/.bash_profile $HOME/.bash_profile
ln -s $DOTFILES/.vimrc $HOME/.vimrc
rm $HOME/.vim
ln -s $DOTFILES/.vim $HOME/.vim
rm $HOME/.vimpy
ln -s $DOTFILES/.vimpy $HOME/.vimpy
rm $HOME/.vimgo
ln -s $DOTFILES/.vimgo $HOME/.vimgo
