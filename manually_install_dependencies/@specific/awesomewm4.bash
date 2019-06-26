#!/bin/bash

install4_2() {
	sudo apt-get install awesome
}

# optional
# ---

install_default_widget() {
	# 0.icons
    if [ ! -d ~/github_sources/arc-icon-theme ]; then
        git clone https://github.com/horst3180/arc-icon-theme --depth 1 ~/github_sources/arc-icon-theme
		cd ~/github_sources/arc-icon-theme
		./autogen.sh --prefix=/usr
		sudo make install
	fi

	# 1. https://github.com/streetturtle/awesome-wm-widgets
    if [ ! -d $AM_CONFIG_PATH/awesome-wm-widgets ]; then
        git clone https://github.com/streetturtle/awesome-wm-widgets $AM_CONFIG_PATH/awesome-wm-widgets
    fi
	# rc.lua 에 사용할 위젯 import 해줘야함

	# 1.1 배터리
	sudo apt-get install acpi

	# 1.2 볼륨위젯
	# - on/off 이미지변경
	cd $AM_CONFIG_PATH/awesome-wm-widgets/volume-widget
	cd /usr/share/icons/Arc/status/symbolic &&
	sudo cp audio-volume-muted-symbolic.svg audio-volume-muted-symbolic_red.svg &&
	sudo sed -i 's/bebebe/ed4737/g' ./audio-volume-muted-symbolic_red.svg
	# - usage
	#	마우스클릭: on/off 토글
	#	스크롤: 볼륨조정

	# 1.3 cpu_widget
	# 1.4 ram_widget

}

# run main
# ---
install4_2
install_default_widget
