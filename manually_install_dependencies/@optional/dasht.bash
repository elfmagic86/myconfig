# https://github.com/sunaku/dasht
# ===

# install
# ---

# dep
sudo apt-get install -y sqlite3 libsqlite3-dev wget w3m w3m-img socat

# dev dep
# gem install binman md2man

# down
git clone https://github.com/sunaku/dasht.git ~/.dasht

# setup
# --

# 수작업
# bin, man path 등록
# export PATH=$PATH:location_where_you_cloned_or_downloaded_dasht/bin
# export MANPATH=location_where_you_cloned_or_downloaded_dasht/man:$MANPATH

# TODO 현재(20170805) dotset 다운받을수없음: https://github.com/sunaku/dasht/issues/23
# zeal로 받은것으로 사용함
# export DASHT_DOCSETS_DIR=~/.local/share/Zeal/Zeal/docsets/
