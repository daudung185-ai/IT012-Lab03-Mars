# IT012 - TỔ CHỨC VÀ CẤU TRÚC MÁY TÍNH II - LAB 03
## LÀM QUEN VỚI MARS: THANH GHI, TẬP LỆNH SỐ HỌC VÀ LỜI GỌI HỆ THỐNG

- **Sinh viên thực hiện**: Đậu Anh Dũng
- **MSSV**: 25520350
- **Lớp**: Cntt.1
- **Chữ số D cá nhân**: 0 ($D = 25520350 \pmod{10} = 0$)
- **Kho lưu trữ GitHub**: [https://github.com/daudung185-ai/IT012-Lab03-Mars](https://github.com/daudung185-ai/IT012-Lab03-Mars)

---

## 1. Cấu Trúc Mã Nguồn Nộp Bài

Kho mã nguồn được cấu trúc khoa học theo đúng yêu cầu của giảng viên, phân tách hoàn toàn các thí nghiệm để đảm bảo địa chỉ lệnh và trạng thái Registers tái hiện chính xác 100% như trong báo cáo Word:

### 1.1. Các tệp nộp bài chính (Main Submission Files)
| Tên tệp hợp ngữ | Thí nghiệm | Mục đích & Trạng thái thanh ghi |
| :--- | :---: | :--- |
| **`IT012_Lab01_25520350_TN1.asm`** | Thí nghiệm 1 | **Mã nguồn 1 chạy độc lập**: Bắt đầu tại `0x00400000`. Thực thi đúng 5 lệnh đầu tiên cho trạng thái: `PC = 0x00400014`, `$t0 = 12`, `$t1 = 30`, `$t2 = 42`, `$zero = 0` (nối cứng vật lý), `$t3 = 42`. Khớp hoàn toàn Bảng 5 và ảnh Bảng 19. |
| **`IT012_Lab01_25520350_TN2.asm`** | Thí nghiệm 2 | **Mã nguồn 3 (chạy mặc định tại `main`)**: Tính toán điện năng 3 tháng từ 4 chỉ số gia lập ($1200, 1350, 1475, 1640$), cho kết quả `$t0 = 150`, `$t1 = 125`, `$t2 = 165`, `$t3 = 440`. Khớp hoàn toàn Bảng 36. Đồng thời tích hợp **Mã nguồn 4** tại nhãn `ma_nguon_4` dùng thanh ghi `$t5` ($x_1=16, x_2=5, x_3=8, x_4=-3$). |
| **`IT012_Lab01_25520350_TN3.asm`** | Thí nghiệm 3 | **Mã nguồn 7 (đọc tương tác từ bàn phím)**: Sử dụng dịch vụ `syscall 5` để đọc lần lượt 4 chỉ số công tơ (`reading0` đến `reading3`) và xuất điện năng 3 tháng cùng tổng điện năng cho số liệu riêng $D=0$ ($1000, 1120, 1220, 1360 \rightarrow 120, 100, 140, 360$). Sử dụng đúng cú pháp `.asciiz "\n"`. |

### 1.2. Thư mục mã nguồn từng bước độc lập (`examples/`)
Để giảng viên và người chấm có thể kiểm tra từng bước thực nghiệm riêng biệt mà không ảnh hưởng lẫn nhau:
- **`examples/m0_source0.asm`**: Mã nguồn 0 — Kiểm tra nhanh in chuỗi `"Xin chao, MARS!\n"`.
- **`examples/m1_source1.asm`**: Mã nguồn 1 — Khảo sát thanh ghi và số bù hai (bắt đầu tại `0x00400000`).
- **`examples/m2_source2.asm`**: Mã nguồn 2 — Lệnh cộng đầu tiên $a = b + c$ ($7 + 5 = 12$, mã máy `0x012a4020` tại `0x00400008`).
- **`examples/m3_source3.asm`**: Mã nguồn 3 — Firmware tính điện năng gia đình ($150, 125, 165$, tổng $440$).
- **`examples/m4_source4.asm`**: Mã nguồn 4 — Chuyển 4 câu lệnh sang MIPS sử dụng thanh ghi `$t5` ($x_1=16, x_2=5, x_3=8, x_4=-3$).
- **`examples/m5_source5.asm`**: Mã nguồn 5 — In chuỗi và số nguyên $150$ (`msg` tại `0x10010000`, `nl` tại `0x10010012`).
- **`examples/m6_source6.asm`**: Mã nguồn 6 — Đọc 2 chỉ số từ bàn phím và in điện năng tiêu thụ (khai báo `newline: .asciiz "\n"`).
- **`examples/m7_source7.asm`**: Mã nguồn 7 — Đọc 4 chỉ số công tơ từ bàn phím với số liệu riêng $D=0$.

---

## 2. Hướng Dẫn Chạy & Kiểm Thử Trên MARS 4.4

### 2.1. Chạy trên giao diện đồ họa (MARS GUI)
1. Khởi động MARS:
   ```cmd
   java -jar Mars4_4.jar
   ```
2. Mở tệp `.asm` qua menu **File $\rightarrow$ Open**.
3. Nhấn **Run $\rightarrow$ Assemble** (`F3`).
4. Nhấn **Run $\rightarrow$ Go** (`F5`) hoặc **Run $\rightarrow$ Step** (`F7`) để chạy từng lệnh.
5. Với `IT012_Lab01_25520350_TN3.asm`, nhập lần lượt 4 số vào khung **Run I/O**:
   ```
   1000
   1120
   1220
   1360
   ```
   Kết quả hiển thị:
   ```
   Thang 1: 120
   Thang 2: 100
   Thang 3: 140
   Tong:    360
   ```

### 2.2. Chạy tự động qua dòng lệnh (MARS CLI)
```powershell
# 1. Chạy Thí nghiệm 1 (5 lệnh đầu kiểm tra PC = 0x00400014):
java -jar Mars4_4.jar 5 nc sm 8 9 10 11 0 IT012_Lab01_25520350_TN1.asm

# 2. Chạy Thí nghiệm 2:
java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN2.asm

# 3. Chạy Thí nghiệm 3 (truyền 4 chỉ số qua stdin):
"1000`n1120`n1220`n1360`n" | java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN3.asm
```

---

## 3. Bảng Đối Soát Số Liệu Thực Nghiệm ($D = 0$)

| Chỉ số / Đại lượng | Giá trị | Ý nghĩa thực nghiệm |
| :--- | :---: | :--- |
| Chữ số cuối MSSV ($D$) | `0` | $25520350 \pmod{10} = 0$ |
| Chỉ số `reading0` | `1000` | Đầu tháng 1 |
| Chỉ số `reading1` | `1120` | Đầu tháng 2 |
| Chỉ số `reading2` | `1220` | Đầu tháng 3 |
| Chỉ số `reading3` | `1360` | Cuối tháng 3 |
| Điện năng Tháng 1 (`$t0`) | `120 kWh` | $1120 - 1000 = 120$ |
| Điện năng Tháng 2 (`$t1`) | `100 kWh` | $1220 - 1120 = 100$ |
| Điện năng Tháng 3 (`$t2`) | `140 kWh` | $1360 - 1220 = 140$ |
| Tổng điện năng tiêu thụ (`$t3`) | `360 kWh` | $120 + 100 + 140 = 360$ (chuỗi tổng sai phân triệt tiêu) |
