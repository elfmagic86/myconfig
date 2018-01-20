# git
# ---

# all add and commit
__git_add_all_and_commit() {
    if [ $# -eq 0 ]; then
        echo "!! no message"
    else
        echo "---- 1. status -----"
        echo "$(git status)"
        echo "---- 2. message for commit -----"
        echo "MSG: $1"

        read -p "Do commit? (y/n)? " answer
        if [[ $answer = y ]] ; then
            git add -A;
            git commit -m "$1";
            echo "success commit"
        else
            echo "noting"
        fi
    fi
}

# git status에서 파일을 선택하여, 반복적으로 add 혹은 reset함
__git_add_or_reset_loop() {
    local g_action filter
    # 파일선택하는 명령, 선택한 파일에 대한 git명령을 고른다
    # do
    case "$1" in
        -r)
            g_action=reset
            filter_cmd="sed -r '/^[\ ]|^[\?]/d'"
            ;;
        -a|*)
            g_action=add
            filter_cmd="sed -nr '/^[\ ]|^[\?]/p'"
            ;;
    esac

    # 선택 후 git명령
    local out key file action
    while out=$(
        #git -c color.status=always status --short --untracked-files=all |
        git status -s | eval $filter_cmd | 
        fzf  --ansi --no-sort --bind=ctrl-s:toggle-sort \
            --expect=ctrl-d
        );
    do
        key=$(head -1 <<< "$out")
        file=$(head -2 <<< "$out" | tail -1 | awk '{print $2}')

        # 1. check continue
        [ -z "$file" ] && continue;

        # 2. select action
        if [ "$key" = 'ctrl-d' ]; then
            action=diff
        else
            action=$g_action
        fi

        # 3. do action
        case "$action" in
            diff)
                # color위해 고려사항, 1. non-interaction 2.less의 -R
                sh -c "git diff --color=always -- $file | less -R"
                ;;
            add)
                git add $file
                ;;
            reset)
                git reset HEAD $file > /dev/null
                ;;
            *) continue ;;
        esac
    done

    # 마지막 상태확인
    git -c color.status=always status --short --untracked-files=all

}

# fshow - git commit browser
# fzf wiki: https://github.com/junegunn/fzf/wiki/Examples#git
__git_fshow() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
    (grep -o '[a-f0-9]\{7\}' | head -1 |
    xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
    {}
    FZF-EOF"
}


# key binding
# TODO 그닥
__git_function_select_and_exec() {
    # 대상
    local list func
    list=(
    '__git_add_or_reset_loop -a'
    '__git_add_or_reset_loop -r'
    '__git_fshow'
    '__git_add_all_and_commit'
    )

    # 선택하고 실행
    func=$(printf '%s\n' "${list[@]}" | fzf)
    echo "$func"
    eval "$func"
}

# C-g로 키 바인딩
bind '"\C-g":"\C-u __git_function_select_and_exec \C-m"'
