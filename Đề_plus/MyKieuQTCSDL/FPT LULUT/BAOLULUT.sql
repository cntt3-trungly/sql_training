use master
 go
 

 use BAOLULUT
 go

 create table DV_UNG_HO
 (
 MADVUH varchar(20) not null,
 HoTenNguoiDaiDien nvarchar(100) not null,
 DiaChiNguoiDaiDien nvarchar(100) not null,
 SDTLienLac nvarchar(100) not null,
 SoCMNDNguoiDaiien nvarchar(100) not null,
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
 LaHoNgheo nvarchar(100) not null
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
DROP TABLE DOT_NHAN_UNG_HO

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
select *from HO_DAN
--cau 3 : Liet ke nhung ho dan co tu 5 khau tro len
select * from HO_DAN WHERE SoNhanKhau >= '5'

-- cau 4: Liệt kê các hộ dân là hộ nghèo và thuộc diện gia đình 'Thuong binh' và các hộ dân kh là hộ nghèo công nhân viên chức
select * from HO_DAN
WHERE (LaHoNgheo = 'Dung' and DienGiaDinh like 'Thuong Binh' ) 
or (LaHoNgheo = 'Sai' and DienGiaDinh like 'Cong Nhan Vien Chuc' )


-- cau 5 liệt kê các đơn vị ủng hộ có MADVUH bắt đầu bằng cụm cty
 select * from DV_UNG_HO
 where MADVUH like 'CTY%'

-- Cau 6 Liệt kê thông tin của toàn hộ dân iu cầu sắp xếp giảm dần
select * from HO_DAN
order by SoNhanKhau DESC

-- Cau 7Đếm số lượt ủng hộ diễn ra trong ngày hiện tại (của hệ thống) 
select COUNT (MADUH) from DOT_UNG_HO
WHERE NgayUngHo = GETDATE()

-- Cau 8Liệt kê toàn bộ các loại diện gia đình trong bảng HO_DAN với yêu cầu mỗi loại diện gia đình được liệt kê một lần duy nhất
select distinct DienGiaDinh from HO_DAN

-- Cau 9Liệt kê MaDotUngHo, NgayUngHo, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, SoCMNDNguoiDaiDien
--của tất cả các đợt ủng hộ có trong hệ thống
select MADUH,NgayUngHo,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SDTLienLac,SoCMNDNguoiDaiien
 from DV_UNG_HO,DOT_UNG_HO
where DV_UNG_HO.MADVUH = DOT_UNG_HO.MADVUH

select MADUH,NgayUngHo,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SDTLienLac,SoCMNDNguoiDaiien
from DOT_UNG_HO inner join DV_UNG_HO on DOT_UNG_HO.MaDVUH = DV_UNG_HO.MaDVUH
-- Cau 10Liệt kê MaHoDan, HoTenChuHo, ToDanPho, KhoiHoacThon, DienGiaDinh, MaDotNhanUngHo, NgayNhanUngHo của tất cả các hộ dân
--với yêu cầu những hộ dân nào chưa từng được nhận ủng hộ lần nào thì cũng liệt kê thông tin những hộ dân đó ra
select HO_DAN.MAHD,HoTenChuHo,ToDanPho,KhoiHoacThon,DienGiaDinh,MADNUH,NgayNhanUngHo
from HO_DAN
left join DOT_NHAN_UNG_HO
on HO_DAN.MAHD = DOT_NHAN_UNG_HO.MAHD

select HO_DAN.MAHD,HoTenChuHo,ToDanPho,KhoiHoacThon,DienGiaDinh,MADNUH,NgayNhanUngHo
from HO_DAN
right join DOT_NHAN_UNG_HO
on HO_DAN.MAHD = DOT_NHAN_UNG_HO.MAHD 
select HO_DAN.MAHD,HoTenChuHo,ToDanPho,KhoiHoacThon,DienGiaDinh,MADNUH,NgayNhanUngHo
from HO_DAN
inner join DOT_NHAN_UNG_HO
on HO_DAN.MAHD = DOT_NHAN_UNG_HO.MAHD
select HO_DAN.MAHD,HoTenChuHo,ToDanPho,KhoiHoacThon,DienGiaDinh,MADNUH,NgayNhanUngHo
from HO_DAN
 join DOT_NHAN_UNG_HO
on HO_DAN.MAHD = DOT_NHAN_UNG_HO.MAHD

-- Cau 11 Liệt kê thông tin của các hộ dân đã từng được nhận ủng hộ dưới hình thức là 'Tien mat' hoặc là hộ dân thuộc diện hộ nghèo mà có số nhân khẩu dưới 3 người


select DISTINCT HO_DAN.MAHD,HoTenChuHo,ToDanPho,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh
from HO_DAN, DOT_NHAN_UNG_HO
where HO_DAN.MAHD IN
(select DISTINCT MAHD from DOT_NHAN_UNG_HO,CHI_TIET_NHAN_UNG_HO
WHERE (DOT_NHAN_UNG_HO.MADNUH = CHI_TIET_NHAN_UNG_HO.MADNUH ) AND CHI_TIET_NHAN_UNG_HO.MAHTUH = 'HT01')
UNION 
SELECT DISTINCT MAHD,HoTenChuHo,ToDanPho,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh
FROM HO_DAN 
Where LaHoNgheo = 'Dung' and SoNhanKhau < 3

-- Cau 12Liệt kê thông tin của các hộ dân chưa từng được nhận ủng hộ lần nào cả 
select HO_DAN.MAHD, HoTenChuHo,ToDanPho,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh,LaHoNgheo
from HO_DAN
 where  HO_DAN.MAHD  not in  (select MAHD from DOT_NHAN_UNG_HO )
 --c2
 select HO_DAN.MAHD, HoTenChuHo,ToDanPho,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh,LaHoNgheo
from HO_DAN
 where    not  EXISTS  (select MAHD from DOT_NHAN_UNG_HO where HO_DAN.MAHD= DOT_NHAN_UNG_HO.MAHD)


-- Cau 13 Liệt kê thông tin của các đơn vị ủng hộ đã từng ủng hộ dưới hình thức 'Tien mat' và chưa từng ủng hộ dưới hình thức 'Quan ao'
select DV_UNG_HO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SDTLienLac,SoCMNDNguoiDaiien,SoTKNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DV_UNG_HO,DOT_UNG_HO,CHI_TIET_UNG_HO,HINH_THUC_UH
where DV_UNG_HO.MaDVUH =DOT_UNG_HO.MaDVUH and DOT_UNG_HO.MADUH=CHI_TIET_UNG_HO.MADUH and CHI_TIET_UNG_HO.MAHTUH =HINH_THUC_UH.MAHTUH
and  TenHinhThucUngHo= 'Tien mat'
intersect--giao
(
select DV_UNG_HO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SDTLienLac,SoCMNDNguoiDaiien,SoTKNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DV_UNG_HO,DOT_UNG_HO,CHI_TIET_UNG_HO
where DV_UNG_HO.MaDVUH =DOT_UNG_HO.MaDVUH and DOT_UNG_HO.MADUH=CHI_TIET_UNG_HO.MADUH and MAHTUH
not in (select MAHTUH from HINH_THUC_UH where TenHinhThucUngHo = 'Quan ao')
)
--Câu 14Liệt kê thông tin của những đơn vị ủng hộ đã từng ủng hộ vào năm "2015" nhưng chưa từng ủng hộ vào năm "2016"
select DV_UNG_HO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SDTLienLac,SoCMNDNguoiDaiien,SoTKNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DV_UNG_HO,DOT_UNG_HO
where DV_UNG_HO.MaDVUH = DOT_UNG_HO.MaDVUH and year(NgayUngHo)=2015
except--ngoại trừ select thứ 2
select DV_UNG_HO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SDTLienLac,SoCMNDNguoiDaiien,SoTKNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DV_UNG_HO,DOT_UNG_HO
where DV_UNG_HO.MaDVUH = DOT_UNG_HO.MaDVUH and year(NgayUngHo)=2016

--Câu 15 Hiển thị thông tin của những đơn vị ủng hộ đã thực hiện ít nhất 2 đợt ủng hộ tính từ 30/07/2015 đến hết năm 2015
select * from DV_UNG_HO where MaDVUH in 
(
	select MaDVUH from DOT_UNG_HO
	where NgayUngHo between '07-31-2015' and '12-31-2015'
	group by MaDVUH
	having count(MaDVUH) >=2
)
--Câu 16Đếm tổng số đợt được nhận ủng hộ của từng hộ dân trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những đợt được nhận ủng hộ có hình thức nhận ủng hộ là 'Tien mat'
select count(HO_DAN.MAHD) from HO_DAN,DOT_NHAN_UNG_HO,CHI_TIET_NHAN_UNG_HO
 where HO_DAN.MAHD = DOT_NHAN_UNG_HO.MAHD and DOT_NHAN_UNG_HO.MADNUH= CHI_TIET_NHAN_UNG_HO.MADNUH and MAHTUH in (
	select MAHTUH from HINH_THUC_UH
	where year(NgayNhanUngHo) = 2016 and TenHinhThucUngHo = 'Tien mat'

)
--Câu 17Liệt kê những ngày vừa diễn ra sự kiện có đơn vị ủng hộ đến trao hàng cứu trợ cho chính quyền,
--vừa diễn ra sự kiện có hộ dân được chính quyền phân phối hàng cứu trợ, kết quả được sắp xếp tăng dần theo ngày tìm được
select NgayUngHo
from DOT_UNG_HO,DOT_NHAN_UNG_HO
where NgayUngHo = NgayNhanUngHo
order by NgayUngHo 

--Câu 18Cập nhật cột DonViTinh trong bảng CHI_TIET_UNG_HO thành NULL đối với record có hình thức ủng hộ với TenHinhThucUngHo là 'Quan ao'
--và có ngày ủng hộ (NgayUngHo) trước ngày 30/12/2015
update CHI_TIET_UNG_HO
set DonViTinh = 'NULL' 
where MAHTUH in (
	select MAHTUH from HINH_THUC_UH,DOT_UNG_HO
	where TenHinhThucUngHo = 'Quan ao'and NgayUngHo < '12-30-2015'
)
select * from CHI_TIET_NHAN_UNG_HO

--Câu 19Xóa những hộ dân chưa từng được nhận một lần ủng hộ nào từ chính quyền
delete HO_DAN where MAHD not in
(select MAHD from DOT_NHAN_UNG_HO)

--Câu 20óa những record trong bảng CHI_TIET_UNG_HO của những đợt ủng hộ diễn ra trước năm 2015 
DELETE CHI_TIET_UNG_HO WHERE
MADUH IN (SELECT MADUH FROM DOT_UNG_HO WHERE YEAR(NgayUngHo)<2015)


