echo -e "Backup existing dot files"
DATE=$(date +%Y-%m-%d-%T)
mkdir $HOME/.backup_dot_files-$DATE

if [ -L $HOME/.gitconfig ]
then
	rm -f $HOME/.gitconfig
else
	mv -f $HOME/.gitconfig $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.gitignore_global ]
then
	rm -f $HOME/.gitignore_global
else
	mv -f $HOME/.gitignore_global $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.bash_profile ]
then
	rm -f $HOME/.bash_profile
else
	mv -f $HOME/.bash_profile $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.slate ]
then
	rm -f $HOME/.slate
else
	mv -f $HOME/.slate $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/tmux.conf ]
then
	rm -f $HOME/tmux.conf
else
	mv -f $HOME/tmux.conf $HOME/.backup_dot_files-$DATE
fi

echo -e "Create symbolic links to dot files"
ln -fs $PWD/.gitconfig $HOME/.gitconfig
ln -fs $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.bash_profile $HOME/.bash_profile
ln -sf $PWD/.slate $HOME/.slate
ln -sf $PWD/tmux.conf $HOME/tmux.conf

git config --global core.excludesfile ~/.gitignore_global

curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

source $HOME/.bash_profile
