#!/bin/sh -ex

SRCDIR=/docker/build/keepalived
BRANCH=checker-mthread2-trusty

if [ ! -e $SRCDIR ]; then
	mkdir -p $SRCDIR 
	git clone -b $BRANCH https://github.com/azryve/keepalived.git $SRCDIR
fi

cd $SRCDIR
debuild clean
tar czf ../keepalived_`dpkg-parsechangelog --show-field Version | cut -d- -f1 | cut -d: -f2`.orig.tar.gz --exclude-vcs --exclude=./debian .
debuild -us -uc
