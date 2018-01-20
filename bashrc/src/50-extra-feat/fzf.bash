
# fzf
export FZF_DEFAULT_COMMAND='ag --hidden -U -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# color: https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS='
--height 60% --reverse --border
--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:174
'

# issue: https://github.com/junegunn/fzf/issues/809
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export FZF_DEFAULT_OPTS+='--no-height'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
