cd ../build
make -j
cd ../bin
./createDisk /tmp/dsk 1000
./mksofs /tmp/dsk 
./testtool /tmp/dsk -b -r 443-443 -p 443-443