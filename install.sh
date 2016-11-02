#!/usr/bin/env bash

export DESTDIR=

if [ $# -ne 0 ]; then
  [ ! -d $1 ] mkdir -p $1
  DESTDIR=$1
fi

export PREFIX=/opt
export BINDIR=${PREFIX}/bin
export DATADIR=${PREFIX}/scx

rm -f safe-crux.wrapper
sed "s|BASEDIR=.*|BASEDIR=${DATADIR}|" safe-crux.wrapper.in > safe-crux.wrapper

install -v -d ${DESTDIR}${BINDIR}
install -v -m 0755 safe-crux.wrapper ${DESTDIR}${BINDIR}/safe-crux
ln -vsf safe-crux ${DESTDIR}${BINDIR}/scx
install -v -d ${DESTDIR}${DATADIR}
install -v -m 0755 safe-crux ${DESTDIR}${DATADIR}/safe-crux
install -v -m 0644 safe-crux.conf ${DESTDIR}${DATADIR}/safe-crux.conf
cp -vr bin lib scx.d var ${DESTDIR}${DATADIR}
