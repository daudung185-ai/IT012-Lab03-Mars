# ==============================================================================
# TRUONG DAI HOC CONG NGHE THONG TIN - DHQG-HCM
# KHOA KY THUAT MAY TINH
# IT012 - TO CHUC VA CAU TRUC MAY TINH II - LAB 03
# Ho va ten: Đậu Anh Dũng
# MSSV: 25520350
# Lop: Cntt.1
# Muc dich: Thi nghiem 2 - Tu a = b + c den $t0 = $t1 + $t2 (Ma nguon 2, 3, 4)
# ==============================================================================

.data
    header: .asciiz "--- IT012 LAB 03: THI NGHIEM 2 ---\n"

.text
.globl main
main:
    # --------------------------------------------------------------------------
    # Ma nguon 2: Phep cong dau tien a = b + c
    # --------------------------------------------------------------------------
    addi $t1, $zero, 7       # b = 7
    addi $t2, $zero, 5       # c = 5
    add  $t0, $t1, $t2       # a = b + c (12)

    # --------------------------------------------------------------------------
    # Ma nguon 3: Dien nang tieu thu mot ho gia dinh (so lieu gia lap, kWh)
    # reading0 -> $s0, reading1 -> $s1, reading2 -> $s2, reading3 -> $s3
    # --------------------------------------------------------------------------
    addi $s0, $zero, 1200    # dau thang 1
    addi $s1, $zero, 1350    # dau thang 2
    addi $s2, $zero, 1475    # dau thang 3
    addi $s3, $zero, 1640    # cuoi thang 3

    sub  $t0, $s1, $s0       # usage1 = reading1 - reading0 = 1350 - 1200 = 150
    sub  $t1, $s2, $s1       # usage2 = reading2 - reading1 = 1475 - 1350 = 125
    sub  $t2, $s3, $s2       # usage3 = reading3 - reading2 = 1640 - 1475 = 165
    add  $t3, $t0, $t1       # tong trung gian = 150 + 125 = 275
    add  $t3, $t3, $t2       # total = 275 + 165 = 440

    # --------------------------------------------------------------------------
    # Ma nguon 4: Chuyen 4 cau lenh thanh hop ngu MIPS (y=8, z=5, w=3)
    # --------------------------------------------------------------------------
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

    # Ket thuc chuong trinh
    li   $v0, 10
    syscall
