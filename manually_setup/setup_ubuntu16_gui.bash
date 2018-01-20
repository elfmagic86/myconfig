# ubuntu16 GUI 기본 설정
# ===

# keysettings
# capslock, ralt to metakey
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape', 'compose:ralt']"

# enable workspace
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 1
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4

# keyboard delay
gsettings set org.gnome.desktop.peripherals.keyboard delay 300
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15

# enable launcher autohide
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
# launcher bottom
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

# disable hud shortcut
dconf write /org/compiz/integrated/show-hud '[""]'

# 한글설정, 깜빡임제거
# NOTE: 수작업 해야함.(.old/setting/settings)
