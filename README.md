# **KaoruLinux 🌸**

A minimal, bare-bones Linux distribution environment featuring **BusyBox**, **musl libc**, and the **Tiny C Compiler (TCC)**.


**🛠 Features**

* **Kernel:** Upstream Linux Kernel.  
* **Base Utilities:** [BusyBox](https://busybox.net/) (multi-call binary for standard UNIX tools).  
* **C Library:** [musl libc](https://musl.libc.org/) (lightweight, fast, and simple).  
* **Compiler:** [TCC](https://bellard.org/tcc/) (Tiny C Compiler) for on-target ANSI C development.  
* **Shell:** oksh (OpenBSD Korn Shell port) as the default interactive shell.

**Required Manual Steps**

Kernel and BusyBox manual compilation are required.

### **1\. Prerequisites & Kernel Compilation**

Clone the repository and initialize the submodules. It is recommended to use an x86\_64 host.

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

**Build Instructions**

Run `genall`

**Testing**

You can easily test your build using **QEMU**:

```bash
make qemu
```

## ---

**📝 Notes**

* **linuxrc:** You can safely remove the linuxrc file from boot/rootfs as it is not strictly necessary for this initramfs setup.  
* **Static Linking:** Always ensure userland tools are statically linked if you haven't properly configured the dynamic linker path in the rootfs.

