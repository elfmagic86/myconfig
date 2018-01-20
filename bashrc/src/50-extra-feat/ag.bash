# ag
# ---

ag_content_search() {
    local query="$@"
    local path='.'

    local CMD=(
        ag
        "--hidden -U -C 2"
        "'$query'"
        "$path"
    )

    # command 실행
    eval "${CMD[@]}"
}
ag_filename_search() {
    local query="$@"
    local path='.'

    local CMD=(
        ag
        "--hidden -U"
        "-g '$query'"
        "$path"
    )

    # command 실행
    eval "${CMD[@]}"
}
