# IT012 Lab 03 - Ma nguon 7: Tong hop ba thang voi du lieu rieng D=0
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
# Nhap: 1000, 1120, 1220, 1360
# Xuat: Thang 1: 120, Thang 2: 100, Thang 3: 140, Tong: 360
.data
    prompt: .asciiz "Nhap chi so (kWh): "
    m1:     .asciiz "Thang 1: "
    m2:     .asciiz "Thang 2: "
    m3:     .asciiz "Thang 3: "
    tot:    .asciiz "Tong:    "
    nl:     .asciiz "\n"

.text
.globl main
main:
    # 1. Doc 4 chi so tu ban phim
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    # 2. Tinh toan
    sub  $t0, $s1, $s0
    sub  $t1, $s2, $s1
    sub  $t2, $s3, $s2
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2

    # 3. In ket qua
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall
