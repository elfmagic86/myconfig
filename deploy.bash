#!/bin/bash

# NOTE: **force** remove old file and link newfile
#
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
	# NOTE: 1 depth
	for dotfile in $(find $ROOT_PATH/dotfiles -maxdepth 1 -mindepth 1); do
		local name=`basename $dotfile`
		local is_ignore=false

		case "$name" in
			.m2)
				if ! $GCE_IS_WSL; then is_ignore=true; fi
				;;
			.gitignore)
				is_ignore=true
				;;
			.gnomerc|.profile|.xsession)
				chmod +x $dotfile 2>&1 > /dev/null
				;;
			*)
				;;
		esac

		if [ ! $is_ignore = true ]; then
			rm $HOME/$name
			ln --symbolic --force --no-dereference $dotfile $HOME/$name
		fi
	done
}

deploy_dotfiles_direct_location() {
    local src_path=$ROOT_PATH/dotfiles_direct_location

    # awesoem
    mkdir -p $HOME/.config/awesome
    ln --symbolic --force --no-dereference  $src_path/awesome/rc.lua $HOME/.config/awesome/rc.lua

	# xdg autostart
    mkdir -p $HOME/.config/autostart
	ln --symbolic --force --no-dereference  $src_path/gnome-session-startup.desktop $HOME/.config/autostart/

	# lightdm
	if [ -d /etc/lightdm ]; then
		echo "sudo.. for lightdm conf"

		sudo rm -f /etc/lightdm/lightdm.conf
		sudo cp $src_path/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
	fi

}

deploy_bin() {
	# file을 실행가능으로 만듬.(권한은 실행자)s
	for bin_file in $ROOT_PATH/bin/*; do
		if [ -f $bin_file ]; then
			[ ! -x $bin_file ] && chmod +x $bin_file
		fi
	done

	# link
	rm -r $HOME/bin
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
