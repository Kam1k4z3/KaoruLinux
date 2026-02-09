cd oksh
make clean
CC=musl-gcc ./configure --static
CC=musl-gcc make -j$(nproc)
mkdir -p ../../boot/rootfs/kaoru
cp oksh ../../boot/rootfs/kaoru/oksh
cd ..

