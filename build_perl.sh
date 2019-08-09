#!/bin/bash

PROJDIR=${HOME}/software
if [ ! -z "$1" ]; then
  PROJDIR=${PROJDIR}/$1
fi
LOCALDIR=${PROJDIR}/local

echo ${PROJDIR}

#check if specified directory exists or needs to be created
if [ ! -d "${PROJDIR}" ]; then
  mkdir -p ${PROJDIR}
  mkdir ${PROJDIR}/build
  mkdir ${LOCALDIR}
fi

echo "INFO: Building perl (5.30.0)"

cd ${PROJDIR}/build
wget https://www.cpan.org/src/5.0/perl-5.30.0.tar.gz
tar -xzf perl-5.30.0.tar.gz
#curl https://www.cpan.org/src/5.0/perl-5.30.0.tar.gz -o perl-5.30.0.tar.gz
#tar xvzf perl-5.30.0.tar.gz

cd ${PROJDIR}/build/perl-5.30.0
./Configure -des -Dprefix=${LOCALDIR}
make
make test
make install
#./configure --prefix=${LOCALDIR}
#make
#make install
