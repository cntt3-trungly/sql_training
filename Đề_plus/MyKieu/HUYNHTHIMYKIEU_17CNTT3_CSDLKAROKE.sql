use master
go
CREATE DATABASE KAROKE
use KAROKE
go
CREATE TABLE KhachHang(
   MaKH char(10) NOT NULL,
   TenKH varchar(50) NOT NULL,
   DiaChi varchar(50) NOT NULL,
   SoDT varchar(20) NOT NULL,
   MaSoThue char(10) NOT NULL
CONSTRAINT pk_MaKH PRIMARY KEY (MaKH)
)
CREATE TABLE MucTienGio(
   MaTienGio char(10) NOT NULL,
   DonGia varchar(20) NOT NULL,
   MoTa varchar(50) NOT NULL,
CONSTRAINT pk_MaTienGio PRIMARY KEY (MaTienGio)
)
CREATE TABLE Phong(
   MaPhong char(10) NOT NULL,
   SoKhachToiDa int NOT NULL,
   TrangThai varchar(50) NOT NULL,
   MoTa varchar(50) NOT NULL,
CONSTRAINT pk_MaPhong PRIMARY KEY (MaPhong)
)
CREATE TABLE DichVu(
   MaDV char(10) NOT NULL,
   TenDV varchar(50) NOT NULL,
   DonViTinh varchar(20) NOT NULL,
   DonGia money NOT NULL,
CONSTRAINT pk_MaDV PRIMARY KEY (MaDV)
)
CREATE TABLE HoaDon(
   MaHD char(10) NOT NULL,
   MaKH char(10) NOT NULL,
   MaPhong char(10) NOT NULL,
   MaTienGio char(10) NOT NULL,
   ThoiGianBatDauSD Datetime NOT NULL,
   ThoiGianKetThucSD Datetime NOT NULL,
   TrangThaiHD varchar(50) NOT NULL,
 CONSTRAINT pk_MaHD PRIMARY KEY (MaHD),
 CONSTRAINT fk_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
 CONSTRAINT fk_MaPhong FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong),
 CONSTRAINT fk_MaTienGio FOREIGN KEY (MaTienGio) REFERENCES MucTienGio(MaTienGio)
)
CREATE TABLE ChiTiet_SuDungDV(
   MaHD char(10) NOT NULL,
   MaDV char(10) NOT NULL,
   SoLuong int NOT NULL,
   CONSTRAINT fk_MaHD FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
   CONSTRAINT fk_MaDV FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV)
 )
 insert KhachHang
 values
 ('KH001 ' ,'Tran Van Nam ','Hai Chau ','0905123456','12345678'),
 ('KH002 ' ,'Nguyen Mai Anh ','Lien Chieu ','0905123457','12345679'),
 ('KH003 ' ,'Phan Hoai Lan Khue ','Hoa Vang ','0905123458','12345680'),
 ('KH004 ' ,'Nguyen Hoai Nguyen ','Hoa Cam ','0905123459','12345681'),
 ('KH005 ' ,'Le Truong Ngoc Anh ','Hai Chau ','0905123460','12345682'),
 ('KH006 ' ,'Ho Hoai Anh ','Hai Chau ','0905123461','12345683'),
 ('KH007 ' ,'Pham Thi Huong ','Son Tra ','0905123462','12345684'),
 ('KH008 ' ,'Chau Trinh Tri ','Hai Chau ','0905123463','12345685'),
 ('KH009 ' ,'Phan Nhu Thao ','Hoa Khanh ','0905123464','12345686'),
 ('KH010 ' ,'Tran Thi To Tam ','Son Tra ','0905123465','12345687')
 select *from KhachHang
 insert Phong
 values
 ('VIP01','5','Duoc su dung ','phong vip'),
 ('P02','10','Duoc su dung ','phong binh thuong'),
 ('P03','15','Duoc su dung ','phong binh thuong'),
 ('VIP04','20','Duoc su dung ','phong vip'),
 ('P05','25','Duoc su dung ','phong binh thuong'),
 ('P06','30','Duoc su dung ','phong binh thuong'),
 ('VIP07','35','Duoc su dung ','phong vip'),
 ('P08','40','Duoc su dung ','phong binh thuong'),
 ('VIP09','45','Duoc su dung ','phong vip'),
 ('P10','50','Duoc su dung ','phong binh thuong')
 select *from Phong
 insert DichVu
 values
 ('DV01 ','Hat Dua ','Bao ','5000 '),
 ('DV02 ','Trai Cay ','Dia','30000 '),
 ('DV03 ','Bia ','Lon','35000 '),
 ('DV04 ','Nuoc Ngot ','Chai ','10000'),
 ('DV05 ','Ruou ','Chai ','200000 ')
 select *from DichVu
 insert MucTienGio
 values
 ('MT01 ', '60000','Ap dung tu 6 gio den 17 gio '),
 ('MT02 ', '80000','Ap dung tu 17 gio den 22 gio '),
 ('MT03 ', '100000','Ap dung tu 22 gio den 6 gio sang')
 select *from MucTienGio
 insert HoaDon
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
 select *from HoaDon
 insert ChiTiet_SuDungDV
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
 select*from ChiTiet_SuDungDV
 --câu3Liệt kê những phòng karaoke chứa được số lượng tối đa dưới 20 khách 
 select *from Phong
 where SoKhachToiDa<20
 --câu4Liệt kê thông tin của các dịch vụ có đơn vị tính là "Chai" với đơn giá nhỏ hơn 20.000 VNĐ và các dịch vụ có đơn vị tính là "Lon" với đơn giá lớn hơn 30.000 VNĐ 
 select*from DichVu
 where (DonViTinh='Chai' and DonGia<20000)or(DonViTinh='Lon' and DonGia>30000)
 --câu5Liệt kê thông tin của các phòng karaoke có mã phòng bắt đầu bằng cụm từ "VIP" 
 select *from Phong
 where MaPhong like '%VIP%'
 --câu6: Liệt kê thông tin của toàn bộ các dịch vụ, yêu cầu sắp xếp giảm dần theo đơn giá 
 select *from DichVu
 order by DonGia desc
 --câu7Đếm số hóa đơn có trạng thái là "Chưa thanh toán" và có thời gian bắt đầu sử dụng nằm trong ngày hiện tại 
 select count(*) from HoaDon
 where TrangThaiHD like 'Chua thanh toan'and ThoiGianBatDauSD=GETDATE()
 --câu8Liệt kê địa chỉ của toàn bộ các khách hàng với yêu cầu mỗi địa chỉ được liệt kê một lần duy nhất 
 select distinct DiaChi
 From KhachHang
 --câu 9Liệt kê MaHD, MaKH, TenKH, DiaChi, MaPhong, DonGia (Tiền giờ), ThoiGianBatDauSD, ThoiGianKetThucSD của tất cả các hóa đơn có trạng thái là "Đã thanh toán" 
 select hd.MaHD,kh.MaKH,kh.TenKH,kh.DiaChi,p.MaPhong,mtg.DonGia,hd.ThoiGianBatDauSD,hd.ThoiGianKetThucSD
 from HoaDon as hd,KhachHang as kh,Phong as p,MucTienGio as mtg
 where kh.MaKH=hd.MaKH and p.MaPhong=hd.MaPhong and mtg.MaTienGio=hd.MaTienGio and hd.TrangThaiHD like 'Da thanh toan'
 --câu 10Liệt kê MaKH, TenKH, DiaChi, MaHD, TrangThaiHD của tất cả các hóa đơn với yêu cầu những khách hàng chưa từng có một hóa đơn nào thì cũng liệt kê thông tin những khách hàng đó ra 
	SELECT KH.MaKH, TenKH,DiaChi,HD.MaHD,TrangThaiHD
	FROM KhachHang KH LEFT JOIN HoaDon HD
		ON KH.MaKH=HD.MaKH
 --câu11: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ "Trái cây" hoặc từng sử dụng phòng karaoke có mã phòng là "VIP07" 
