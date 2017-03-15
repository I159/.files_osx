. ~/.bashrc

PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

if [ -f $(brew --prefix)/etc/bash_completion ]
then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi
