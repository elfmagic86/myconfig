
SOURCE_DIR=$LOCAL_GITHUB_BASE/qutebrowser
if [ ! -d "$SOURCE_DIR" ]; then
	# clone
	git clone https://github.com/qutebrowser/qutebrowser.git $SOURCE_DIR
fi

# 1. required
sudo apt install libglib2.0-0 libgl1 libfontconfig1 libx11-xcb1 libxi6 libxrender1 libdbus-1-3
sudo apt-get install tox
# https://qutebrowser.org/doc/install.html#tox6

# 2. local dependencies(not systemwide)
cd $SOURCE_DIR
tox -e mkvenv-pypi-old

# 3. doc
sudo apt install --no-install-recommends asciidoc source-highlight
sudo apt-get install python-pygments
python3 scripts/asciidoc2html.py

# usage
# bin/qutebrowser 참고
# .venv/bin/python3 -m qutebrowser
