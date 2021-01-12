use master
go
create database BANHANG
use BANHANG
go

create table KHACHHANG
(
 MAKHACHHANG varchar(50) not null,
 TENCONGTY nvarchar(100) not null,
 TENGIAODICH nvarchar(100) not null,
 DIACHI nvarchar(100) not null,
 EMAIL nvarchar(100) not null,
 DIENTHOAI varchar(20) not null,
 FAX varchar(20)not null,
 Constraint pk_MAKHACHHANG Primary key (MAKHACHHANG)
)

CREATE TABLE NHACUNGCAP
(
MACONGTY varchar(50) not null,
TENCONGTY nvarchar(100) not null,
 TENGIAODICH nvarchar(100) not null,
 DIACHI nvarchar(100) not null,
 DIENTHOAI varchar(20) not null,
 FAX varchar(20) not null,
 EMAIL nvarchar(100) not null,
 Constraint pk_MACONGTY Primary key (MACONGTY)

)
create table NHANVIEN
(
MANHANVIEN VARCHAR(50) NOT NULL,
HO nvarchar (20) not null,
TEN nvarchar (50) not null,
NGAYSINH DATE not null,
NGAYLAMVIEC date not null,
DIACHI nvarchar(100) not null,
DIENTHOAI varchar(20) NOT NULL,
LUONGCOBAN int  not null,
PHUCAP int not null,
constraint pk_MANHANVIEN primary key (MANHANVIEN)
)

CREATE TABLE DONDATHANG
(
SOHOADON varchar(50) not null,
MAKHACHHANG varchar(50) not null,
MANHANVIEN VARCHAR(50) NOT NULL,
NGAYDATHANG DATE NOT NULL,
NGAYGIAOHANG date not null,
NGAYCHUYENHANG DATE not NULL,
NOIGIAOHANG nvarchar (100) not null,
constraint pk_SOHOADON primary key (SOHOADON),
CONSTRAINT fk_MAKHACHHANG FOREIGN KEY (MAKHACHHANG) REFERENCES KHACHHANG(MAKHACHHANG),
CONSTRAINT fk_MANHANVIEN FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
)
CREATE TABLE CHITIETDATHANG
( 
SOHOADON varchar(50) not null,
MAHANG VARCHAR(50) NOT NULL,
GIABAN INT NOT NULL,
SOLUONG INT NOT NULL,
MUCGIAMGIA INT NOT NULL,
CONSTRAINT PK_ctdathang primary key (SOHOADON,MAHANG)

)
create table LOAIHANG 
(
MALOAIHANG varchar(50) not null,
TENLOAIHANG NVARCHAR(100) NOT NULL,
CONSTRAINT PK_MALOAIHANG primary key (MALOAIHANG)

)
create table MATHANG
(
MAHANG VARCHAR(50) NOT NULL,
TENHANG NVARCHAR(100) NOT NULL,
MACONGTY varchar(50) not null,
MALOAIHANG varchar(50) not null,
SOLUONG INT NOT NULL,
DONVITINH INT NOT NULL,
GIAHANG FLOAT NOT NULL,
constraint pk_MAHANG primary key (MAHANG),
CONSTRAINT fk_MALOAIHANG FOREIGN KEY (MALOAIHANG) REFERENCES LOAIHANG(MALOAIHANG),
CONSTRAINT fk_MACONGTY FOREIGN KEY (MACONGTY) REFERENCES NHACUNGCAP(MACONGTY)
)

insert into KHACHHANG
values
('KH01','Viet tien','Thoi trang','Hoa khanh','a@gmail','090121911','01111921'),
('KH02','Trung Nguyen','Cafe','Cam Le','cafe@gmail.com','0907123456','19191001'),
('KH03','Hoa Phat','Ton kinh','Thanh Khe','tk@gmail.com','0978234123','1929111292'),
('KH04','Sua','Vinamilk','Da Nang','vinamilk@gmail.com','0671829121','82828192'),
('KH05','My Pham','Hadalabo','Quang Nam','mypham@gmail.com','0901929191','72292222')
insert into NHACUNGCAP
values
('M01','Sua','vinamilk','TP.HO CHI MINH','0930481282','039322223','abc@gmail.com'),
('M02','Fpt','laptop','Da Nang','0838129384','02939111','ltop@gmail'),
('M03','Thanh Quan','vat lieu','Ha Noi','0193740121','02932334','vatlieu@gmail.com'),
('M04','My Pham','hadalabo','Quang Nam','0898394921','036471133','hadda@gmail.com'),
('M05','Viet tien','Thoi trang','Vinh','0384913942','028311','thoitrang@gmail')
insert into NHANVIEN
values
('MNV01','Nguyen','Chau','1999/1/2','2018/12/5','Hoa Xuan','0934783192','3000000','500000'),
('MNV02','Huynh','Kieu','1999/6/26','2019/2/19','Hoa Khanh','0393948291','4500000','500000'),
('MNV03','Vo','Hau','2000/5/3','2019/4/20','Cam Le','0393472734','6000000','1000000'),
('MNV04','Ho','Lan','1995/3/15','2017/2/26','Hai Chau','0978392939','2500000','500000'),
('MNV05','Le','Linh','1996/10/10','2016/1/20','Thanh Khe','0983848482','5000000','200000')

