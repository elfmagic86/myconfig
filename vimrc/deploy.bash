#!/bin/bash

# task
# ===

if [ ! $EUID -ne 0 ]; then
	echo "This script must be run as not root"
	exit 1
fi

# env
# ---
ROOT_PATH=$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

SRC_PATH=$ROOT_PATH/src
DEST_ROOT_PATH=~/.vim


# main
# ---
main() {
	echo vim-deploy

	cd $ROOT_PATH

	install_dein_if_not_exists
	task_deploy
}

install_dein_if_not_exists() {
	vim_dein_dir=~/.vim/dein
	if [ ! -d $vim_dein_dir ]; then
		curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
		sh /tmp/installer.sh $vim_dein_dir
	fi
}

# NOTE 기존것 지우고 현재버전을 복사한다.
task_deploy() {
	#vimrc
	mkdir -p $DEST_ROOT_PATH

	rm -rf $DEST_ROOT_PATH/autoload
	rm -rf $DEST_ROOT_PATH/vimrc
	ln --symbolic --force --no-dereference $SRC_PATH/autoload $DEST_ROOT_PATH/autoload
	ln --symbolic --force --no-dereference $SRC_PATH/vimrc.vim $DEST_ROOT_PATH/vimrc

	# neovim
	mkdir -p ~/.config/nvim
	rm -rf ~/.config/nvim/init.vim
	ln --symbolic --force --no-dereference $SRC_PATH/nvimrc.vim ~/.config/nvim/init.vim
}

# runner
# ---
main "$@"
