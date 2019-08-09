#!/bin/bash


if [ -z "$1" ]; then
  PROJDIR=${HOME}/software/test_libtool
else
  PROJDIR=${HOME}/software/$1
fi
LOCALDIR=${PROJDIR}/local

echo ${PROJDIR}

# check if specified directory exists or needs to be created
if [ -d "${PROJDIR}" ]; then
  rm -r ${PROJDIR}
fi  

mkdir -p ${PROJDIR}
mkdir ${PROJDIR}/build
mkdir ${LOCALDIR}


echo "INFO: Building libtool (2.4.6)"

cd ${PROJDIR}
git clone git://git.savannah.gnu.org/libtool.git ./build

cd ${PROJDIR}/build
./configure --prefix=${LOCALDIR}
make
make install
