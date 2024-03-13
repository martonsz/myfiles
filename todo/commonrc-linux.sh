# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# X server $DISPLAY
# https://x410.dev/cookbook/wsl/using-x410-with-wsl2/
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f /etc/resolv.conf ]; then
    if grep -q nameserve /etc/resolv.conf ; then
        DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2; exit;}'):0.0
        export DISPLAY
    fi
fi