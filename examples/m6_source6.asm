# IT012 Lab 03 - Ma nguon 6: Doc hai so tu ban phim va tinh dien nang tieu thu
# Sinh vien: Đậu Anh Dũng - MSSV: 25520350 - Lop: Cntt.1
.data
    prompt1: .asciiz "Nhap chi so cu (kWh): "
    prompt2: .asciiz "Nhap chi so moi (kWh): "
    label:   .asciiz "Dien nang (kWh): "
    newline: .asciiz "\n"

.text
.globl main
main:
    # Doc chi so cu vao $s0
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    # Doc chi so moi vao $s1
    li   $v0, 4
    la   $a0, prompt2
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    # usage = current - previous, vao $t0
    sub  $t0, $s1, $s0

    # In label, roi usage, roi newline
    li   $v0, 4
    la   $a0, label
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
