# tmux 2.5
# ---
# 의존성
sudo apt-get install libevent-dev
sudo apt-get install libncurses5-dev libncursesw5-dev

# 설치
mkdir -p __tmp__ && cd __tmp__

wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
tar -xf tmux-2.5.tar.gz

cd tmux-2.5
./configure && make
sudo make install
cd ..

cd .. && rm -rf __tmp__

# TODO make install의 로그 의미를 모르겠다. install은 제대로 된 것 같은데
# make[1]: Nothing to be done for 'install-data-am'
