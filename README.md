# IT012 - Tổ chức và Cấu trúc Máy tính II - Lab 03

Repository này lưu trữ các bài thực hành Lab 03 viết bằng hợp ngữ MIPS và chạy trên trình mô phỏng MARS (MIPS Assembler and Runtime Simulator).

- **Sinh viên**: Đậu Anh Dũng
- **MSSV**: 25520350
- **Lớp**: Cntt.1
- **Chữ số cuối MSSV**: `D = 0`

---

## 1. Nội dung bài thực hành

- **Thí nghiệm 1**: Làm quen với thanh ghi, lệnh số học và phương pháp biểu diễn số bù hai, con trỏ lệnh `pc`.
- **Thí nghiệm 2**: Từ biểu thức cấp cao `a = b + c` đến lệnh hợp ngữ `$t0 = $t1 + $t2`, cấu trúc từ mã máy R-type và tính toán điện năng tiêu thụ 3 tháng.
- **Thí nghiệm 3**: Nhập, xuất và lời gọi hệ thống (`syscall 1, 4, 5, 10`), tương tác đọc dữ liệu từ bàn phím và tính toán điện năng tiêu thụ với bộ số liệu cá nhân `D = 0`.

---

## 2. Danh mục các tệp mã nguồn MIPS

### Các tệp chính theo quy định đề bài:

| Tên tệp | Nội dung | Kết quả kiểm thử (MARS 4.4 / 4.5) |
| :--- | :--- | :--- |
| `IT012_Lab01_25520350_TN1.asm` | Thí nghiệm 1: Khảo sát 5 lệnh thanh ghi (`$t0-$t3`, `$zero`), `pc = 0x00400014` | **PASSED** (Exit code: 0) |
| `IT012_Lab01_25520350_TN2.asm` | Thí nghiệm 2: Tính điện năng 3 tháng (`$t3=440`) & Mã nguồn 4 tại nhãn `ma_nguon_4` | **PASSED** (Exit code: 0) |
| `IT012_Lab01_25520350_TN3.asm` | Thí nghiệm 3: Nhập 4 chỉ số công tơ, tính điện năng từng tháng và tổng điện năng (`D = 0`) | **PASSED** (Exit code: 0) |

### Thư mục `examples/` (Các chương trình chạy độc lập với `main:`):

Mỗi tệp trong thư mục `examples/` là một chương trình độc lập, người chấm có thể mở trực tiếp và bấm *Assemble & Go* ngay lập tức:

- `m0_source0.asm`: Mã nguồn 0 - In chuỗi "Xin chao, MARS!" kiểm tra môi trường.
- `m1_source1.asm`: Mã nguồn 1 - Năm lệnh khảo sát thanh ghi.
- `m2_source2.asm`: Mã nguồn 2 - Phép cộng số học `$t0 = $t1 + $t2` (mã máy `0x012a4020`).
- `m3_source3.asm`: Mã nguồn 3 - Tính điện năng tiêu thụ theo số liệu giả lập (`150, 125, 165, 440`).
- `m4_source4.asm`: Mã nguồn 4 - Chuyển đổi 4 câu lệnh sang hợp ngữ MIPS (`16, 5, 8, -3`).
- `m5_source5.asm`: Mã nguồn 5 - Dịch vụ syscall in chuỗi và in số nguyên 150.
- `m6_source6.asm`: Mã nguồn 6 - Dịch vụ syscall 5 đọc 2 chỉ số từ bàn phím.
- `m7_source7.asm`: Mã nguồn 7 - Đọc 4 chỉ số và in báo cáo 3 tháng với số liệu cá nhân `D = 0`.

---

## 3. Hướng dẫn chạy và kiểm thử

### Cách 1: Chạy bằng giao diện MARS GUI

1. Mở MARS:
   ```cmd
   java -jar Mars4_4.jar
   ```
2. Chọn **File > Open** và mở tệp `.asm` cần kiểm thử.
3. Nhấn **Run > Assemble** (`F3`).
4. Nhấn **Run > Go** (`F5`) để chạy toàn bộ, hoặc **Run > Step** (`F7`) để thực thi từng lệnh.

*Đối với tệp `IT012_Lab01_25520350_TN3.asm`*, nhập lần lượt 4 chỉ số trong cửa sổ **Run I/O**:
- Số liệu mẫu: `1200` [Enter] `1350` [Enter] `1475` [Enter] `1640` [Enter]
- Số liệu riêng `D = 0`: `1000` [Enter] `1120` [Enter] `1220` [Enter] `1360` [Enter]

### Cách 2: Chạy kiểm thử tự động bằng dòng lệnh (CLI)

```cmd
# Kiểm thử Thí nghiệm 1
java -jar Mars4_4.jar nc shared/asm/IT012_Lab01_25520350_TN1.asm

# Kiểm thử Thí nghiệm 2
java -jar Mars4_4.jar nc shared/asm/IT012_Lab01_25520350_TN2.asm

# Kiểm thử Thí nghiệm 3 (nhập 4 chỉ số D=0)
echo 1000 1120 1220 1360 | java -jar Mars4_4.jar nc shared/asm/IT012_Lab01_25520350_TN3.asm
```
