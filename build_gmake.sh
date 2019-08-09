#!/bin/bash

PROJDIR=${HOME}/software
LOCALDIR=${PROJDIR}/local

echo "INFO: Building GNU make (4.2.1)"
cd ${PROJDIR}/build
curl http://ftp.gnu.org/gnu/make/make-4.2.1.tar.gz -o make-4.2.1.tar.gz
tar xvzf make-4.2.1.tar.gz
cd ./make-4.2.1
./configure --prefix=$LOCALDIR
make
make install
