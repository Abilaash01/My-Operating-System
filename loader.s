.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .quad MAGIC
    .quad FLAGS
    .quad CHECKSUM

.section .text
.extern kernelMain
.global loader

loader:
    mov $kernel_stack, %rsp   # Use %rsp for 64-bit stack pointer
    pushq %rax                # Use 'pushq' for 64-bit operand size
    pushq %rbx                # Use 'pushq' for 64-bit operand size
    call kernelMain

_stop:
    cli
    hlt
    jmp _stop

.section .bss
.space 2*1024*1024           # 2MB
kernel_stack:
