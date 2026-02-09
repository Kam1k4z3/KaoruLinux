cd tinycc
make clean
CC=musl-gcc ./configure --prefix=/usr --extra-cflags="-static" --extra-ldflags="-static"
make -j8
make install DESTDIR=../boot/rootfs
cd ..

