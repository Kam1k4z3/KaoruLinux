# **KaoruLinux 🌸**

A minimal, bare-bones Linux distribution environment featuring **BusyBox**, **musl libc**, and the **Tiny C Compiler (TCC)**.


**🛠 Features**

* **Kernel:** Upstream Linux Kernel.  
* **Base Utilities:** [BusyBox](https://busybox.net/) (multi-call binary for standard UNIX tools).  
* **C Library:** [musl libc](https://musl.libc.org/) (lightweight, fast, and simple).  
* **Compiler:** [TCC](https://bellard.org/tcc/) (Tiny C Compiler) for on-target ANSI C development.  
* **Shell:** oksh (OpenBSD Korn Shell port) as the default interactive shell.



**Build Instructions**

Follow these steps to compile the kernel and assemble the root filesystem.

### **1\. Prerequisites & Kernel Compilation**

Clone the repository and initialize the submodules. It is recommended to use an x86\_64 host.

Bash

\# Clone submodules (shallow clone for the kernel to save space)  
`git submodule update --init --depth=1`

\# Compile the Linux Kernel  
`cd linux/`  
`make -j$(nproc)`  

\# The bzImage will be generated in arch/x86/boot/bzImage (for x86\_64)  

### **2\. BusyBox Setup**

BusyBox provides the core userland utilities.

1. Enter the busybox/ directory.  
2. Run make menuconfig.  
3. Enable Settings \-\> Build static binary (no shared libs).  
4. Run `make -j$(nproc)`  
5. Return to the root folder and run `./fill_rootfs.sh` to populate the directory structure.

### **3\. C Library & Compiler**

KaoruLinux uses **musl** and **TCC**.

* **musl libc:** Run `./compile_musl.sh` 
* **TCC:** Ensure you have the musl-gcc wrapper installed on your **host** system (via your distro's package manager).**Note:** Do not use the musl-gcc generated from the local musl source; use the system-provided binary.  
* Run `./compile_tcc.sh`

### **4\. Shell & Final Assembly**

To ensure compatibility with the provided boot/init and boot/profile:

1. Compile oksh by running `utilities/compile_oksh.sh`. This places the binary in boot/rootfs/kaoru.  
2. Generate the initramfs: `./gen_initramfs.sh`

**Testing**

You can easily test your build using **QEMU**:

```bash
make qemu
```

## ---

**📝 Notes**

* **linuxrc:** You can safely remove the linuxrc file from boot/rootfs as it is not strictly necessary for this initramfs setup.  
* **Static Linking:** Always ensure userland tools are statically linked if you haven't properly configured the dynamic linker path in the rootfs.

