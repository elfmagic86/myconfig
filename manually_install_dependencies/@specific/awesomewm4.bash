# install awesome4.1
# ===
#
# NOTE: this script is aggregation of sub task. Not one task script
#
# GOAL: Install awesomewm 4.1
#
# GOAL_RESULT:
#   $ awesome -v
#   awesome v4.1 (Technologic)
#    • Compiled against Lua 5.3.1 (running with Lua 5.3)
#    • D-Bus support: ✔
#    • execinfo support: ✔
#    • xcb-randr version: 1.4
#    • LGI version: 0.9.1
#
# ENV: Ubuntu 16.04
#
# STEP:
#   1. install dependencies
#   2. install awesome4.1
#     - clone git and move versoin 4.1
#     - make package and dpkg install
#     - config file
#     : reference /doc/ubuntu/settings_awesomewm
#
# USAGE:
#   bash awesomewm4.bash deps1
#   bash awesomewm4.bash deps2
#   bash awesomewm4.bash deps3
#   bash awesomewm4.bash deps4
#   bash awesomewm4.bash deps5 # doc 관련 설치안함
#
#   bash awesomewm4.bash install4_1
#   bash awesomewm4.bash install4_2

# OPTIONAL:
#   bash awesomewm4.bash install_default_widget


AM_PROJECT_PATH=~/.awesome
AM_CONFIG_PATH=~/.config/awesome

main() {
    local task=$1

    echo task: $task
    $task
}

# 1. install dependencies
# ---

# lua 5.3, lgi
deps1() {
    # lua 5.3
    # https://zetawiki.com/wiki/우분투16_Lua_설치
    sudo apt-get install lua5.3 liblua5.3-0 liblua5.3-dev
    ln -s /usr/bin/lua5.3 /usr/bin/lua
    ln -s /usr/bin/luac5.3 /usr/bin/luac

    # # lualock
    sudo apt-get install libgirepository1.0-dev

    cd /tmp
    if [ ! -d /tmp/luarocks-2.4.1 ]; then
        wget https://luarocks.org/releases/luarocks-2.4.1.tar.gz
        tar zxpf luarocks-2.4.1.tar.gz
    fi
    cd luarocks-2.4.1
    ./configure; sudo make bootstrap
    cd /tmp && rm -rf luarocks-2.4.1*

    # lgi
    sudo luarocks install lgi
}

# glib, libcairo2-dev
deps2() {
    # glib
    # https://ubuntuforums.org/showthread.php?t=1607632
    # TODO 동작은 무리없지만 버전이 모호하다
    # ldd --version 으로 확인가능
    sudo apt-get install \
    glib2.0

    # https://www.reddit.com/r/linuxquestions/comments/5azs7a/cannot_install_cairo_or_pango_libraries/
    # dev 설치위해 다운그레이드시킴: libcairo2, libcairo-gobject2
    sudo apt-get install \
    libcairo2=1.14.6-1 \
    libcairo-gobject2=1.14.6-1

    sudo apt-get install \
    libcairo2-dev
}

# xcb
deps3() {
    # https://unix.stackexchange.com/questions/338628/no-package-xcb-xrm-found
    sudo add-apt-repository ppa:aguignard/ppa
    sudo apt-get update
    sudo apt-get install libxcb-xrm-dev

    # https://unix.stackexchange.com/questions/338519/how-to-install-libxcb/338540
    local deps=(
    xcb
    libxcb-randr0-dev
    libxcb-xtest0-dev
    libxcb-xinerama0-dev
    libxcb-xkb-dev
    )

    # make에러 나온것을 apt-cache search 로 찾은것들
    deps+=(
    libxcb-cursor-dev libxcb-cursor0
    libxcb-shape0
    libxcb-shape0-dev

    libxcb-util-dev

    libxcb-keysyms1
    libxcb-keysyms1-dev

    libxcb-icccm4
    libxcb-icccm4-dev
    )

    sudo apt-get install "${deps[@]}"
}

# else
deps4() {
    sudo apt-get install \
    libgdk-pixbuf2.0

    sudo apt-get install \
    libxkbcommon-dev \
    libxkbcommon-x11-0 \
    libxkbcommon-x11-dev \
    libxkbcommon0

    sudo apt-get install \
    libstartup-notification0 \
    libstartup-notification0-dev

    sudo apt-get install \
    libxdg-basedir-dev \
    libxdg-basedir1 \
    libxdg-basedir1-dbg

    # dbus
    sudo apt-get install \
    libdbus-1-3 \
    libdbus-1-dev \
    libdconf-dbus-1-0 \
    libdconf-dbus-1-dev \
    libdleyna-connector-dbus-1.0-1 \
    libdleyna-connector-dbus-1.0-dbg
}

# doc, 설치할게 너무많다. 안함
deps5() {
    # sudo apt-get install asciidoc xmlto
    echo none
}

# install awesome
# ---
_clone_and_move_rep() {
    # clone
    if [ ! -d $AM_PROJECT_PATH ]; then
        git clone https://github.com/awesomeWM/awesome.git $AM_PROJECT_PATH
    fi

    cd $AM_PROJECT_PATH
}

install4_1() {
	_clone_and_move_rep

    # 4.1
    git checkout tags/v4.1

    # build and deploy
    # NOTE: 만약 make에서 에러난다면 의존성 설치가 잘못된것, 에러난것보고 고쳐야함
    rm -rf .buiil*
    make package

    sudo dpkg -i .build*/awesome*.deb

    mkdir -p ~/.config/awesome
    cp --backup=number ./awesomerc.lua ~/.config/awesome/rc.lua

    sudo cp ./awesome.desktop /usr/share/xsessions/awesome.desktop
}

install4_2() {
	_clone_and_move_rep

    # 4.2
    git checkout tags/v4.2

	make clean

	make
	make package
	sudo dpkg -i $(echo ./build*/awesome*.deb)
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
main "$@"
