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
alias vim='mvim -v'
alias gwb='cd ~/go_workspace/src/bitbucket.org'
alias gwg='cd ~/go_workspace/src/github.com'

# Lovely PS1
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# Colors
	RESET='\e[0m'
	ORANGE='\e[38;5;202m'
	YELLOW='\e[38;5;226m'
	GREEN='\e[38;5;10m'

	source ~/.git-prompt.sh
	export GIT_PS1_SHOWCOLORHINTS=1
	export GIT_PS1_SHOWDIRTYSTATE=1
	PS1='__git_ps1 "\[${ORANGE}\]\u\[${RESET}\]:\[${YELLOW}\]\w\[${RESET}\]" " \[${GREEN}\]\\\$\[${RESET}\] "'
	export PROMPT_COMMAND="${PS1}; $PROMPT_COMMAND"
fi

# git tab completion (homebrew)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Push Go project code coverage
function cc-push-go-coverage {
	export CC_TEST_REPORTER_ID=5bedf25c5d3395678023cf06e9a2b67ad29f25b7fbcde0c45cd0eb3138306d78

	for pkg in $(go list ./... | grep -v vendor); do
    go test -coverprofile=$(echo $pkg | tr / -).cover $pkg
	done
	echo "mode: set" > c.out
	grep -h -v "^mode:" ./*.cover >> c.out
	rm -f *.cover

	./cc-test-reporter after-build
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Include Go bin into path
export PATH=$PATH:/usr/local/go/bin

# Set Go workspace
export GOPATH=$HOME/go_workspace

# Add GOPATH/bin to PATH
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
