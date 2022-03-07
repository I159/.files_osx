# Enable 256 colors
export TERM='xterm-256color'
# Keep current location when new tab opened
PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
APPEND_HISTORY=1

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'

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

function git_cleanup {
    git branch -vv | cut -c 3- | awk '$3 !~/\[origin/ { print $1 }'| grep -v  $(git rev-parse --abbrev-ref HEAD)| xargs git branch -D
}

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
