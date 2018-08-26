
SOURCE_DIR=$LOCAL_GITHUB_BASE/qutebrowser
if [ ! -d "$SOURCE_DIR" ]; then
	# clone
	git clone https://github.com/qutebrowser/qutebrowser.git $SOURCE_DIR

	cd $SOURCE_DIR

	# TODO ubuntu16 설치위해 추가작업필요..
	# https://qutebrowser.org/doc/install.html#tox6
fi
