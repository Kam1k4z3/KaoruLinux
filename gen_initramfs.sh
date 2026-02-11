cd boot/rootfs
mkdir -p etc
rm etc/profile
# touch etc/profile
# echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> etc/profile
cp ../profile etc/profile
rm etc/passwd
touch etc/passwd
echo "root:x:0:0:root:/root:/bin/oksh" >> etc/passwd
rm etc/group
tee -a etc/group <<EOF
root:x:0:
bin:x:1:
daemon:x:2:
sys:x:3:
wheel:x:10:root
EOF
rm etc/shadow
touch etc/shadow
echo "root:::0:99999:7:::" >> etc/shadow
mkdir -p ./root
chmod 700 ./root
cp ../setup_net.sh kaoru/setup_net
chmod +x kaoru/setup_net
cp ../init init
cp ../pers-init pers-init
chmod +x pers-init
chmod +x init
mkdir -p usr/kmaps
cp ../kmaps/*.kmap usr/kmaps 
mkdir -p boot
mkdir -p boot/limine
sudo cp ../limine/limine boot/limine/
sudo chmod +x boot/limine/limine
cp ../limine/limine-bios.sys boot/limine
cp ../limine/BOOTX64.EFI boot/limine
cp ../limine/limine.conf boot/limine/limine.conf
# sudo cp /usr/lib/syslinux/bios/*.c32 boot/syslinux/
# sudo cp /usr/lib/syslinux/bios/mbr.bin boot/syslinux/
cp ../bzImage boot/vmlinuz
rm ../init.cpio
find . | cpio -o -H newc > ../init.cpio
cd ../../
