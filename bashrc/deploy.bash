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

SRC_ROOT=$SCRIPT_ROOT/src
DIST_ROOT=$SCRIPT_ROOT/dist


# main
# ---
main() {
	local mode=${1:-prod}

	echo bash-deploy: mode: $mode
	if [ "$mode" = 'dev' ]; then
		task_dev_bundle
		task_deploy
	else
		task_prod_bundle
		task_deploy
	fi
}

task_dev_bundle() {
	# bashrc.d에 단순복사
	rm -rf $DIST_ROOT 2> /dev/null
	
	mkdir -p $DIST_ROOT
	cp -r $SRC_ROOT $DIST_ROOT/.bashrc.d

	# create .basrc(config, bashrc-skeleton)
	cat $SCRIPT_ROOT/config-dev.bash >> $DIST_ROOT/.bashrc
	echo -e "\n" >> $DIST_ROOT/.bashrc
	cat $SCRIPT_ROOT/bashrc-skeleton.bash >> $DIST_ROOT/.bashrc 
}

util_merge_file_in_dir() {
	local target_dir="$1"
	local merged_file="$2"
	# src
	local files content
	files=$(find $target_dir -name '*.bash' | sort)
	for file in $files; do
		if [ -f "$file" ]; then
			# echo $file
			content=''
			content+='\n\n'
			content+='# '$(basename $file)
			content+='\n'
			content+='# ==='
			content+='\n'
			echo -e "$content" >> $merged_file
			cat $file >> $merged_file
		fi
	done
}
task_prod_bundle() {
	# dist폴더 정리 및 빈 vimrc만듬
	rm -rf $DIST_ROOT 2> /dev/null
	mkdir -p $DIST_ROOT/.bashrc.d

	# src
	local target to_path
	for target in $SRC_ROOT/*; do
		to_path=$DIST_ROOT/.bashrc.d/$(basename $target)
		if [ -d "$target" ]; then
			mkdir -p $to_path
			util_merge_file_in_dir "$target" "$to_path/merged.bash"
		else
			cp $target $to_path
		fi
	done

	# create .basrc(config, bashrc-skeleton)
	cat $SCRIPT_ROOT/config.bash >> $DIST_ROOT/.bashrc
	echo -e "\n" >> $DIST_ROOT/.bashrc
	cat $SCRIPT_ROOT/bashrc-skeleton.bash >> $DIST_ROOT/.bashrc 
}

# 삭제 후 링크
task_deploy() {
	rm -rf $HOME/bashrc.d
	rm -rf $HOME/.bashrc

	ln --symbolic --force --no-dereference $DIST_ROOT/.bashrc.d $HOME/.bashrc.d
	ln --symbolic --force --no-dereference $DIST_ROOT/.bashrc $HOME/.bashrc
}


# runner
# ---
main "$@"
