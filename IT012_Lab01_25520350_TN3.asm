# ==============================================================================
# TRUONG DAI HOC CONG NGHE THONG TIN - DHQG-HCM
# KHOA KY THUAT MAY TINH
# IT012 - TO CHUC VA CAU TRUC MAY TINH II - LAB 03
# Ho va ten: Đậu Anh Dũng
# MSSV: 25520350
# Lop: Cntt.1
# Muc dich: Thi nghiem 3 - Ma nguon 7: Tong hop ba thang voi du lieu rieng D=0
#           Doc 4 chi so tu ban phim (reading0 -> reading3) va in dien nang tieu thu
# ==============================================================================

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
    # --------------------------------------------------------------------------
    # 1. Doc bon chi so cong to tu ban phim vao cac thanh ghi $s0, $s1, $s2, $s3
    # --------------------------------------------------------------------------
    # Doc reading0 vao $s0 (dau thang 1)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    # Doc reading1 vao $s1 (dau thang 2)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    # Doc reading2 vao $s2 (dau thang 3)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    # Doc reading3 vao $s3 (cuoi thang 3)
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    # --------------------------------------------------------------------------
    # 2. Tinh dien nang tieu thu theo ke hoach thanh ghi cua Ma nguon 3:
    #    usage1 ($t0) = reading1 - reading0
    #    usage2 ($t1) = reading2 - reading1
    #    usage3 ($t2) = reading3 - reading2
    #    total  ($t3) = usage1 + usage2 + usage3
    # --------------------------------------------------------------------------
    sub  $t0, $s1, $s0
    sub  $t1, $s2, $s1
    sub  $t2, $s3, $s2

    add  $t3, $t0, $t1
    add  $t3, $t3, $t2

    # --------------------------------------------------------------------------
    # 3. In ket qua ra man hinh theo dung dinh dang yeu cau
    # --------------------------------------------------------------------------
    # In Thang 1
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In Thang 2
    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In Thang 3
    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In Tong
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # --------------------------------------------------------------------------
    # 4. Ket thuc chuong trinh
    # --------------------------------------------------------------------------
    li   $v0, 10
    syscall
