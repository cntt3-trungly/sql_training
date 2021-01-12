use master
go
CREATE DATABASE gk
use gk
go
create table KHACHHANG(
MaKH char (20) not null,
TenKH varchar(50) not null,
DiaChi varchar(50) not null,
SoDT char(20) not null,
MaSoThue char(20) not null,
Constraint pk_MaKH primary key (MaKH)

)

create table MUCTIENGIO(
MaTienGio char(20) not null,
DonGia varchar(20)not null,
MoTa varchar(50) not null,
Constraint pk_MaTienGio primary key (MaTienGio)

)
create table PHONG(
MaPhong CHAR(20) NOT NULL,
SoKhachToiDa char(50) not null,
TrangThai varchar(50) not null,
MoTa varchar(50) not null,
constraint pk_MaPhong primary key (MaPhong)
)
CREATE TABLE HOADON(
MaHD char(20) not null,
MaKH char(20) not null,
MaPhong char(20) not null,
MaTienGio char(20) not null,
ThoiGianBatDauSD datetime not null,
ThoiGianKetThucSD DATETIME not null,
TrangThaiHD varchar(100) not null,
Constraint pk_MaHD primary key (MaHD),
CONSTRAINT fk_MaKH FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
Constraint fk_MaPhong Foreign key (MaPhong) References PHONG(MaPhong),
Constraint fk_MaTienGio foreign key (MaTienGio) references MUCTIENGIO(MaTienGio),

)
create table DICHVU
(
MaDV char(20) not null,
TenDV varchar(50) not null,
DonViTinh varchar(20) not null,
DonGia MONEY not null,
constraint pk_MaDV PRIMARY KEY (MaDV)
)
CREATE TABLE CHITIET_SUDUNGDV
(
MaHD char(20) not null,
MaDV CHAR(20) NOT NULL,
SoLuong CHAR(20) NOT NULL,
Constraint fk_MaHD foreign key (MaHD) references HOADON(MaHD),
Constraint fk_MaDV foreign key (MaDV) references DICHVU(MaDV)
)
insert KHACHHANG 
values
('KH001','Tran Van Nam','Hai Chau','0905123456','12345678'),
('KH002','Nguyen Mai Anh','Lien Chieu','0905123457','12345679'),
('KH003','Phan Hoai Lan Khue','Hoa Vang','0905123458','12345680'),
('KH004','Nguyen Hoai Nguyen','Hoa Cam','0905123459','12345681'),
('KH005','Le Truong Ngoc Anh','Hai Chau','0905123460','12345682'),
('KH006','Ho Hoai Anh','Hai Chau','0905123461','12345683'),
('KH007','Pham Thi Huong','Son Tra','0905123462','12345684'),
('KH008','Chau Trinh Tri','HaiChau','0905123462','12345685'),
('KH009','Phan Nhu Thao','Hoa Khanh','0905123464','12345686'),
('KH010','Tran Thi To Tam','Son Tra','0905123465','12345687')
insert MUCTIENGIO
values
('MT01','60000','Ap dung tu 6 gio den 17 gio'),
('MT02','80000','Ap dung sau 17 gio den 22 gio'),
('MT03','100000','Ap dung tu sau 22 gio den 6 gio sang')

