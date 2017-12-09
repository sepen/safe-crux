#!/usr/bin/env bash

[ -z $DESTDIR ] && export DESTDIR=
[ -z $PREFIX ]  && export PREFIX=/usr/local
[ -z $BINDIR ]  && export BINDIR=${PREFIX}/bin
[ -z $DATADIR ] && export DATADIR=${PREFIX}/scx

install -v -d ${DESTDIR}${BINDIR}
sed "s|BASEDIR=.*|BASEDIR=${DATADIR}|" safe-crux.wrapper.in > ${DESTDIR}${BINDIR}/safe-crux
chmod 0755 ${DESTDIR}${BINDIR}/safe-crux
ln -vsf safe-crux ${DESTDIR}${BINDIR}/scx
install -v -d ${DESTDIR}${DATADIR}
install -v -m 0755 safe-crux ${DESTDIR}${DATADIR}/safe-crux
install -v -m 0644 safe-crux.conf ${DESTDIR}${DATADIR}/safe-crux.conf
cp -vr bin lib scx.d var ${DESTDIR}${DATADIR}
