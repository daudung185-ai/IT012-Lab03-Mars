# IT012 Lab 03 - Ma nguon 1: Khao sat thanh ghi va so bu hai
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
# Bat dau tai 0x00400000; sau 5 lenh: pc = 0x00400014
.text
.globl main
main:
    addi $t0, $zero, 12      # $t0 = 12 (0x0c)
    addi $t1, $zero, 30      # $t1 = 30 (0x1e)
    add  $t2, $t0, $t1       # $t2 = 42 (0x2a)
    addi $zero, $zero, 5     # $zero van la 0
    add  $t3, $zero, $t2     # $t3 = 42 (0x2a)

    li   $v0, 10
    syscall
