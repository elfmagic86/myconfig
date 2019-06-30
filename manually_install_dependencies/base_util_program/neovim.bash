#
# install
# ---

SOURCE_DIR="$GCE_GITHUB_SRC"/neovim
if [ ! -d "$SOURCE_DIR" ]; then
	# clone
	git clone https://github.com/neovim/neovim.git $SOURCE_DIR

	cd $SOURCE_DIR


	# prerequisites
	# Note: libtool-bin is only required for Ubuntu 16.04/Debian Jessie and newer.
	sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip gettext
fi


# cwd
cd $SOURCE_DIR

# version
git fetch
git checkout v0.3.4

export VERBOSE=1 DEBUG=0

# clean
make clean
make distclean
rm -rf build/
rm -rf .deps

# 의존성
make deps

# 빌드
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release

# uninstall
sudo rm -rf /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim/
sudo rm -rf $HOME/neovim # custom

# 로컬 설치
make install

# 확인
nvim -version

# optional
# sudo pip2 uninstall pynvim neovim
sudo pip2 install pynvim neovim

# sudo pip uninstall pynvim neovim
sudo pip install pynvim neovim

gem update neovim
npm install -g neovim

# wsl clipboard, win32yank.exe를 설치해야함
if $GCE_IS_WSL; then
	sudo ln -s $(which win32yank.exe) /usr/bin/win32yank
fi
