/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
brew install zsh-completion
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

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

if [ -L $HOME/.zprofile ]
then
	rm -f $HOME/.zprofile
else
	mv -f $HOME/.zprofile $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.slate ]
then
	rm -f $HOME/.slate
else
	mv -f $HOME/.slate $HOME/.backup_dot_files-$DATE
fi

if [ -L $HOME/.tmux.conf ]
then
	rm -f $HOME/.tmux.conf
else
	mv -f $HOME/.tmux.conf $HOME/.backup_dot_files-$DATE
fi

echo -e "Create symbolic links to dot files"
ln -fs $PWD/.gitconfig $HOME/.gitconfig
ln -fs $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.gitmessage $HOME/.gitmessage
ln -sf $PWD/.zprofile $HOME/.zprofile
ln -sf $PWD/.slate $HOME/.slate
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf

git config --global core.excludesfile ~/.gitignore_global

source $HOME/.zprofile
