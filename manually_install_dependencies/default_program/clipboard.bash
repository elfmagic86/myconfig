if [ -x `which win32yank` ]; then
	echo "wsl using win32yank" # for neovim
else
	sudo apt-get install xclip xsel
fi
