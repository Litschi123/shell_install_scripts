PROJDIR=${HOME}/software
LOCALDIR=${PROJDIR}/local

echo "INFO: Start device tree compiler"
cd ${PROJDIR}/build
git clone git.kernel.org/pub/scm/utils/dtc/dtc.git
cd dtc
make PREFIX=${LOCALDIR} NO_PYTHON=1 install

echo "INFO: Building gperf perfect hashing"
cd ${PROJDIR}/build
git clone git://git.savannah.gnu.org/gperf.git
cd gperf
./autogen.sh
./configure --prefix=$LOCALDIR
sed -i -e 's/all : info pdf html man/all : info html man/' doc/Makefile
make
make install

