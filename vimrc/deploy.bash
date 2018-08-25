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

	install_plug_if_not_exists
	task_deploy
}

install_plug_if_not_exists() {
	plug_vim=~/.vim/autoload/plug.vim
	if [ ! -f $plug_vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

# NOTE 기존것 지우고 현재버전을 복사한다.
task_deploy() {
	# vim
	mkdir -p $DEST_ROOT_PATH

	# 1.vimrc
	rm -rf $DEST_ROOT_PATH/vimrc
	ln --symbolic --force --no-dereference $SRC_PATH/vimrc.vim $DEST_ROOT_PATH/vimrc

	# 2. myvimrc
	rm -rf $DEST_ROOT_PATH/autoload/myvimrc
	mkdir -p $DEST_ROOT_PATH/autoload
	ln --symbolic --force --no-dereference $SRC_PATH/myvimrc $DEST_ROOT_PATH/autoload/myvimrc

	# neovim
	mkdir -p ~/.config/nvim
	rm -rf ~/.config/nvim/init.vim
	ln --symbolic --force --no-dereference $SRC_PATH/nvimrc.vim ~/.config/nvim/init.vim
}

# runner
# ---
main "$@"
