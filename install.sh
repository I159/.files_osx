echo -e "Backup existing dot files"
DATE=$(date +%Y-%m-%d-%T)
mkdir $HOME/.backup_dot_files-$DATE

if [ -L $HOME/.gitconfig ]
then
	rm -f $HOME/.gitconfig
else
	mv -f $HOME/.gitconfig $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.gitignore ]
then
	rm -f $HOME/.gitignore
else
	mv -f $HOME/.gitignore $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.bash_profile ]
then
	rm -f $HOME/.bash_profile
else
	mv -f $HOME/.bash_profile $HOME/.backup_dot_files-$DATE
fi

echo -e "Create symbolic links to dot files"
ln -fs $PWD/.gitconfig $HOME/.gitconfig
ln -fs $PWD/.gitignore $HOME/.gitignore
ln -fs $PWD/.bashrc $HOME/.bashrc
