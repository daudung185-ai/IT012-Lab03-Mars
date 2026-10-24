# IT012 Lab 03 - Ma nguon 5: In van ban va mot so nguyen
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
# Ket qua: "Dien nang (kWh): 150"
# Dia chi nhan trong MARS: msg = 0x10010000, nl = 0x10010012
.data
    msg: .asciiz "Dien nang (kWh): "
    nl:  .asciiz "\n"

.text
.globl main
main:
    li   $s0, 1200
    li   $s1, 1350
    sub  $t0, $s1, $s0       # 1350 - 1200 = 150

    li   $v0, 4              # in chuoi
    la   $a0, msg
    syscall

    li   $v0, 1              # in so nguyen
    add  $a0, $t0, $zero
    syscall

    li   $v0, 4              # in xuong dong
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall
