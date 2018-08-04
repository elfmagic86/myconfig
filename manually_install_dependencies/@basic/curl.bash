# ORIGIN: https://gist.github.com/fideloper/f72997d2e2c9fbe66459

#




cd /tmp
wget http://curl.haxx.se/download/curl-7.52.1.tar.bz2
tar -xvjf curl-7.52.1.tar.bz2
cd curl-7.52.1



sudo apt install libssl-dev
./configure


make
sudo make install

# Resolve any issues of C-level lib
# location caches ("shared library cache")
sudo ldconfig
