#!/bin/bash

if [ -z "$1" ]; then
  PROJDIR=${HOME}/software
else
  PROJDIR=${HOME}/software/$1
fi
LOCALDIR=${PROJDIR}/local

echo ${PROJDIR}

#check if specified directory exists or needs to be created
if [ ! -d "${PROJDIR}" ]; then
  mkdir -p ${PROJDIR}
  mkdir ${PROJDIR}/build
  mkdir ${LOCALDIR}
fi

echo "INFO: Building autoconf (2.69)"

cd ${PROJDIR}/build
curl http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz -o autoconf-2.69.tar.gz
tar xvzf autoconf-2.69.tar.gz

cd ${PROJDIR}/build/autoconf-2.69
./configure --prefix=${LOCALDIR}
make
make install
