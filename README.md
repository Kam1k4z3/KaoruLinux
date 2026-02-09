# KaoruLinux
### Bare bones linux kernel setup
KaoruLinux is a very bare bones linux kernel setup that includes BusyBox for utility commands, musl for the standard C library and tcc (TinyC-Compiler) as ANSI C compiler and linker
---------------------------
### How to compile
First of all, you need a kernel image to run the setup. You can get the upstream kernel from the GitHub mirror using `git submodules --init`. This will clone every needed submodules. For Linux you can use `--depth=1` so it won't copy all the git repo history. After running the command to init submodules, cd into linux/ and run `make -j$(nproc)`, you will find a `bzImage` kernel image into the arch/ folder for your host architecture. I raccoment using x86_64 images as I build this setup on my x86_64 host. 
After compiling the kernel, you need to compile BusyBox, this can be done by entering the busybox/ folder, running `make menuconfig`, flagging the "Build static binary options" (required to not have problems with dynamic libraries) and then running `make -j$(nproc)`. You can now populate the rootfs by running `fill_rootfs.sh` in the main folder.
Now, compile musl, an alternative libc. To compile musl just run `compile_musl.sh`.
Now, compile tinyc-compiler, to compile tcc, you need to have the musl libc package installed, so that you have `musl-gcc`. You mustn't use `musl-gcc` that the musl source generates, you have to use the one provided with musl package binaries. When you have `musl-gcc`, you can run `./compile_tcc.sh`.
To keep things simple but working, I chose to use oksh as a replace for the classic sh shell. If you don't want to edit boot/init and boot/profile, you need to compile oksh from utilities/oksh by using `compile_oksh.sh` in utilities/, this will add the oksh binary in boot/rootfs/kaoru.
Now, run `gen_initramfs.sh` and you're ready to go! You can test KaoruLinux with QEMU by running `make qemu`.
NOTES: You can remove `linuxrc` file from boot/rootfs as it is not necessary.
