# ==============================================================================
# TRUONG DAI HOC CONG NGHE THONG TIN - DHQG-HCM
# KHOA KY THUAT MAY TINH
# IT012 - TO CHUC VA CAU TRUC MAY TINH II - LAB 03
# Ho va ten: Đậu Anh Dũng
# MSSV: 25520350
# Lop: Cntt.1
# Muc dich: Thi nghiem 1 - Ma nguon 1: Lam quen voi thanh ghi va so bu hai
#           Dia chi bat dau tai 0x00400000; sau 5 lenh: pc = 0x00400014
# ==============================================================================

.text
.globl main
main:
    # --------------------------------------------------------------------------
    # 5 lenh dau tien khao sat thanh ghi (MIPS R-type va I-type):
    # --------------------------------------------------------------------------
    addi $t0, $zero, 12      # 0x00400000: $t0 = $zero + 12 = 12 (0x0000000c)
    addi $t1, $zero, 30      # 0x00400004: $t1 = $zero + 30 = 30 (0x0000001e)
    add  $t2, $t0, $t1       # 0x00400008: $t2 = $t0 + $t1 = 42  (0x0000002a)
    addi $zero, $zero, 5     # 0x0040000c: $zero noi cung vat ly (hardwired), van giu nguyen 0
    add  $t3, $zero, $t2     # 0x00400010: $t3 = $zero + $t2 = 42 (0x0000002a)
                             # Sau khi thuc thi xong 5 lenh tren: pc = 0x00400014

    # --------------------------------------------------------------------------
    # Ket thuc chuong trinh
    # --------------------------------------------------------------------------
    li   $v0, 10             # dich vu syscall 10: ket thuc chuong trinh
    syscall
