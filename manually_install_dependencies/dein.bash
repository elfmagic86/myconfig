
vim_dein_dir=~/.vim/dein
if [ ! -d $vim_dein_dir ]; then
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
	sh /tmp/installer.sh $vim_dein_dir
fi
