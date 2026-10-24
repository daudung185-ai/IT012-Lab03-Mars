# IT012 Lab 03 - Ma nguon 0: Kiem tra nhanh
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
.data
    msg: .asciiz "Xin chao, MARS!\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall

    li   $v0, 10
    syscall
