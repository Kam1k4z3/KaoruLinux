rm -rf boot/rootfs
mkdir boot/rootfs
cd busybox
make CONFIG_PREFIX=../boot/rootfs install
cd ..