select distinct kh.*
from KhachHang as kh, HoaDon as hd
where kh.MaKH = hd.MaKH and (	hd.MaPhong = 'VIP07' or 
								hd.MaHD in
								 (select hd.MaHD from HoaDon as hd,ChiTiet_SuDungDV as ct where hd.MaHD=ct.MaHD and ct.MaDV='DV02') 
							)
--câu12Liệt kê thông tin của các khách hàng chưa từng sử dụng dịch vụ hát karaoke lần nào cả 
select kh.MaKH,kh.TenKH
from KhachHang as kh
where kh.MaKH not in (select hd.MaKH from HoaDon as hd)
--câu 13: Liệt kê thông tin của các khách hàng đã từng sử dụng dịch vụ hát karaoke và chưa từng sử dụng dịch vụ nào khác kèm theo 
select *
from KhachHang
where MaKH in (select MaKH
           from HoaDon 
		   where MaHD NOT IN (select MaHD 
		                      from ChiTiet_SuDungDV))
--câu14: Liệt kê thông tin của những khách hàng đã từng hát karaoke vào năm "2014" nhưng chưa từng hát karaoke vào năm "2015"  
select *
from KhachHang
where MaKH in (select MaKH
					FROM HoaDon
					where Year(ThoiGianBatDauSD)=2014
                     and MaKH not in (select MaKH
					 from HoaDon where Year(ThoiGianKetThucSD)=2015))

