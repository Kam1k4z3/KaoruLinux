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
rm ../init.cpio
find . | cpio -o -H newc > ../init.cpio
cp ../init init
chmod +x init
cd ../../
