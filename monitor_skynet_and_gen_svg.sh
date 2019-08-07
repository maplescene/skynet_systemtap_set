#/bin/sh
if [ "$1" = "" ] | [ "$2" = "" ] | [ "$3" = "" ] | [ "$4" = "" ]; then
    echo "usage: monitor pid skynet_bin_path service_id_in_decimal seconds"
    exit 1
fi
sudo stap -v mini_lua_bt.stp --skip-badvars -x $1 $2 $3 $4 -g --suppress-time-limits -DMAXSTRINGLEN=65536 |tee a.bt

./flamegraph.pl --height=30 --width=1200 --fontsize=10 --minwidth=5 a.bt >skynet.svg
