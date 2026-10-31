# IT012 - Tổ chức và Cấu trúc máy tính II - Lab 03

Repo này lưu các bài thực hành Lab 03 viết bằng hợp ngữ MIPS và chạy trên MARS 4.4.

- Sinh viên: Đậu Anh Dũng
- MSSV: 25520350
- Lớp: Cntt.1
- Chữ số cuối MSSV: `D = 0`

## Nội dung bài làm

- Làm quen với thanh ghi, lệnh số học và cách chạy từng lệnh trên MARS.
- Tính điện năng tiêu thụ từ các chỉ số công tơ.
- Dùng `syscall` để nhập số nguyên và in kết quả ra màn hình.

## Các file `.asm`

| File | Nội dung |
| --- | --- |
| `IT012_Lab01_25520350_TN1.asm` | Thí nghiệm 1: khảo sát các thanh ghi `$t0` đến `$t3` và thanh ghi `$zero`. |
| `IT012_Lab01_25520350_TN2.asm` | Thí nghiệm 2: tính điện năng của ba tháng; phần chuyển các biểu thức sang MIPS nằm ở nhãn `ma_nguon_4`. |
| `IT012_Lab01_25520350_TN3.asm` | Thí nghiệm 3: nhập bốn chỉ số công tơ, tính điện năng từng tháng và tổng điện năng. |

Thư mục `examples/` có các file từ `m0_source0.asm` đến `m7_source7.asm`. Mỗi file là một phần nhỏ của bài để có thể mở và chạy riêng.

## Cách mở và chạy

### Chạy bằng giao diện MARS

1. Mở MARS 4.4:

   ```cmd
   java -jar Mars4_4.jar
   ```

2. Chọn **File > Open** và mở file `.asm` cần chạy.
3. Chọn **Run > Assemble** (`F3`).
4. Chọn **Run > Go** (`F5`) để chạy, hoặc **Run > Step** (`F7`) để xem từng lệnh.

Riêng file `IT012_Lab01_25520350_TN3.asm`, chương trình sẽ yêu cầu nhập bốn chỉ số trong cửa sổ **Run I/O**. Có thể dùng bộ số sau:

```text
1000
1120
1220
1360
```

Kết quả tương ứng:

```text
Thang 1: 120
Thang 2: 100
Thang 3: 140
Tong:    360
```

### Chạy bằng dòng lệnh

Đặt `Mars4_4.jar` trong thư mục hiện tại hoặc thay bằng đường dẫn đến file JAR:

```powershell
java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN1.asm
java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN2.asm
java -jar Mars4_4.jar nc IT012_Lab01_25520350_TN3.asm
```

Khi chạy file thí nghiệm 3, nhập lần lượt bốn chỉ số theo yêu cầu của chương trình.

