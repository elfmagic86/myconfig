
search_content() {
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
search_filename() {
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

search_dir() {
    local query="$@"
    local path='.'

	# todo ag로 폴더만 찾는 방법은?(ag를 사용해서 agignore적용하고싶음)
	# --- use find
	local CMD=(
		find
		"$path"
		"-type d"
		"-name '*$query*'"
	)

	# command 실행
	eval "${CMD[@]}"
}

# For child-process(vim, else..)
export -f search_content
export -f search_filename
export -f search_dir
