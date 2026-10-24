# BÁO CÁO NGHIỆM THU CUỐI CÙNG (FINAL QA ACCEPTANCE REPORT)
### IT012 - Tổ chức và Cấu trúc Máy tính II - Lab 03: Làm quen với MARS

- **Sinh viên thực hiện**: Đậu Anh Dũng
- **MSSV**: 25520350 | **Lớp**: Cntt.1 | **Chữ số D**: 0
- **Thời điểm nghiệm thu**: 23:50:00 24/10/2026
- **Kho lưu trữ GitHub chính thức**: [https://github.com/daudung185-ai/IT012-Lab03-Mars](https://github.com/daudung185-ai/IT012-Lab03-Mars)
- **Kết luận nghiệm thu**: **✅ 100% PASS (ĐẠT CHUẨN ĐẦU RA BÀI THỰC HÀNH)**

---

## 1. Bằng Chứng Kiểm Thử Hợp Ngữ MIPS (MARS 4.4 Simulation Verification)

### Thí nghiệm 1 (`IT012_Lab01_25520350_TN1.asm`)
- **Lệnh thực thi**: `java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN1.asm`
- **Mã thoát (Exit Code)**: `0`
- **Output thực tế**: `Xin chao, MARS!`
- **Trạng thái thanh ghi xác minh**:
  - `$t0 = 12$ (`0x0000000c`)
  - `$t1 = 30$ (`0x0000001e`)
  - `$t2 = 42$ (`0x0000002a`)
  - `$zero = 0$ (`0x00000000`) - Chứng minh lệnh `addi $zero, $zero, 5` bị phần cứng bỏ qua
  - `$t3 = 42$ (`0x0000002a`)
  - `pc = 0x00400014`

### Thí nghiệm 2 (`IT012_Lab01_25520350_TN2.asm`)
- **Lệnh thực thi**: `java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN2.asm`
- **Mã thoát (Exit Code)**: `0`
- **Trạng thái thanh ghi xác minh**:
  - Mã nguồn 2: `$t0 = 12$ ($7 + 5 = 12$)
  - Mã nguồn 3: `$t0 = 150$, `$t1 = 125$, `$t2 = 165$, `$t3 = 440$
  - Mã nguồn 4: Đã thay `$at` bằng `$t5`:
    - `$t0 = 16$ ($x_1 = 8 + 5 + 3 = 16$)
    - `$t1 = 5$ ($x_2 = 13 - 8 = 5$)
    - `$t2 = 8$ ($x_3 = 8$)
    - `$t3 = -3$ ($x_4 = 5 - 8 = -3$, bù hai: `0xfffffffd`)

### Thí nghiệm 3 (`IT012_Lab01_25520350_TN3.asm`)
- **Lệnh thực thi**: `echo 1000 1120 1220 1360 | java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN3.asm`
- **Mã thoát (Exit Code)**: `0`
- **Output tương tác thực tế**:
  ```
  Nhap chi so (kWh): 1000
  Nhap chi so (kWh): 1120
  Nhap chi so (kWh): 1220
  Nhap chi so (kWh): 1360
  Thang 1: 120
  Thang 2: 100
  Thang 3: 140
  Tong:    360
  ```
- **Xác nhận tính năng**: Chương trình thực sự đọc 4 số nguyên từ bàn phím bằng `syscall 5`, không in giá trị cố định sẵn. Dùng đúng cú pháp chuỗi xuống dòng `nl: .asciiz "\n"`.

---

## 2. Bằng Chứng Toàn Vẹn Văn Bản Báo Cáo Word (Template Fidelity)

- **Tệp báo cáo**: `IT012_Lab03_25520350_FINAL.docx`
- **Tổng số trang**: **Đúng 25 trang** (khớp hoàn toàn với cấu trúc 25 trang của tài liệu gốc `IT012_Lab03_2026.docx`).
- **Phân bổ trang**:
  - Trang 1-4: Thông tin sinh viên & Giới thiệu
  - Trang 5-8: Thí nghiệm 1 (Bảng 4, Bảng 5, Câu 1.1-1.4, Khung ảnh Registers)
  - Trang 9-15: Thí nghiệm 2 (Bảng 6-9, Câu 2.1-2.4, Khung ảnh Text Segment, Khung ảnh Registers)
  - Trang 16-22: Thí nghiệm 3 (Bảng 10-14, Câu 3.1-3.3, 3 Khung ảnh Run I/O)
  - Trang 23: Phần 4 (Câu 4.1, Câu 4.2, Câu 4.3)
  - Trang 24: Bảng 15 (Checklist nộp bài)
  - Trang 25: Phụ lục Bảng 16 (Tổng hợp các lệnh)
- **Tình trạng ô vàng**: 100% được điền đầy đủ bên trong ô, không trôi dạt.
- **Tình trạng marker `# >>>`**: 0 dấu placeholder sót lại trong các khung mã nguồn.
- **Tình trạng checklist Bảng 15**:
  - Hàng 1, 2, 3, 4: Đã đánh dấu `☑`
  - Hàng 5 (Đẩy GitHub): Đã hoàn thành đẩy lên repository `IT012-Lab03-Mars` $\rightarrow$ Đánh dấu `☑`
  - Hàng 6 (Nộp bài): Giữ nguyên `☐` theo đúng yêu cầu giảng viên.
