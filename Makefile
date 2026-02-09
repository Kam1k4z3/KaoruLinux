qemu:
	qemu-system-x86_64  -kernel boot/bzImage -initrd boot/init.cpio -nographic -append "console=ttyS0 init=/init"


