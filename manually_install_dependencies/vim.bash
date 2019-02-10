# vim
# ===

# vim
# ---

# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

# 1.source
if [ ! -d $LOCAL_GITHUB_BASE/vim ]; then
    git clone https://github.com/vim/vim $LOCAL_GITHUB_BASE/vim
fi

cd $LOCAL_GITHUB_BASE/vim

# 2. version
git fetch
git checkout v8.1.0877

# 2. Remove vim if you have it already.
sudo apt-get remove vim vim-runtime gvim

# 3. ready to build
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

# 3.1 libruby
# ruby-dev이 rvm으로 설치되었을시..
# ruby2.4를 사용중이라 아래 설치함
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.4-dev

# libruby를 일반적인 사용 경로 로 복사해줌
#   locate libruby
#   ld -lruby --verbose # build시에 gnu linker가 찾을수있어야함
#       export LIBRARY_PATH="/home/kang/.rvm/rubies/ruby-2.4.0/lib" # 만약 아래로 복사했는데못찾는다면 ld에게 위치명시해줄수있음
sudo cp ~/.rvm/rubies/ruby-2.4.0/lib/libruby.so* /usr/lib


# 4. build
# NOTE: python2.7, python3.5 config는 시스템마다 다를수있어서 정확한 위치를 찾아서 지정해줘야함
make distclean
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
# 5. deploy
sudo make install
