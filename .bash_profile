. ~/.bashrc

PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

if [ -f $(brew --prefix)/etc/bash_completion ]
then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

export RIOTAPIKEY_TEST="RGAPI-8383493d-6307-40ca-ac2a-4ac9cbb72605"
