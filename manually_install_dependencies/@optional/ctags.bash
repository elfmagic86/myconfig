# https://askubuntu.com/questions/796408/installing-and-using-universal-ctags-instead-of-exuberant-ctags

rep_path=$LOCAL_GITHUB_BASE/ctags
if [ ! -d $rep_path ]; then
    git clone https://github.com/universal-ctags/ctags.git $rep_path

    cd $rep_path
    ./autogen.sh
    ./configure
    make
    sudo make install
fi