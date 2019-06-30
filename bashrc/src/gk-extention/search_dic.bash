
search_dic() {
    local word=$1
    [ -z ${word} ] && echo 'no word' && return 0

    local CMD=(
    lynx
    -dump -nolist
    "http://dic.naver.com/search.nhn?dicQuery=${word}&query=${word}&target=dic&ie=utf8&query_utf=&isOnlyViewEE="
    )

    # call
    echo "search dic...:${word}"
    local search_result=$("${CMD[@]}")

    # parse and print
    sed -rn -e '
    /^영어사전/,/^[[:space:]]{1,}영어사전/p;
    /^국어사전/,/^[[:space:]]{1,}국어사전/p;
    ' < <(echo "$search_result")
}

# For child-process(vim, else..)
export -f search_dic
