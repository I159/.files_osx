. ~/.bashrc

PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

if [ -f $(brew --prefix)/etc/bash_completion ]
then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# Use default git bash completion ps1
source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND='__git_ps1 "\[\033[32m\]\u:\[\033[33;1m\]\w\e[0m" "\\\$ "'
