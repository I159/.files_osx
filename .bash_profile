. ~/.bashrc

PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

if [ -f $(brew --prefix)/etc/bash_completion ]
then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

alias vim='mvim -v'
alias gwb='cd ~/go_workspace/src/bitbucket.org'
alias gwg='cd ~/go_workspace/src/github.com'

source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='__git_ps1 "\[\033[32m\]\u:\[\033[33;1m\]\w\e[0m" "\\\$ "'
export PROMPT_COMMAND="${PS1}; $PROMPT_COMMAND"
