# ps1..별거없음
# git prompt: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
__set_prompt_with_git() {
	# 1. enable env
	# ---
	GIT_PS1_SHOWDIRTYSTATE=1 # unstaged (*) and staged (+) changes will be shown next to the branch name
	GIT_PS1_SHOWSTASHSTATE=1 # You can also see if currently something is stashed
	GIT_PS1_SHOWUNTRACKEDFILES=1 # If you would like to see if there're untracked files
	GIT_PS1_SHOWUPSTREAM="auto" # If you would like to see the difference between HEAD and its upstream

	GIT_PS1_DESCRIBE_STYLE="default" # If you would like to see more information about the identity of commits checked out as a detached HEAD

	# If you would like a colored hint about the current dirty state, set
	# GIT_PS1_SHOWCOLORHINTS to a nonempty value. The colors are based on
	# the colored output of "git status -sb" and are available only when
	# using __git_ps1 for PROMPT_COMMAND or precmd.
	GIT_PS1_SHOWCOLORHINTS=1

	PROMPT_DIRTRIM=2

	# 2. ps1 by git-prompt
	# ---

	# NOTE: ps1에 tput 결과(non-printng escape sequence)를 그대로 사용하면 커서위치가 고장남
	# https://stackoverflow.com/questions/42121662/why-do-my-bash-prompt-colors-make-cursor-appear-in-wrong-spot

	# color
	local color_reset='\['$(tput sgr0)'\]' # reset
	local color_basic='\['$(tput setaf 6)'\]'
	local color_silent='\['$(tput setaf 7)'\]'

	local color_long_dir='\['$(tput setaf 7)'\]'
	local color_jobs='\['$(tput setaf 5)'\]'

	# char
	local char_umbrella=$'\xe2\x98\x94'

	# prompt start, end
	local p_start p_end

	# line1
	p_start+='\n'

	# line2
	p_start+=${color_basic}${char_umbrella}
	p_start+=${color_reset}
	# center: ( master * )
	# NOTE: 이후는 p_end가 되야함
	p_end+=${color_reset}'\n'

	# line3
	p_end+=' '
	p_end+=${color_basic}'\w'
	p_end+=' '
	p_end+=${color_silent}'\u'
	p_end+=${color_reset}'@'
	p_end+=${color_silent}'\h'
	p_end+=${color_reset}':'
	p_end+=${color_long_dir}'\D{%F %T}'
	p_end+=${color_reset}'\n'

	# line4
	p_end+=' '
	p_end+=${color_basic}'\$'
	p_end+=${color_jobs}'$([ \j -gt 0 ] && echo " [\j]")'
	p_end+=${color_reset}' '

	# define prompt
	PS1_START="${p_start}"
	PS1_END="${p_end}"
	PROMPT_COMMAND='__git_my_ps1 "${PS1_START}" "${PS1_END}"'
}
__set_prompt_with_git
unset __set_prompt_with_git

# color test용
#for c in {0..10}; do
	#echo -e $(tput setaf $c)color: $c
#done


#
# __git_ps1을 사용하되, 처음실행시 느려서 backgroundjob을 사용함.
# TODO 느린것보다 낫지만 엉성함
#
__checked_git_path=''
__git_my_ps1() {
	local left center right cur_path

	left=$1
	right=$2

	cur_path=$(pwd)
	# git rep이면서, 이전 path 같을경우만 __git_ps1사용
	if git rev-parse --git-dir > /dev/null 2>&1; then
		if [ "$cur_path" = "$__checked_git_path" ]; then
			__git_ps1 "${left}" "${right}"
		else
			center=' loading.."__git_ps1"'
			PS1="$left$center$right"

			# git repository이지만 __git_ps1이 첫실행임
			__checked_git_path=$cur_path

			# 1. 다음 실행시 빠르게 접근위해 돌려놓음
			# 2. 독립 프로세스로 실행시켜 freezing을막음.
			(__git_ps1 "${left}" "${right}" &)
		fi
	else
		center=""
		PS1="$left$center$right"
	fi

}
