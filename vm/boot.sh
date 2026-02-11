qemu-system-x86_64 \
    -m 256M \
    -cdrom kaoru_installer.iso \
    -drive file=kaoru_hd.img,format=raw \
    -boot d
