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
DIST_PATH=$ROOT_PATH/dist


# main
# ---
main() {
	local mode=${1:-prod}

	echo bash-deploy: mode: $mode

	if [ "$mode" = 'dev' ]; then
		task_dev_bundle
		task_force_deploy
	elif [ "$mode" = 'prod' ]; then
		task_bundle
		task_force_deploy
	fi
}

# create single vimrc by soft link
task_dev_bundle() {
	# dist폴더 정리 및 빈 vimrc만듬
	rm -rf $DIST_PATH 2> /dev/null
	mkdir -p $DIST_PATH
	touch $DIST_PATH/.bashrc

	# 순차적으로 source 추가
	local files content
	files=$(find $SRC_PATH -name '*.bash' | sort)
	for file in $files; do
		if [ -f "$file" ]; then
			echo "source $file" >> $DIST_PATH/.bashrc
		fi
	done

	# reload는 rr alias로 bashrc에 포함되어있음
}

# create single vimrc
task_bundle() {
	# dist폴더 정리 및 빈 vimrc만듬
	rm -rf $DIST_PATH 2> /dev/null
	mkdir -p $DIST_PATH
	touch $DIST_PATH/.bashrc

	# 순차적으로 내용 추가.
	local files content
	files=$(find $SRC_PATH -name '*.bash' | sort)
	for file in $files; do
		if [ -f "$file" ]; then
			# echo $file
			content=''
			content+='\n\n'
			content+='# '$(basename $file)
			content+='\n'
			content+='# ==='
			content+='\n'
			echo -e "$content" >> $DIST_PATH/.bashrc
			cat $file >> $DIST_PATH/.bashrc
		fi
	done
}

# NOTE 기존것 지우고 현재버전을 복사한다.
task_force_deploy() {
	local file=$DIST_PATH/.bashrc
	if [ -f "$file" ]; then
	file_name=`basename $file`

	rm -rf $HOME/$file_name
	# cp -r -v $file $HOME/$file_name
	ln --symbolic --force --no-dereference $file $HOME/$file_name
  fi
}

# TODO task_install_deps() {

# runner
# ---
main "$@"
