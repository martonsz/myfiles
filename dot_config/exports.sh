if hash nvim 2> /dev/null; then
    export EDITOR=nvim
elif hash vim 2> /dev/null; then
    export EDITOR=vim
fi

export JABBA_HOME="$HOME/.local/bin/jabba"
[ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"

export NAS_BASE_DIR=/zfs-pool/nas