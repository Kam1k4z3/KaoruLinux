# KaoruLinux
### Bare bones linux kernel setup
KaoruLinux is a very bare bones linux kernel setup that includes BusyBox for utility commands, musl for the standard C library and tcc (TinyC-Compiler) as ANSI C compiler and linker
---------------------------
### How to compile
It is raccomended to compile on a Linux/macOS/BSD environment, if you're on Windows, stick to WSL or to a Virtual Machine.
Clone the repository using `git`, then init submodules using `git submodules --init`.
After this you want to follow this order for compiling the necessary tools:
- BusyBox (1)
- musl libc (2)
- tcc (3)
To compile BusyBox, cd into the busybox/ folder and run `make menuconfig`, under Build Settings, flag the "Compile static binary options", this is necessary because we miss some dynamic libraries BusyBox executable needs.
Now, populate rootfs using `fill_rootfs.sh`.
To compile musl, just run `compile_musl.sh`.
To compile tcc, be sure to have `musl-gcc` installed, and be sure to NOT use the one built in the previous step. Then, just run `compile_tcc.sh`.
Now, copy the `init` script from boot/ to boot/rootfs and give it exec permissions using `chmod +x boot/rootfs/init`.
If you want, you can remove `linuxrc` from boot/rootfs, it's an unecessary file.
To test the setup, just run `make qemu` and Qemu for x86_64 will be ran.
