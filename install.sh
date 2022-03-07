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

if [ -L $HOME/.zshrc ]
then
	rm -f $HOME/.zshrc
else
	mv -f $HOME/.zshrc $HOME/.backup_dot_files-$DATE
fi

echo -e "Create symbolic links to dot files"
ln -fs $PWD/.gitconfig $HOME/.gitconfig
ln -fs $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.zprofile $HOME/.zprofile
ln -sf $PWD/.zshrc $HOME/.zshrc

git config --global core.excludesfile ~/.gitignore_global

source $HOME/.zprofile
