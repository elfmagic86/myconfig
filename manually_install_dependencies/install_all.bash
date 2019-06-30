
#!/bin/bash

# task
# ===

if [ ! $EUID -ne 0 ]; then
   echo "This script must be run as not root"
   exit 1
fi

# env
# ---
SCRIPT_ROOT=$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

install_in_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then
        for script in $(find $dir -name '*.bash'); do
            echo "============= install: $script ==============="
            bash "$script"
        done     
    else
        echo no dir: $dir
    fi
}

# hook
sudo() {
        echo 11111111100000000000000000000000
    local param1="$1"
    local param2="$2"
    if [ "$param1" = "apt-get" ]; then
        shift # remove param1
        if [ "$param2" = "update" ]; then
            echo "todo 한번만 no apt-get update"
        else
            /usr/bin/sudo apt-get -y "$@"
        fi
    else
        /usr/bin/sudo "$@"
    fi
}
export -f sudo


# todo
echo "우분투 미러 호스트 변경하기: https://www.manualfactory.net/10525"
/usr/bin/sudo echo "sudo미리처리"

install_in_dir $SCRIPT_ROOT/default_program
install_in_dir $SCRIPT_ROOT/base_env_program
install_in_dir $SCRIPT_ROOT/base_util_program
install_in_dir $SCRIPT_ROOT/opt_program