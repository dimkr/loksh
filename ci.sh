#!/bin/sh -xe

jobs=`grep ^processor /proc/cpuinfo | wc -l`
make -j$jobs
make DESTDIR=dst install
[ "`./dst/usr/bin/ksh -c 'echo $((1337 * 2))'`" -ne 2674 ] && exit 1
[ "`./dst/usr/bin/ksh -c 'seq 1337 | sort -rn | head -n 1'`" -ne 1337 ] && exit 1
make clean
CC=clang make -j$jobs