insert into DONDATHANG
values
('HD01','KH02','MNV01','2012/11/11','2012/11/20','2012/11/12','Da Nang'),
('HD02','KH01','MNV03','2003/1/20','2003/1/25','2003/1/22','Quang Nam'),
('HD03','KH04','MNV02','2018/3/15','2018/3/19','2018/3/16','Cam Le'),
('HD04','KH03','MNV05','2019/10/20','2019/10/26','2019/10/22','Hoa Vang'),
('HD05','KH05','MNV04','2001/5/2','2001/5/6','2001/5/3','Hai Chau')

insert into CHITIETDATHANG
VALUES
('SHD01','MH02','200000','500','50'),
('SHD02','MH05','50000','100','10'),
('SHD03','MH03','300000','80','30'),
('SHD04','MH01','150000','30','25'),
('SHD05','MH04','100000','250','10')
INSERT into LOAIHANG
values
('MLH01','My pham'),
('MLH03','cafe rang'),
('MLH02','sua'),
('MLH04','Thuc pham'),
('MLH05','Dien tu')

insert into MATHANG
values
('MH01','Thuc pham','M02','MLH03','200','10','200000'),
('MH02','Dien tu','M01','MLH02','133','20','150000'),
('MH03','my pham','M03','MLH01','500','50','500000'),
('MH04','sua ','M04','MLH05','40','100','50000'),
('MH05','cafe rang','M05','MLH04','24','22','100000')

--1 Cho biết danh sách các đối tác cung cấp hàng cho công ty
select * from  NHACUNGCAP
--2 Mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong cônNG TY
SELECT MAHANG,TENHANG,SOLUONG
 FROM MATHANG

--2. 3 Họ tên và địa chỉ và năm bắt đầu làm việc của các nhân viên
SELECT HO,TEN,DIACHI,YEAR(NGAYLAMVIEC) as namlamviec
FROM NHANVIEN
--2. 4 Địa chỉ và điện thoại của nhà cung cấp có tên giao dịch VINAMILK là g
select DIACHI,DIENTHOAI,TENGIAODICH
from NHACUNGCAP
where TENGIAODICH='vinamilk'
--2.5Cho biết mã và tên của các mặt hàng có giá lớn hơn 100000 và số lượng hiệ
--ít hơn 50.
select MAHANG,TENHANG
from MATHANG
where GIAHANG >100000 and SOLUONG <50
--2.6 Cho biết mỗi mặt hàng trong công ty do ai cung cấp
select mh.MACONGTY,ncc.TENCONGTY 
from MATHANG as mh inner join NHACUNGCAP as ncc
on mh.MACONGTY=ncc.MACONGTY 
--2.7 Công ty Việt Tiến đã cung cấp những mặt hàng nào 
select MH.MAHANG,TENHANG
FROM NHACUNGCAP AS NCC JOIN MATHANG AS MH
ON NCC.MACONGTY=MH.MACONGTY where NCC.TENCONGTY='Viet tien'
--2.8 Loại hàng thực phẩm do những công ty nào cung cấp
--đó là gì
select mh.TENHANG  ,ncc.MACONGTY,ncc.TENCONGTY
FROM MATHANG as mh,NHACUNGCAP as ncc
where mh.MACONGTY=ncc.MACONGTY and mh.TENHANG='Thuc pham'
--2.9Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng Sữa hộp XYZ của
--công ty?
select distinct TENGIAODICH
from KHACHHANG AS kh join  DONDATHANG as ddh on kh.MAKHACHHANG=ddh.MAKHACHHANG join CHITIETDATHANG as ct on ddh.SOHOADON=ct.SOHOADON 
join MATHANG as mh ON mh.MAHANG=ct.MAHANG
WHERE mh.TENHANG='sua hop xyz'
--2.10 Đơn đặt hàng số 1 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao
--hàng là ở đâu?
select TEN,NGAYGIAOHANG,NOIGIAOHANG
from NHANVIEN as nv join DONDATHANG as dh on nv.MANHANVIEN=dh.MANHANVIEN
where SOHOADON='HD01'
--2.11Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu
SELECT MANHANVIEN,TEN ,HO,LUONGCOBAN+PHUCAP as Luong
FROM NHANVIEN

