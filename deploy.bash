#!/bin/bash

# NOTE: **force** remove old file and link newfile

# env
# ---
ROOT_PATH=$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# main
# ---
main() {

	echo myconfig-deploy

	cd $ROOT_PATH
	# 인자 없는 명령은 mode구분이 아직 없다
	deploy_dotfiles
	deploy_dotfiles_direct_location
	deploy_bin
	deploy_bashrc
	deploy_vimrc

	# reload
	source ~/.bashrc
}

# deploy
# ---
deploy_dotfiles() {
	for dotfile in $(find $ROOT_PATH/dotfiles -maxdepth 1 -mindepth 1); do
		local name=`basename $dotfile`

		case "$name" in
			.gitignore) ;;
			*)
				rm -rf $HOME/$name
				ln --symbolic --force --no-dereference $dotfile $HOME/$name
				;;
		esac
	done
}

deploy_dotfiles_direct_location() {
    local src_path=$ROOT_PATH/dotfiles_direct_location

    # awesoem
    mkdir -p $HOME/.config/awesome
    ln --symbolic --force --no-dereference  $src_path/awesome/rc.lua $HOME/.config/awesome/rc.lua
}

deploy_bin() {
	# file을 실행가능으로 만듬.(권한은 실행자)s
	for bin_file in $ROOT_PATH/bin/*; do
		if [ -f $bin_file ]; then
			[ ! -x $bin_file ] && chmod +x $bin_file
		fi
	done

	# link
	rm -rf $HOME/bin
	ln --symbolic --force --no-dereference $ROOT_PATH/bin $HOME/bin
}

deploy_bashrc() {
	# bash deploy
	bash $ROOT_PATH/bashrc/deploy.bash
}

deploy_vimrc() {
	# bash deploy
	bash $ROOT_PATH/vimrc/deploy.bash
}

# run main
# ---
main "$@"
