cd musl
make clean
./configure --prefix=/usr/local/musl
make -j8
make install DESTDIR=../boot/rootfs
cd ..


