cd busybox
make clean
make defconfig
echo "CONFIG_STATIC=y" >> .config
make -j8
cd ..
