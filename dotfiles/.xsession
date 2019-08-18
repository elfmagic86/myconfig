#!/bin/bash

# TODO awesome -> ubuntu -> awesome 전환시 1. ibus engine 2. ~/.xsession 재실행 필요함

# https://wiki.debian.org/Xsession
# run by xclient
# - awesomewm4.2: /home/kang/.config/awesome/rc.lua
# - ubuntu18.04: /home/kang/.config/autostart/gnome-session-startup.desktop

# key delay
xset r rate 200 80

# keycode rebinding
if ! grep -q Microsoft /proc/version; then # !is_wsl
    /usr/bin/xmodmap $HOME/.xmodmap_escape

    if uname -a | grep -q Y540; then # is_y540
        # - touchpad tap to click(todo https://wiki.archlinux.org/index.php/Touchpad_Synaptics)
        # xinput list             xinput list-props <device-name>
        xinput set-prop "MSFT0001:01 06CB:CD5F Touchpad" "libinput Tapping Enabled" 1

        # - numlock on
        numlockx on

        # - numpad key mapping
        /usr/bin/xmodmap $HOME/.xmodmap_numpad
    fi
fi


# --------------
# todo x -> 복합윈도우매니저(wayland, mir)
#     서버(중재자) -> 직접 디스플레이 메모리에 윈도우내용 표현
# todo startup 프로그램 제어
# todo xmodmaap -> setxkbmap(특정 키보드별 설정위해)

# 상태확인 xset -q

