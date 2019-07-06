sudo snap install tmux --classic

if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

###
# https://github.com/tmux-plugins/tpm
echo '`prefix + I` To install package in `~/.tmux.conf`'