insert PHONG
VALUES
('VIP01','5','Duoc su dung','phong vip'),
('P02','10','Duoc su dung','phong binh thuong'),
('P03','15','Duoc su dung','phong binh thuong'),
('VIP04','20','Duoc su dung','phong vip'),
('P05','25','Duoc su dung','phong binh thuong'),
('P06','30','Duoc su dung','phong binh thuong'),
('VIP07','35','Duoc su dung','phong vip'),
('P08','40','Duoc su dung','phong binh thuong'),
('VIP09','45','Duoc su dung','phong vip'),
('P10','50','Duoc su dung','phong binh thuong')
insert DICHVU
values
('DV01','Hat Dua','Bao','5000'),
('DV02','Trai cay','Dia','30000'),
('DV03','Bia','Lon','35000'),
('DV04','Nuoc ngot','Chai','10000'),
('DV05','Ruou','Chai','200000')
insert HOADON
values
('HD001','KH001','VIP01','MT01','2015/11/20 8:15','2015/11/20 12:30','Da thanh toan'),
 ('HD002','KH002','P02','MT01',' 2015/12/12 13:10','2015/12/12  17:20','Chua thanh toan'),
 ('HD003','KH001','P02','MT01','2014/10/15 12:12','2014/10/15 16:30','Da thanh toan'),
 ('HD004','KH003','VIP01','MT02','2015/9/20 18:30','2015/9/20 21:00','Chua thanh toan'),
 ('HD005','KH001','P03','MT02',' 2014/11/25 20:00','2014/11/25 21:45','Thanh toan mot phan'),
 ('HD006','KH002','VIP01','MT01','2014/9/12 9:20','2014/9/12 10:45','Da thanh toan'),
 ('HD007','KH006','VIP04','MT01','2014/12/22 11:00','2014/12/22 14:20','Da thanh toan'),
 ('HD008','KH007','VIP04','MT02','2014/8/23 20:10','2014/8/23 22:00','Chua thanh toan'),
 ('HD009','KH006','P05','MT03','2015/12/20 22:30','2015/12/21 1:15','Chua thanh toan'),
 ('HD010','KH005','VIP01','MT03','2015/10/10 1:30','2015/10/10 3:15','Da thanh toan'),
 ('HD011','KH004','VIP07','MT03','2015/12/25 22:15','2015/12/26 2:00','Da thanh toan'),
 ('HD012','KH008','P06','MT03','2014/7/25 23:45','2015/7/26 2:15','Da thanh toan'),
 ('HD013','KH007','VIP07','MT02','2015/8/21 18:15','2015/8/21 20:45','Da thanh toan'),
 ('HD014','KH004','P06','MT02','2015/12/31 19:12','2015/12/31 21:15','Thanh toan mot phan'),
 ('HD015','KH001','P06','MT01','2014/6/24 13:00','2014/6/24 13:15','Thanh toan mot phan'),
 ('HD016','KH003','P08','MT01','2014/5/12 8:00','2014/5/12 10:45',' Thanh toan mot phan'),
 ('HD017','KH003','VIP09','MT01','2015/11/20 12:15','2015/11/20 14:20','Da thanh toan'),
 ('HD018','KH001','P10','MT01','2015/4/12 14:45','2015/4/12 16:45','Da thanh toan'),
 ('HD019','KH002','VIP09','MT03','2015/11/1 22:12','2015/11/13 2:00','Da thanh toan'),
 ('HD020','KH004','VIP09','MT03','2014/2/25 1:15','2014/2/25 4:15','Chua thanh toan')
 insert CHITIET_SUDUNGDV
 values
 ('HD001','DV01','5'),
 ('HD002','DV01','8'),
 ('HD002','DV02','5'),
 ('HD002','DV03','2'),
 ('HD003','DV04','1'),
 ('HD003','DV05','6'),
 ('HD004','DV01','5'),
 ('HD005','DV02','3'),
 ('HD005','DV03','10'),
 ('HD005','DV04','2'),
 ('HD006','DV01','5'),
 ('HD007','DV03','8'),
 ('HD007','DV04','10'),
 ('HD007','DV05','4'),
 ('HD013','DV02','9'),
 ('HD011','DV02','8')

 --Câu 3: Liệt kê những phòng karaoke chứa được số lượng tối đa dưới 20 khách 
 select * from PHONG
 where SoKhachToiDa <20
 --Câu 4: Liệt kê thông tin của các dịch vụ có đơn vị tính là "Chai" với đơn giá nhỏ hơn 20.000
--VNĐ và các dịch vụ có đơn vị tính là "Lon" với đơn giá lớn hơn 30.000 VNĐ
select *from DICHVU
where ((DonViTinh LIKE 'Chai'and DonGia <20000) or (DonViTinh LIKE 'Lon' and DonGia >30000))
--Câu 5: Liệt kê thông tin của các phòng karaoke có mã phòng bắt đầu bằng cụm từ "VIP"
select * from PHONG
where MaPhong like '%VIP%'
--Câu 6: Liệt kê thông tin của toàn bộ các dịch vụ, yêu cầu sắp xếp giảm dần theo đơn giá
select *from DICHVU
ORDER BY DonGia desc
--Câu 7: Đếm số hóa đơn có trạng thái là "Chưa thanh toán" và có thời gian bắt đầu sử
--dụng nằm trong ngày hiện tại
select count(TrangThaiHD) 
from HOADON
WHERE TrangThaiHD like 'Chua thanh toan' and ThoiGianBatDauSD=GETDATE()
--Câu 8: Liệt kê địa chỉ của toàn bộ các khách hàng với yêu cầu mỗi địa chỉ được liệt kê một
--lần duy nhất
 select distinct DiaChi
 from KHACHHANG 

 --Câu 9: Liệt kê MaHD, MaKH, TenKH, DiaChi, MaPhong, DonGia (Tiền giờ),
--ThoiGianBatDauSD, ThoiGianKetThucSD của tất cả các hóa đơn có trạng thái là "Đã thanh
--toán" 
SELECT hd.MaHD,kh.MaKH,kh.TenKH,kh.DiaChi,mtg.DonGia,hd.ThoiGianBatDauSD,hd.ThoiGianKetThucSD
FROM KHACHHANG AS kh,PHONG AS p,HOADON as hd,MUCTIENGIO AS mtg
where kh.MaKH=hd.MaKH and p.MaPhong=hd.MaPhong AND mtg.MaTienGio=hd.MaTienGio and hd.TrangThaiHD like 'Da thanh toan'

