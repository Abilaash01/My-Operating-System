# Minimal Operating System Kernel Template

This project implements a minimal operating system template designed to explore low-level system bring-up, bootloader–kernel interaction, and freestanding kernel development using C/C++ and assembly. The goal is to provide a clear and controlled foundation for experimenting with core operating system concepts without relying on an existing OS or standard runtime.

The build system is intentionally Make-based to provide explicit control over compilation, linking, and binary layout—an essential requirement when working close to hardware.

---

## Project Structure

```text
.
├── kernel/   # Freestanding kernel source code (C/C++)
├── loader/   # Bootloader and early initialization code
├── Makefile  # Object compilation rules
├── makefile  # Kernel image linking rules
└── README.md
```


---

## Boot Flow Overview

### 1. Bootloader Initialization
The bootloader performs early system setup and prepares the execution environment required by the kernel. This includes initializing the stack and transferring control to the kernel entry point.

### 2. Kernel Entry
The kernel is compiled as freestanding code and begins execution without access to a host operating system or standard library. This stage serves as the foundation for implementing additional kernel subsystems.

### 3. Controlled Execution Environment
The kernel runs in a minimal environment intended for experimentation, debugging, and incremental development of operating system functionality.

---

## Build System

The operating system is built using GNU Make to explicitly control each stage of compilation and linking.

---

### Build Steps

bash
```make kernel.o```
```make loader.o```
```make -f makefile mykernel.bin```

kernel.o — Compiles the freestanding kernel object.

loader.o — Compiles the bootloader and early initialization code.

mykernel.bin — Links the bootloader and kernel into a bootable binary image.

---

## Installation
```make install```

The install target installs the generated kernel image into the configured boot path or test environment, allowing it to be executed under an emulator or controlled runtime setup.
