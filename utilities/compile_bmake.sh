cd bmake
CFLAGS="-static -fcommon" LDFLAGS="-static" CC=musl-gcc ./configure --prefix=/usr
sh ./make-bootstrap.sh
cp bmake ../../boot/rootfs/kaoru/bmake
cp -r ./mk ../../boot/rootfs/usr/share/mk
cd ..