--Câu 10: Liệt kê MaKH, TenKH, DiaChi, MaHD, TrangThaiHD của tất cả các hóa đơn với
--yêu cầu những khách hàng chưa từng có một hóa đơn nào thì cũng liệt kê thông tin
--những khách hàng đó ra
select kh.MaKH,kh.TenKH,kh.DiaChi,hd.MaHD,hd.TrangThaiHD
from KHACHHANG AS kh left join HOADON as hd
on kh.MaKH=hd.MaKH 
--Câu 11: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ "Trái cây" hoặc từng
--sử dụng phòng karaoke có mã phòng là "VIP07" 
select distinct kh.*
from KHACHHANG as kh, HOADON as hd
where kh.MaKH = hd.MaKH and (	hd.MaPhong = 'VIP07' or 
								hd.MaHD in
								 (select hd.MaHD from HOADON as hd,CHITIET_SUDUNGDV as ct where hd.MaHD=ct.MaHD and ct.MaDV='DV02') 
							)
--12 Liệt kê thông tin của các khách hàng chưa từng sử dụng dịch vụ hát karaoke lần nào
--cả
select distinct kh.*
from KHACHHANG as kh
where kh.MaKH not in (select hd.MaKH from HOADON as hd)
--Câu 13: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ hát karaoke và chưa
--từng sử dụng dịch vụ nào khác kèm theo
select *
from KHACHHANG 
where MaKH in (select MaKH  from HOADON 
                   where MaHD not in (select MaHD from CHITIET_SUDUNGDV))

--Câu 14: Liệt kê thông tin của những khách hàng đã từng hát karaoke vào năm "2014" nhưng
--chưa từng hát karaoke vào năm "2015"
 Select *
  from KHACHHANG 
 where MaKH in (select  MaKH from HOADON 
                      where year (ThoiGianBatDauSD)='2014' and MaKh NOT IN
					  (select MaKH FROM HOADON
					  WHERE year(ThoiGianKetThucSD) ='2015'))
--15Hiển thị thông tin của những khách hàng có số lần hát karaoke nhiều nhất tính từ
--đầu năm 2014 đến hết năm 2014
select * from KHACHHANG
where MaKH IN (
				Select MaKH from HOADON
				where ThoiGianBatDauSD between '2014-1-1' and '2014-12-31'
				group by MaKH
				having count(*) =( 
									Select Top (1) count(*) from HoaDon
									where ThoiGianBatDauSD between '2014-1-1' and '2014-12-31'
									group by MaKH
									order by count(*) DESC 
								 )
				)
--16 Đếm tổng số lượng loại dịch vụ đã được sử dụng trong năm 2014 với yêu cầu chỉ
--thực hiện tính đối với những loại dịch vụ có đơn giá từ 50.000 VNĐ trở lên
select count (ct.MaDV) SL
FROM HOADON AS HD JOIN CHITIET_SUDUNGDV ct on ct.MaHD=HD.MaHD
where ThoiGianBatDauSD between '2014-1-1' and '2014-12-31'
group by ct.MaHD
having count (ct.MaHD)=(select count (MaDV) FROM DICHVU as DV
      where DV.DonGia>50000)
--17 Liệt kê MaKH, TenKH, MaSoThue của khách hàng có địa chỉ là "Hải Châu" và
--chỉ mới hát karaoke một lần duy nhất, kết quả được sắp xếp giảm dần theo TenKH
select distinct MaKH,TenKH,MaSoThue
FROM KHACHHANG 
where DiaChi like 'Hai Chau' and MaKH IN ( select MaKH
 from HOADON
   GROUP BY MaKH
   having count (*)=1)
--18Cập nhật cột TrangThaiHD trong bảng HOADON thành giá trị "Đã hết hạn" đối với
--những khách hàng có địa chỉ là "Hải Châu" và có ThoiGianKetThucSD trước ngày
--31/12/2015
update HOADON
set TrangThaiHD='Da het han'
where MaHD in (select hd.MaHD FROM HOADON AS hd ,KHACHHANG as kh
       WHERE  ThoiGianBatDauSD<'2015-12-31' and hd.MaKH=kh.MaKH 
	   and kh.DiaChi ='Hai Chau')
select * from PHONG
--19Cập nhật cột MoTa trong bảng PHONG thành giá trị "Được sử dụng nhiều" cho
--những phòng được sử dụng từ 5 lần trở lên trong tháng 5 năm 2015
update PHONG
set MoTa ='Duoc su dung nhieu nhat'
WHERE MaPhong IN( SELECT MaPhong FROM HoaDon 
							WHERE MONTH(ThoiGianBatDauSD) = 5 AND
							 YEAR(ThoiGianBatDauSD) = 2015 
							 GROUP BY HoaDon.MaPhong
							 HAVING COUNT(HoaDon.MaPhong) > 5 
--20 Xóa những hóa đơn có ThoiGianBatDauSD trước ngày 20/11/2015 
 


	DELETE 
	FROM HoaDon 
	WHERE  ThoiGianBatDauSD < '2015-11-20'

	SELECT * FROM HOADON
	