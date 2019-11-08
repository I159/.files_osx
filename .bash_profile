# Enable 256 colors
export TERM='xterm-256color'
# Keep current location when new tab opened
PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Use macvim in terminal
#alias vim='mvim -v'
alias gwb='cd ~/go_workspace/src/bitbucket.org'
alias gwg='cd ~/go_workspace/src/github.com'

# Lovely PS1
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# Colors
	RESET='\e[0m'
	ORANGE='\e[38;5;202m'
	LIGHT_GREEN='\e[38;5;118m'
	YELLOW='\e[38;5;226m'
	GREEN='\e[38;5;10m'
	PEACH='\e[38;5;196m'

	set_active_venv() {
		export ACTIVE_VENV=""
		if [ "$VIRTUAL_ENV" != "" ]; then
			export ACTIVE_VENV="\[${PEACH}\](${VIRTUAL_ENV##*/})\[${RESET}\]"
		fi
	}

	source ~/.git-prompt.sh
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	export GIT_PS1_SHOWUPSTREAM="auto"
	export GIT_PS1_SHOWCOLORHINTS=1
	export GIT_PS1_SHOWDIRTYSTATE=1
	export VIRTUAL_ENV_DISABLE_PROMPT=1
	PS1='__git_ps1 "${ACTIVE_VENV}\[${LIGHT_GREEN}\][\T]\[${ORANGE}\]\u\[${RESET}\]:\[${YELLOW}\]\w\[${RESET}\]" " \[${GREEN}\]\\\$\[${RESET}\] "'
	export PROMPT_COMMAND="set_active_venv; ${PS1}; $PROMPT_COMMAND"
fi

# git tab completion (homebrew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
else
	. ~/.git-completion.bash
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export CLICOLOR=1
export LSCOLORS=cxfxcxdxbxegedabagacad

# some more ls aliases
alias ll='ls -alFGp'
alias la='ls -A'
alias l='ls -CF'

# Push Go project code coverage
function cc-push-go-coverage {
	for pkg in $(go list ./... | grep -v vendor); do
    go test -coverprofile=$(echo $pkg | tr / -).cover $pkg
	done
	echo "mode: set" > c.out
	grep -h -v "^mode:" ./*.cover >> c.out
	rm -f *.cover

	$HOME/test-reporter-latest-darwin-amd64 after-build
}

function git_cleanup {
    git branch -vv | cut -c 3- | awk '$3 !~/\[origin/ { print $1 }'| grep -v  $(git rev-parse --abbrev-ref HEAD)| xargs git branch -D
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Set Go workspace
export GOPATH=$HOME/go

# Add GOPATH/bin to PATH
export PATH=$PATH:$GOPATH/bin

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# Add AWS to the path
export PATH=~/.local/bin:$PATH

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
#export PATH="$PATH:/Users/i159/Library/Python/3.7/bin"
export PATH="$PATH:/Users/i159/Library/Python/3.6/bin"
#export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin"
#export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin"
eval "$(pyenv init -)"
