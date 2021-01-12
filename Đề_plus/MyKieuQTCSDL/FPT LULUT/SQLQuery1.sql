use master
go
use ll
go
create table DV_UNG_HO
 (
 MADVUH varchar(20) not null,
 HoTenNguoiDaiDien nvarchar(100) not null,
 DiaChiNguoiDaiDien nvarchar(100) not null,
 SDTLienLac nvarchar(100) not null,
 SoCMNDNguoiDaidien nvarchar(100) not null,
 SoTKNganHang nvarchar(100) not null,
 TenNganHang nvarchar(100) not null,
 ChiNhanhNganHang nvarchar(100) not null,
 TenChuTKNganHang nvarchar(100) not null,
 CONSTRAINT PK_MADVUH PRIMARY KEY (MADVUH)
 )

 create table HO_DAN
 (
 MAHD varchar(20) not null,
 HoTenChuHo nvarchar(100) not null,
 ToDanPho nvarchar(100) not null,
 KhoiHoacThon nvarchar(100) not null,
 SoDienThoai nvarchar(10) not null,
 DiaChiNha nvarchar(100) not null,
 SoNhanKhau nvarchar(100) not null,
 DienGiaDinh nvarchar(100) not null,
 LaHoNgheo nvarchar(100) not null,
 CONSTRAINT PK_MAHD PRIMARY KEY (MAHD)
 )

 create table DOT_UNG_HO
 (
 MADUH varchar(20) not null,
 MADVUH varchar(20) not null,
 NgayUngHo date not null,
 CONSTRAINT PK_MADUH PRIMARY KEY (MADUH),
 CONSTRAINT FK_MADVUH FOREIGN KEY (MADVUH) REFERENCES DV_UNG_HO(MADVUH)
 )

 create table HINH_THUC_UH
 (
 MAHTUH varchar(20) not null PRIMARY KEY,
 TenHinhThucUngHo nvarchar(100) not null
 )
 
create table DOT_NHAN_UNG_HO
(
MADNUH varchar(20) not null PRIMARY KEY,
MAHD varchar(20) not null ,
NgayNhanUngHo date not null,
CONSTRAINT FK_MAHD FOREIGN KEY (MAHD) REFERENCES HO_DAN(MAHD)
)


create table CHI_TIET_UNG_HO
(
MADUH varchar(20) not null,
MAHTUH varchar(20) not null ,
SoLuongUngHo int not null,
DonViTinh nvarchar(100),  
PRIMARY KEY (MADUH,MAHTUH)
)

create table CHI_TIET_NHAN_UNG_HO
(
MADNUH varchar(20) not null,
MAHTUH varchar(20) not null,
SoLuongNhanUngHo int not null,
DonViTinh nvarchar(100), 
PRIMARY KEY (MADNUH, MAHTUH)
)

INSERT INTO DV_UNG_HO values
('CN001','Nguyen Van A1','Nui Thanh, Quang Nam','0905121121','124898000','65874000','TienPhong Bank','Da Nang','Nguyen Van A1'),
('CN002','Nguyen Van A2','Phong Dien, Thua Thien Hue','0905121122','124898001','65874001','Vietcom Bank','Quang Nam','Nguyen Van A2'),
('CTY01','Nguyen Van A3','Tam Dao, Vinh Phuc','0905121123','124898002','65874002','DongA Bank','Thua Thien Hue','Nguyen Van A3'),
('CTY02','Nguyen Van A4','Ba To, Quang Ngai','0905121124','124898003','65874003','M Bank','Gia Lai','Nguyen Van A4')

INSERT INTO HO_DAN values
('HD001','Tran Van B1','10','5','0915222000','12 Tran Van On','5','Cong Nhan Vien Chuc','Dung'),
('HD002','Tran Van B2','11','6','0915222001','13 Nguyen Huu Tho','2','Cong Nhan Vien Chuc','Sai'),
('HD003','Tran Van B3','12','7','0915222002','14 Phan Chau Trinh','6','Thuong Binh','Dung'),
('HD004','Tran Van B4','13','7','0915222003','15 Phan Chau Trinh','1','Me VNAH','Dung')

INSERT INTO DOT_UNG_HO values
('UH001','CN002','2016-11-18'),
('UH002','CTY01','2015-11-19'),
('UH003','CTY02','2015-08-10'),
('UH004','CTY02','2015-10-20'),
('UH005','CTY02','2016-11-11')

INSERT INTO HINH_THUC_UH values
('HT01','Tien mat'),
('HT02','Mi tom'),
('HT03','Quan ao')

INSERT INTO DOT_NHAN_UNG_HO values
('NhanUH001','HD003','2016-11-11'),
('NhanUH002','HD001','2016-11-18'),
('NhanUH003','HD003','2016-11-20')


INSERT INTO CHI_TIET_UNG_HO values
('UH001','HT01','6000','USD'),
('UH002','HT02','50','Thung'),
('UH003','HT03','200','Bo'),
('UH004','HT01','100000','JPY'),
('UH005','HT01','100000','USD'),
('UH006','HT03','100','Bo')

INSERT INTO CHI_TIET_NHAN_UNG_HO values
('NhanUH001','HT01','5000','USD'),
('NhanUH001','HT02','50','Thung'),
('NhanUH002','HT03','100','Bo'),
('NhanUH003','HT01','10000000','VND'),
('NhanUH003','HT02','25','Thung'),
('NhanUH003','HT03','70','Bo')
--3 Liệt kê những hộ dân có từ 5 nhân khẩu trở lên 
select * from HO_DAN
WHERE SoNhanKhau >=5 
--4 Liệt kê các hộ dân là hộ nghèo và thuộc diện gia đình 'Thuong binh'
--và các hộ dân không là hộ nghèo và thuộc diện gia đình 'Cong nhan vien chuc'
SELECT * FROM HO_DAN
WHERE LaHoNgheo = 'Dung' and DienGiaDinh='Thuong Binh'
     or LaHoNgheo = 'Sai' and DienGiaDinh='Cong nhan vien chuc'
--5Liệt kê các đơn vị ủng hộ có MaDVUH bắt đầu bằng cụm từ "CTY"
select * from DV_UNG_HO
WHERE MADVUH LIKE '%CTY%'
--6Liệt kê thông tin của toàn bộ các hộ dân, yêu cầu sắp xếp giảm dần theo số nhân khẩu
SELECT * FROM HO_DAN
ORDER  BY SoNhanKhau DESC
--7Đếm số lượt ủng hộ diễn ra trong ngày hiện tại (của hệ thống) 
SELECT count(MADUH) 
FROM DOT_UNG_HO
WHERE NgayUngHo=getdate()




