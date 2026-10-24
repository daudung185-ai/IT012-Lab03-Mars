# IT012 Lab 03 - Ma nguon 3: Dien nang tieu thu mot ho gia dinh (kWh)
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
# Ket qua: $t0 = 150, $t1 = 125, $t2 = 165, $t3 = 440
.text
.globl main
main:
    addi $s0, $zero, 1200
    addi $s1, $zero, 1350
    addi $s2, $zero, 1475
    addi $s3, $zero, 1640

    sub  $t0, $s1, $s0   # usage1 = 1350 - 1200 = 150
    sub  $t1, $s2, $s1   # usage2 = 1475 - 1350 = 125
    sub  $t2, $s3, $s2   # usage3 = 1640 - 1475 = 165
    add  $t3, $t0, $t1   # tong trung gian = 275
    add  $t3, $t3, $t2   # total = 440

    li   $v0, 10
    syscall
