YELLOW='\[\033[0;36m\]'
GREEN='\[\033[0;32m\]'
LIGHT_GREEN='\[\033[0;92m\]'
CYAN='\[\033[0;96m\]'
LIGHT_RED='\[\033[0;91m\]'
RED='\[\033[0;31m\]'
LIGHT_YELLOW='\[\033[0;93m\]'
RESET='\[\033[0m\]'


branch_name()
{
	local branch=$(git branch 2>/dev/null| grep '^*'| colrm 1 2)
	if [ -n $branch ]
	then
		echo "{$branch}"
	fi
}

get_venv()
{
	echo "(${VIRTUAL_ENV##/*/})"
}

get_pwd()
{
	PWD=$(pwd)
	echo "${PWD/$HOME/HOME}"
}

get_state()
{
	RAW_STATUS=$(git status 2> /dev/null)
	STASH=$(git stash list 2> /dev/null)

	if [ $( grep "CONFLICT" <<< $RAW_STATUS| wc -l) -ne 0 ]
	then
		STATE=$STATE'☠'
	fi

	if [  $( grep "Untracked files" <<< $RAW_STATUS| wc -l) -ne 0 ]
	then
		STATE=$STATE'⛈'
	fi

	if [  $( grep "Changes not staged for commit" <<< $RAW_STATUS| wc -l) -ne 0 ]
	then
		STATE=$STATE'☁'
	fi

	if [  $( grep "Changes to be committed" <<< $RAW_STATUS| wc -l) -ne 0 ]
	then
		STATE=$STATE'☀'
	fi

	if [ -n "$STASH" ]
	then
		STATE=$STATE'⛅'
	fi

	if [  $( grep "rebase in progress" <<< $RAW_STATUS| wc -l) -ne 0 ]
	then
		STATE=$STATE'☄'
	fi
	echo $STATE
}

get_rev_count()
{
	LOCAL_REV_COUNT=$( git rev-list --count  ..remotes/origin/HEAD )
    REMOTE_REV_COUNT=$( git rev-list --count  remotes/origin/HEAD.. )

	if [[ ( $REMOTE_REV_COUNT > 0 ) ]] && [[ ( $LOCAL_REV_COUNT > 0 ) ]]
	then
		COUNT=$STATE"$RED$REMOTE_REV_COUNT$RESET/$GREEN$LOCAL_REV_COUNT$RESET"
	elif [[ ( $LOCAL_REV_COUNT > 0 ) ]]
	then
		COUNT=$STATE"$GREEN$LOCAL_REV_COUNT$RESET"
	elif [[ ( $REMOTE_REV_COUNT > 0 ) ]]
	then
		COUNT=$STATE"$RED$REMOTE_REV_COUNT$RESET"
	fi

	if [[ ( ${#COUNT} > 0 ) ]]
	then
		COUNT="$GREEN[$RESET$COUNT$GREEN]$RESET"
	fi
	echo $COUNT
}

make_psONE()
# Git operations could be expensive and a term could rebate. To disable git operations set GIT_OFF=1.
{
	PS1="${YELLOW}$(whoami):${LIGHT_GREEN}$(get_pwd)"

	if [[ ${#VIRTUAL_ENV} -gt 0 ]]
	then
		PS1="$(get_venv)$PS1"
	fi

	if [ -z $GIT_OFF ]
	then
		GIT_OFF=0
	fi

	if [[ $GIT_OFF -eq 0 ]]
	then
		IS_GIT=$(git rev-parse --git-dir 2> /dev/null)
		if [ -n "$IS_GIT" ] 
		then
			PS1="$PS1${CYAN}$(branch_name)$(get_rev_count)${LIGHT_RED}$(get_state)"
		fi
	fi
	PS1="$PS1 ${LIGHT_YELLOW}$ ${RESET}"
}

PROMPT_COMMAND=make_psONE
