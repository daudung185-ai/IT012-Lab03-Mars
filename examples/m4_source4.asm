# IT012 Lab 03 - Ma nguon 4: Chuyen cau lenh thanh hop ngu MIPS (y=8, z=5, w=3)
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
# Ket qua: $t0 = 16, $t1 = 5, $t2 = 8, $t3 = -3 (0xfffffffd)
# Su dung thanh ghi $t5 thay the cho $at
.text
.globl main
main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3

    # x1 = y + z + w -> $t0 (8 + 5 + 3 = 16)
    add  $t0, $s0, $s1
    add  $t0, $t0, $s2

    # x2 = (y + z) - (w + 5) -> $t1 ((8 + 5) - (3 + 5) = 13 - 8 = 5)
    add  $t1, $s0, $s1
    addi $t5, $s2, 5
    sub  $t1, $t1, $t5

    # x3 = y (sao chep) -> $t2 (8)
    add  $t2, $s0, $zero

    # x4 = z - y -> $t3 (5 - 8 = -3, bu hai: 0xfffffffd)
    sub  $t3, $s1, $s0

    li   $v0, 10
    syscall
