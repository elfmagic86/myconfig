
# NOTE: child process로 실행되어 현재프로세스(bash나 vim)이 freezing되는 것 막기위해 독립된 프로세스로 실행해야함
#   https://stackoverflow.com/questions/20338162/how-can-i-launch-a-new-process-that-is-not-a-child-of-the-original-process
#   > (cmd &)
#   > (..) creates a child process, and & creates a grandchild process. When
#   > the child process dies, the grandchild process is inherited by init.

open_filemanager() {
    local path=${1:-.}

    if $GK_IS_WSL; then
        path=$(wslpath -w $path)
        (explorer.exe $path &)
    else
        (nautilus $path &)
    fi
}

open_terminal() {
    local path=${1:-.}

    if $GK_IS_WSL; then
        (cd $path && cmd.exe /c start "bash" &)
    else
        (gnome-terminal --working-directory=$path &)
    fi
}
open_browser() {
    local url=$1
    if [ -n "$url" ]; then
        if $GK_IS_WSL; then
            (cmd.exe /c start "chrome" "$url" &)
        else
            (qutebrowser "$url" &)
            # (qutebrowser --enable-webengine-inspector "$url" &)
        fi
    fi
}

# For child-process(vim, else..)
export -f open_filemanager
export -f open_terminal
export -f open_browser
