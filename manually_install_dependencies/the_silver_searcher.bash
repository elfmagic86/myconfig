
SOURCE_DIR=~/github_sources/the_sliver_searcher
if [ ! -d "$SOURCE_DIR" ]; then
	# clone
	git clone https://github.com/ggreer/the_silver_searcher.git $SOURCE_DIR

	cd $SOURCE_DIR

	# version
	git fetch
	git checkout 2.1.0

	# required
	sudo apt-get install -y libpcre3-dev liblzma-dev
fi

cd $SOURCE_DIR
# build
./build.sh

# install
sudo make install