--Câu 15: Hiển thị thông tin của những khách hàng có số lần hát karaoke nhiều nhất tính từ đầu năm 2014 đến hết năm 2014 
select * from KhachHang
where MaKH IN (
				Select MaKH from HoaDon
				where ThoiGianBatDauSD between '2014-1-1' and '2014-12-31'
				group by MaKH
				having count(*) =( 
									Select Top (1) count(*) from HoaDon
									where ThoiGianBatDauSD between '2014-1-1' and '2014-12-31'
									group by MaKH
									order by count(*) DESC 
								 )
				)
--Câu16Đếm tổng số lượng loại dịch vụ đã được sử dụng trong năm 2014 với yêu cầu chỉ thực hiện tính đối với những loại dịch vụ có đơn giá từ 50.000 VNĐ trở lên 
	SELECT COUNT(CT.MaDV) SL
	FROM HoaDon HD JOIN ChiTiet_SuDungDV CT ON HD.MaHD=CT.MaHD
	WHERE ThoiGianBatDauSD BETWEEN '2014-1-1' AND '2014-12-31'
	GROUP BY CT.MaHD
	HAVING COUNT(CT.MaHD)= (SELECT COUNT(MaDV) FROM DichVu DV
							WHERE DV.DonGia>5000
							)
--Câu17Liệt kê MaKH, TenKH, MaSoThue của khách hàng có địa chỉ là "Hải Châu" và chỉ mới hát karaoke một lần duy nhất, kết quả được sắp xếp giảm dần theo TenKH 
select distinct MaKH,TenKH,MaSoThue from KhachHang
where DiaChi='Hai Chau' and MaKH in (
										Select MaKH from HoaDon
										group by MaKH
										having count(*)=1
									)
--câu18Cập nhật cột TrangThaiHD trong bảng HOADON thành giá trị "Đã hết hạn" đối với những khách hàng có địa chỉ là "Hải Châu" và có ThoiGianKetThucSD trước ngày 31/12/2015 
update HoaDon
set TrangThaiHD = 'Da Het Han'
where MaHD in (
				select hd.MaHD from HoaDon hd,KhachHang kh
				where ThoiGianKetThucSD < '2015-12-31' and kh.MaKH=hd.MaKH and kh.DiaChi ='Hai Chau'
			  )
--câu19Cập nhật cột MoTa trong bảng PHONG thành giá trị "Được sử dụng nhiều" cho những phòng được sử dụng từ 5 lần trở lên trong tháng 5 năm 2015  
    UPDATE Phong
	SET MoTa='Duoc su dung nhieu'
	WHERE MaPhong IN( SELECT MaPhong FROM HoaDon 
							WHERE MONTH(ThoiGianBatDauSD) = 5 AND
							 YEAR(ThoiGianBatDauSD) = 2015 
							 GROUP BY HoaDon.MaPhong
							 HAVING COUNT(HoaDon.MaPhong) > 5 )
--câu20Xóa những hóa đơn có ThoiGianBatDauSD trước ngày 20/11/2015 
    DELETE 
	FROM ChiTiet_SuDungDV	
	where MaHD in(
	select MaHD from HoaDon
	WHERE  ThoiGianBatDauSD < '2015-11-20')
	DELETE 
	FROM HoaDon 
	WHERE  ThoiGianBatDauSD < '2015-11-20'
	