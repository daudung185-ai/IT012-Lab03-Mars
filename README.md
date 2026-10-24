# IT012 - TỔ CHỨC VÀ CẤU TRÚC MÁY TÍNH II - LAB 03
## LÀM QUEN VỚI MARS: THANH GHI, TẬP LỆNH SỐ HỌC VÀ LỜI GỌI HỆ THỐNG

- **Sinh viên thực hiện**: Đậu Anh Dũng
- **MSSV**: 25520350
- **Lớp**: Cntt.1
- **Chữ số D cá nhân**: 0 ($D = 25520350 \pmod{10} = 0$)
- **GitHub Repository**: [https://github.com/daudung185-ai/IT012-Lab03-Mars](https://github.com/daudung185-ai/IT012-Lab03-Mars)

---

## 1. Danh Mục Các Tệp Hợp Ngữ MIPS Cần Nộp

| Tên tệp hợp ngữ | Nội dung thực nghiệm | Mô tả chi tiết |
| :--- | :--- | :--- |
| **`IT012_Lab01_25520350_TN1.asm`** | Thí nghiệm 1 | - **Mã nguồn 0**: In chuỗi `"Xin chao, MARS!\n"`.<br>- **Mã nguồn 1**: Khảo sát giá trị thanh ghi và cơ chế nối cứng vật lý (`hardwired`) của `$zero`. |
| **`IT012_Lab01_25520350_TN2.asm`** | Thí nghiệm 2 | - **Mã nguồn 2**: Lệnh `add $t0, $t1, $t2` ($7 + 5 = 12$).<br>- **Mã nguồn 3**: Tính điện năng 3 tháng (150, 125, 165, tổng 440 kWh).<br>- **Mã nguồn 4**: Chuyển 4 biểu thức số học sang MIPS dùng thanh ghi `$t5` ($x_1=16, x_2=5, x_3=8, x_4=-3$). |
| **`IT012_Lab01_25520350_TN3.asm`** | Thí nghiệm 3 | - **Mã nguồn 7**: Đọc tương tác 4 chỉ số công tơ từ bàn phím (`syscall 5`) và tính điện năng tiêu thụ 3 tháng cùng tổng tiêu thụ cho chỉ số riêng $D=0$ ($1000, 1120, 1220, 1360 \rightarrow 120, 100, 140$, tổng $360\text{ kWh}$). |

---

## 2. Hướng Dẫn Biên Dịch & Chạy Mô Phỏng Với MARS 4.4

### Cách 1: Chạy bằng giao diện đồ họa (MARS GUI)
1. Khởi động MARS:
   ```cmd
   java -jar Mars4_4.jar
   ```
2. Vào menu **File $\rightarrow$ Open**, chọn tệp `.asm` cần chạy (ví dụ `IT012_Lab01_25520350_TN3.asm`).
3. Vào menu **Run $\rightarrow$ Assemble** (hoặc nhấn phím `F3`).
4. Quan sát các cửa sổ:
   - **Registers Window**: Các thanh ghi `$zero`, `$at`, `$v0-$v1`, `$a0-$a3`, `$t0-$t9`, `$s0-$s7`, `$sp`, `pc`.
   - **Text Segment Window**: Địa chỉ bộ nhớ, từ mã máy hexa 32-bit (Basic Code / Source Code).
   - **Run I/O Pane**: Khung nhập dữ liệu bàn phím và xuất kết quả màn hình.
5. Thực thi chương trình:
   - Nhấn **Run $\rightarrow$ Go** (`F5`) để chạy toàn bộ chương trình.
   - Nhấn **Run $\rightarrow$ Step** (`F7`) để thực thi từng lệnh và quan sát thanh ghi đổi màu.
   - Khi chạy `IT012_Lab01_25520350_TN3.asm`, nhập lần lượt 4 số vào khung Run I/O:
     ```
     1000
     1120
     1220
     1360
     ```
   - Kết quả xuất ra màn hình:
     ```
     Thang 1: 120
     Thang 2: 100
     Thang 3: 140
     Tong:    360
     ```

### Cách 2: Chạy tự động qua dòng lệnh (MARS CLI / Headless)
Biên dịch và chạy trực tiếp không cần mở cửa sổ:
```cmd
# Chạy Thí nghiệm 1:
java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN1.asm

# Chạy Thí nghiệm 2:
java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN2.asm

# Chạy Thí nghiệm 3 (truyền 4 chỉ số công tơ qua stdin):
echo 1000 1120 1220 1360 | java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN3.asm
```

---

## 3. Bảng Đối Soát Kết Quả Thực Nghiệm

| Tham số | Giá trị thực tế | Ý nghĩa |
| :--- | :---: | :--- |
| MSSV | `25520350` | Chữ số cuối $D = 0$ |
| Chỉ số reading0 | `1000` | Đầu tháng 1 |
| Chỉ số reading1 | `1120` | Đầu tháng 2 |
| Chỉ số reading2 | `1220` | Đầu tháng 3 |
| Chỉ số reading3 | `1360` | Cuối tháng 3 |
| Điện năng Tháng 1 (`$t0`) | `120 kWh` | $1120 - 1000 = 120$ |
| Điện năng Tháng 2 (`$t1`) | `100 kWh` | $1220 - 1120 = 100$ |
| Điện năng Tháng 3 (`$t2`) | `140 kWh` | $1360 - 1220 = 140$ |
| Tổng điện năng (`$t3`) | `360 kWh` | $120 + 100 + 140 = 360$ (chuỗi tổng sai phân triệt tiêu) |
