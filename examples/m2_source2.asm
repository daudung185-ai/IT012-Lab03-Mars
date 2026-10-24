# IT012 Lab 03 - Ma nguon 2: Phep cong dau tien
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
# Ket qua: $t0 = 12, add $t0, $t1, $t2 co ma may 0x012a4020 tai 0x00400008
.text
.globl main
main:
    addi $t1, $zero, 7
    addi $t2, $zero, 5
    add  $t0, $t1, $t2

    li   $v0, 10
    syscall
