qemu:
#	qemu-system-x86_64  -kernel boot/bzImage -initrd boot/init.cpio -nographic -append "console=ttyS0 init=/init"
	qemu-system-x86_64 -kernel boot/bzImage -initrd boot/init.cpio -nographic -append "console=ttyS0 init=/live-init" -netdev user,id=n1 -device virtio-net-pci,netdev=n1
#	qemu-system-x86_64 -kernel boot/bzImage -initrd boot/init.cpio -nographic -append "console=ttyS0 rdinit=/boot/live-init" -netdev user,id=n1 -device virtio-net-pci,netdev=n1
