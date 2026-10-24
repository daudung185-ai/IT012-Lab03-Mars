# ==============================================================================
# TRUONG DAI HOC CONG NGHE THONG TIN - DHQG-HCM
# KHOA KY THUAT MAY TINH
# IT012 - TO CHUC VA CAU TRUC MAY TINH II - LAB 03
# Ho va ten: Đậu Anh Dũng
# MSSV: 25520350
# Lop: Cntt.1
# Muc dich: Thi nghiem 1 - Lam quen voi thanh ghi, Ma nguon 0 va Ma nguon 1
# ==============================================================================

.data
    msg: .asciiz "Xin chao, MARS!\n"

.text
.globl main
main:
    # --- Ma nguon 0: In chuoi loi chao ---
    li   $v0, 4              # dich vu 4: in chuoi
    la   $a0, msg            # doi so: dia chi cua msg
    syscall

    # --- Ma nguon 1: 5 lenh dau tien khao sat thanh ghi va so am bu 2 ---
    addi $t0, $zero, 12      # $t0 = $zero + 12
    addi $t1, $zero, 30      # $t1 = $zero + 30
    add  $t2, $t0, $t1       # $t2 = $t0 + $t1 (42 = 0x2a)
    addi $zero, $zero, 5     # thu dua $zero + 5 vao $zero (khong doi, $zero van la 0)
    add  $t3, $zero, $t2     # $t3 = $zero + $t2 (42 = 0x2a)

    # Ket thuc chuong trinh
    li   $v0, 10
    syscall