--c2
SELECT MANHANVIEN,HO,TEN,LUONGCOBAN +CASE 
                WHEN PHUCAP IS NULL THEN 0
                    ELSE PHUCAP
                 END AS LUONG
FROM NHANVIEN
--2.12
select mh.TENHANG,ct.SOLUONG*GIABAN*(1-MUCGIAMGIA/100) as TIEN
from NHANVIEN as nv join DONDATHANG as dh on nv.MANHANVIEN=dh.MANHANVIEN
JOIN CHITIETDATHANG as ct on ct.SOHOADON=dh.SOHOADON
join MATHANG as mh on mh.MAHANG=ct.MAHANG
where dh.SOHOADON='HD03'
--2.13 cùng tên giao dịch
select kh.TENGIAODICH,kh.TENCONGTY
from KHACHHANG as kh join NHACUNGCAP as ncc
on kh.TENGIAODICH=ncc.TENGIAODICH
--2.14Trong công ty có những nhân viên nào có cùng ngày sinh?
select nv1.HO,nv1.TEN,nv2.HO,nv2.TEN 
from NHANVIEN as nv1 join NHANVIEN as nv2
on nv1.NGAYSINH=nv2.NGAYSINH and nv1.MANHANVIEN<>nv2.MANHANVIEN
--2.15Những đơn đặt hàng nào yêu cầu giao hàng ngay tại công ty đătj hàng và những
--đơn đó là của công ty nào? 
select kh.TENCONGTY,kh.MAKHACHHANG,dh.SOHOADON,NOIGIAOHANG,TENGIAODICH
from DONDATHANG as dh,KHACHHANG as kh
where kh.DIACHI=dh.NOIGIAOHANG


---CHUONG5 TRIGGER
--Câu 1:Tạo thủ tục lưu trữ để thông qua thủ tục này có thể bổ sung thêm một bản ghi mới
--cho bảng MATHANG (thủ tục phải thực hiện kiểm tra tính hợp lệ của dữ liệu cần
--bổ sung: không trùng khoá chính và đảm bảo toàn vẹn tham chiếu)

create PROCEDURE sp_mathang(
       @mahang nvarchar(10),
	   @tenhang nvarchar(50),
	   @macongty nvarchar(10) = null,
	   @maloaihang int =null,
	   @soluong int =0,
	   @donvitinh nvarchar(20) = null,
	   @giahang money = 0)
as
 if not exists (select MAHANG FROM MATHANG
           WHERE MAHANG=@mahang)
		if(@macongty is null or exists (select MACONGTY from NHACUNGCAP

		where MACONGTY=@macongty))
		and
		(@maloaihang is null or exists (select MALOAIHANG from
		LOAIHANG
		WHERE MALOAIHANG=@maloaihang))
		
	INSERT  INTO MATHANG
		VALUES (@mahang,@tenhang,@maloaihang,@macongty,
		@soluong,@donvitinh,@giahang)

--CAU2  Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một
--mặt hàng có mã bất kỳ (mã mặt hàng cần thống kê là tham số của thủ tục).

create PROCEDURE sp_thongkebanhang (@mahang nvarchar(10))
AS 
SELECT MATHANG.MAHANG,TENHANG,SUM(CHITIETDATHANG.SOLUONG) AS TONGSOLUONG
from MATHANG LEFT OUTER JOIN CHITIETDATHANG
ON MATHANG.MAHANG=CHITIETDATHANG.MAHANG
WHERE MATHANG.MAHANG=@mahang
GROUP BY MATHANG.MAHANG,TENHANG
--c3 Viết hàm trả về một bảng trong đó cho biết tổng số lượng hàng bán được của mỗi
--mặt hàng. Sử dụng hàm này để thống kê xem tổng số lượng hàng (hiện có và đã
--bán) của mỗi mặt hàng là bao nhiêu
create function func_banhang()
returns table
as 
  return (select MATHANG.MAHANG,TENHANG,

   case
   when sum(CHITIETDATHANG.SOLUONG)IS NULL then 0
   else sum(CHITIETDATHANG.SOLUONG)
   end as tong1
   from MATHANG left outer join CHITIETDATHANG
   on MATHANG.MAHANG=CHITIETDATHANG.MAHANG
   group by MATHANG.MAHANG,TENHANG
 --- Su dung ham dinh nghia
 select a.MAHANG,a.TENHANG,SOLUONG+tong1
 from MATHANG as a join dbo.func_banhang() as b
 on a.MAHANG=b.MAHANG

 select * from MATHANG
 select * from CHITIETDATHANG
 --cau 5.4 Viết trigger cho bang chi tiet đat hang
-- Khi một bản ghi mới được bổ sung vào bảng này thì giảm số lượng hàng
--hiện có nếu số lượng hàng hiện có lớn hơn hoặc bằng số lượng hàng được
--bán ra. Ngược lại thì huỷ bỏ thao tác bổ sung.
