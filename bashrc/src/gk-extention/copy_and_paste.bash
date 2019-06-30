
if $GCE_IS_WSL; then
    # export DISPLAY=:0
    # win32yank.exe 다운 및 path등록 필요
    wpaste() {
        # echo -e "$(win32yank.exe -o)"
        echo -e "$(powershell.exe -Command Get-Clipboard)"
    }
    wcopy() {
        input="$@"

        # echo -e "$@" | win32yank.exe -i

        # powershell.exe -Command Set-Clipboard

        # https://github.com/Microsoft/WSL/issues/1069
        echo -e "$@" | clip.exe
    }
    export -f wpaste
    export -f wcopy
fi
