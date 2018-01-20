
# install
# ---

# download
rep_path=~/.neofetch
if [ ! -d $rep_path ]; then
	git clone https://github.com/dylanaraps/neofetch $rep_path
fi

# install
if [ ! -x "$(command -v neofetch)" ]; then
	cd $rep_path
	sudo make install

	# uninstall
	# make uninstall
fi



# usage
# ---

# neofetch 명령으로 사용, 아래 설정으로 추가정보얻을수있음.
# ~/.config/neofetch/config.conf
