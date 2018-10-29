#
# install
# ---

SOURCE_DIR=$LOCAL_GITHUB_BASE/neovim
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
git checkout v0.3.0

# uninstall
sudo rm -rf /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim/

sudo rm -rf $HOME/neovim # custom

# install
rm -rf build/
rm -rf .deps

VERBOSE=1 DEBUG=1

make clean
make distclean

make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release
sudo make install


echo TODO
echo '


#
# optional
# ---

# sudo pip2 install neovim -U
# sudo pip install neovim -U
# gem install neovim -U

# wsl clipboard, win32yank.exe를 설치해야함
# sudo ln -s $(which win32yank.exe) /usr/bin/win32yank
'
