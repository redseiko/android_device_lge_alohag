#!/system/bin/sh

d=/data/misc/bluetoothd
for f1 in `ls $d`; do
    chown bluetooth $d/$f1
    chmod 775 $d/$f1

    for f2 in `ls $d/$f1`; do
        chown bluetooth $d/$f1/$f2
        chmod 664 $d/$f1/$f2
    done
done
