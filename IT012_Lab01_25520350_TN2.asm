# ==============================================================================
# TRUONG DAI HOC CONG NGHE THONG TIN - DHQG-HCM
# KHOA KY THUAT MAY TINH
# IT012 - TO CHUC VA CAU TRUC MAY TINH II - LAB 03
# Ho va ten: Đậu Anh Dũng
# MSSV: 25520350
# Lop: Cntt.1
# Muc dich: Thi nghiem 2 - Tu a = b + c den $t0 = $t1 + $t2
#           Bao gom Ma nguon 3 (firmware cong to dien) va Ma nguon 4 (chuyen cau lenh)
#           Khong ghi de ket qua cua nhau; chay mac dinh tra ve dung anh Registers Thi nghiem 2
#           (Luu y: Nguoi cham co the mo truc tiep examples/m4_source4.asm de chay doc lap Ma nguon 4)
# ==============================================================================

.text
.globl main
main:
    # ==========================================================================
    # PHAN 1: MA NGUON 3 - Dien nang tieu thu mot ho gia dinh (kWh)
    # Ket qua sau khi thuc thi:
    #   $s0 = 1200, $s1 = 1350, $s2 = 1475, $s3 = 1640
    #   $t0 = 150 (usage1), $t1 = 125 (usage2), $t2 = 165 (usage3)
    #   $t3 = 440 (total)
    # ==========================================================================
    addi $s0, $zero, 1200    # reading0: dau thang 1
    addi $s1, $zero, 1350    # reading1: dau thang 2
    addi $s2, $zero, 1475    # reading2: dau thang 3
    addi $s3, $zero, 1640    # reading3: cuoi thang 3

    sub  $t0, $s1, $s0       # usage1 = reading1 - reading0 = 1350 - 1200 = 150
    sub  $t1, $s2, $s1       # usage2 = reading2 - reading1 = 1475 - 1350 = 125
    sub  $t2, $s3, $s2       # usage3 = reading3 - reading2 = 1640 - 1475 = 165
    add  $t3, $t0, $t1       # tong trung gian = 150 + 125 = 275
    add  $t3, $t3, $t2       # total = 275 + 165 = 440

    # Ket thuc Phan 1 de bao toan nguyen ven trang thai Registers $t0-$t3 cho anh chup Thi nghiem 2
    li   $v0, 10
    syscall

# ==============================================================================
# PHAN 2: MA NGUON 4 - Chuyen 4 cau lenh thanh hop ngu MIPS (y=8, z=5, w=3)
# De chay doc lap voi nhan main tu dau, mo tep: examples/m4_source4.asm
# Hoac chay tu nhan ma_nguon_4 trong MARS
# Ket qua mong doi: $t0 = 16, $t1 = 5, $t2 = 8, $t3 = -3 (0xfffffffd)
# Su dung thanh ghi tam $t5 thay cho $at de tuan thu chuan thanh ghi MIPS
# ==============================================================================
.globl ma_nguon_4
ma_nguon_4:
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
