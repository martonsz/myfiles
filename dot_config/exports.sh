export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
if hash nvim 2> /dev/null; then
    export EDITOR=nvim
elif hash vim 2> /dev/null; then
    export EDITOR=vim
fi

export JABBA_HOME="$HOME/.local/bin/jabba"
[ -s "$JABBA_HOME/jabba.sh" ] && source "$JABBA_HOME/jabba.sh"

export NAS_BASE_DIR=/zfs-pool/nas