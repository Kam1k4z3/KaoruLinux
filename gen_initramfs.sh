cd boot/rootfs
rm ../init.cpio
find . | cpio -o -H newc > ../init.cpio
cd ../../
