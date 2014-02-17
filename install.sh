sudo apt-get -y remove vim-common vim-runtime

DOTFILES="$(sudo find $HOME -name '\.files')"
cd $DOTFILES
echo "DOTFILES PATH " $DOTFILES
git submodule update --init --recursive

cd $HOME
if ! [ -L .vim ];
then
	rm -rf .vim
	ln -s $DOTFILES/.vim .vim
fi

if ! [ -L .vimrc ];
then
	rm -f .vimrc
	ln -s $DOTFILES/.vimrc .vimrc
fi
ln -s $DOTFILES/.vimpy .vimpy
ln -s $DOTFILES/.vimgo .vimgo

if ! [ -L .gitconfig ];
then
	rm -f .gitconfig
	ln -s $DOTFILES/.gitconfig.exmpl  .gitconfig
fi

if ! [ -L __git_ps1.sh ];
then
	rm -f __git_ps1.sh
	ln -s $DOTFILES/dev-bash-git-ps1/bash_git_ps1.sh $HOME/__git_ps1.sh
fi

if ! [ -L .bashrc ];
then
	rm -f .bashrc
	ln -s $DOTFILES/.bashrc .bashrc
fi

sudo apt-get -y install vim
