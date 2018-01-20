

# install
# ---

# download
rep_path=~/.tig
if [ ! -d $rep_path ]; then
	git clone https://github.com/jonas/tig.git $rep_path
fi


# install
# https://github.com/jonas/tig/blob/master/INSTALL.adoc
if [ ! -x "$(command -v tig)" ]; then

	cd $rep_path

	# configure를 빼면 한글이깨짐
	make configure
	./configure

	make prefix=/usr/local
	sudo make install prefix=/usr/local

	# manual install
	make install-release-doc # required tool 설치안하고 doc만 설치.
fi

# usage
# ---

# tig 명령.
