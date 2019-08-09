PROJDIR=${HOME}/software
LOCALDIR=${PROJDIR}/local 

#check if specified directory exists or needs to be created
if [ ! -d "${PROJDIR}" ]; then
  mkdir -p ${PROJDIR}
  mkdir ${PROJDIR}/build
  mkdir ${LOCALDIR}
fi

echo "INFO: Building automake (1.16)" 

cd ${PROJDIR}/build
curl http://ftp.gnu.org/gnu/automake/automake-1.16.tar.gz -o ${PROJDIR}/build/automake-1.16.tar.gz
tar xvzf automake-1.16.tar.gz 

cd ${PROJDIR}/build/automake-1.16
./configure --prefix=${LOCALDIR}

make
make install
