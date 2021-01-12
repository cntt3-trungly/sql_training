

create table DONVIUNGHO
(
	MaDVUH char(10) not null,
	HoTenNguoiDaiDien nvarchar(50),
	DiaChiNguoiDaiDien nvarchar(50),
	SoDienThoaiLienLac char(20),
	SoCMNDNguoiDaiDien char(20),
	SoTaiKhoanNganHang char(20),
	TenNganHang nvarchar(50),
	ChiNhanhNganHang nvarchar(50),
	TenChuTKNganHang nvarchar(50),
	primary key(MADVUH)
)
create table DOTUNGHO
(
	MaDotUngHo char(10) not null,
	MaDVUH char(10),
	NgayUngHo date,
	primary key (MaDotUngHo)
)

create table CHITIETUNGHO
(
	MaDotUngHo char(10) not null,
	MaHinhThucUH char(10) not null,
	SoLuongUngHo int,
	DonViTinh char(10),
	primary key (MaDotUngHo,MaHinhThucUH)
)
create table HINHTHUCUH
(
	MaHinhThucUH char(10) not null,
	TenHinhThucUngHo nvarchar(50),
	primary key (MaHinhThucUH)
)
create table HODAN
(
	MaHoDan char(10) not null,
	HoTenChuHo nvarchar(50),
	ToDanPho int,
	KhoiHoacThon int,
	SoDienThoai char(20),
	DiaChiNha nvarchar(50),
	SoNhanKhau int,
	DienGiaDinh nvarchar(50),
	LaHoNgheo nvarchar(50),
	primary key (MaHoDan)	
)
create table DOTNHANUNGHO
(
	MaDotNhanUngHo char(10) not null,
	MaHoDan char(10) not null,
	NgayNhanUngHo date,
	primary key (MaDotNhanUngHo)
)
create table CHITIETNHANUNGHO
(
	MaDotNhanUngHo char(10) not null,
	MaHinhThucUH char(10) not null,
	SoLuongNhanUngHo int,
	DonViTinh char(10),
	primary key (MaDotNhanUngHo,MaHinhThucUH)
)

insert DONVIUNGHO
values
('CN001',N'Nguyen Van A1',N'Nui Thanh, Quang Nam','0905121121','124898000','65874000',N'TienPhong Bank',N'Da Nang',N'Nguyen Van A1'),
('CN002',N'Nguyen Van A2',N'Phong Dien, Thua Thien Hue','0905121122','124898001','65874001',N'Vietcom Bank',N'Quang Nam',N'Nguyen Van A2'),
('CTY01',N'Nguyen Van A3',N'Tam Dao, Vinh Phuc','0905121123','124898002','65874002',N'DongA Bank',N'Thua Thien Hue',N'Nguyen Van A3'),
('CTY02',N'Nguyen Van A4',N'Ba To, Quang Ngai','0905121124','124898003','65874003',N'Mbank',N'Gia Lai',N'Nguyen Van A4')

insert DOTUNGHO
values
('UH001','CN002','11-18-2016'),
('UH002','CTY01','11-19-2015'),
('UH003','CTY02','08-10-2015'),
('UH004','CTY02','10-20-2015'),
('UH005','CTY02','11-11-2016')

insert CHITIETUNGHO
values 
('UH001','HT01',6000,'USD'),
('UH002','HT02',50,'Thung'),
('UH003','HT03',200,'Bo'),
('UH003','HT01',100000,'JPY'),
('UH004','HT01',100000,'USD'),
('UH005','HT03',100,'Bo')

insert HINHTHUCUH
values
('HT01',N'Tien mat'),
('HT02',N'Mi tom'),
('HT03',N'Quan ao')

insert HODAN
values
('HD001',N'Tran Van B1',10,5,'0915222000',N'12 Tran Van On',5,N'Cong nhan vien chuc',N'Dung'),
('HD002',N'Tran Van B2',11,6,'0915222001',N'13 Nguyen Huu Tho',2,N'Cong nhan vien chuc',N'Sai'),
('HD003',N'Tran Van B3',12,7,'0915222002',N'14 Phan Chu Trinh',6,N'Thuong Binh',N'Dung'),
('HD004',N'Tran Van B4',13,7,'0915222003',N'15 Phan Chu Trinh',1,N'Me VNAH',N'Dung')
 
insert DOTNHANUNGHO
values 
('NhanUH001','HD003','11-11-2016'),
('NhanUH002','HD001','11-18-2016'),
('NhanUH003','HD003','11-20-2016')

insert CHITIETNHANUNGHO
values 
('NhanUH001','HT01',5000,'USD'),
('NhanUH001','HT02',50,'Thung'),
('NhanUH002','HT03',100,'Bo'),
('NhanUH003','HT01',1000000,'VND'),
('NhanUH003','HT02',25,'Thung'),
('NhanUH003','HT03',70,'Bo')

--Câu 3 Liệt kê những hộ dân có từ 5 nhân khẩu trở lên
select * from HODAN
where SoNhanKhau >=5

--Câu 4Liệt kê các hộ dân là hộ nghèo và thuộc diện gia đình 'Thuong binh' và các hộ dân không là hộ nghèo và thuộc diện gia đình 'Cong nhan vien chuc'
select * from HODAN
where (LaHoNgheo ='Dung' and DienGiaDinh = 'Thuong Binh')
or (LaHoNgheo ='Sai' and DienGiaDinh = 'Cong nhan vien chuc')

--Câu 5Liệt kê các đơn vị ủng hộ có MaDVUH bắt đầu bằng cụm từ "CTY"
select * from DONVIUNGHO
where MaDVUH like 'CTY%'

--Câu 6 Liệt kê thông tin của toàn bộ các hộ dân, yêu cầu sắp xếp giảm dần theo số nhân khẩu
select * from HODAN
order by SoNhanKhau desc

--Câu 7 Đếm số lượt ủng hộ diễn ra trong ngày hiện tại (của hệ thống)
select MaDotUngHo,MaDVUH,NgayUngHo,count(MaDotUngHo) from DOTUNGHO
group by MaDotUngHo,MaDVUH,NgayUngHo
having NgayUngHo = GETDATE()

--Câu 8Liệt kê toàn bộ các loại diện gia đình trong bảng HO_DAN với yêu cầu mỗi loại diện gia đình được liệt kê một lần duy nhất
select distinct DienGiaDinh from HODAN

--Câu 9Liệt kê MaDotUngHo, NgayUngHo, HoTenNguoiDaiDien, DiaChiNguoiDaiDien, SoDienThoaiLienLac, SoCMNDNguoiDaiDien
--của tất cả các đợt ủng hộ có trong hệ thống
select MaDotUngHo,NgayUngHo,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SoDienThoaiLienLac,SoCMNDNguoiDaiDien
from DOTUNGHO inner join DONVIUNGHO on DOTUNGHO.MaDVUH = DONVIUNGHO.MaDVUH

--Câu 10
select HODAN.MaHoDan, HoTenChuHo,ToDanPho,DienGiaDinh,MaDotNhanUngHo,NgayNhanUngHo
from HODAN full outer join DOTNHANUNGHO on HODAN.MaHoDan=DOTNHANUNGHO.MaHoDan

--Câu 11
select HODAN.MaHoDan,HoTenChuHo,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh,LaHoNgheo
from HODAN,DOTNHANUNGHO,CHITIETNHANUNGHO,HINHTHUCUH
where HODAN.MaHoDan= DOTNHANUNGHO.MaHoDan and DOTNHANUNGHO.MaDotNhanUngHo=CHITIETNHANUNGHO.MaDotNhanUngHo and CHITIETNHANUNGHO.MaHinhThucUH = HINHTHUCUH.MaHinhThucUH
and  TenHinhThucUngHo = 'Tien mat'
union
select HODAN.MaHoDan,HoTenChuHo,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh,LaHoNgheo
from HODAN
where  LaHoNgheo = 'Dung' and SoNhanKhau <3

--Câu 12
select HODAN.MaHoDan,HoTenChuHo,KhoiHoacThon,SoDienThoai,DiaChiNha,SoNhanKhau,DienGiaDinh,LaHoNgheo
from HODAN
 where  HODAN.MaHoDan not in  (select MaHoDan from DOTNHANUNGHO )

--Câu 13 
select DONVIUNGHO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SoDienThoaiLienLac,SoCMNDNguoiDaiDien,SoTaiKhoanNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DONVIUNGHO,DOTUNGHO,CHITIETUNGHO,HINHTHUCUH
where DONVIUNGHO.MaDVUH =DOTUNGHO.MaDVUH and DOTUNGHO.MaDotUngHo=CHITIETUNGHO.MaDotUngHo and CHITIETUNGHO.MaHinhThucUH = HINHTHUCUH.MaHinhThucUH
and TenHinhThucUngHo = 'Tien mat'
intersect--giao
(
select DONVIUNGHO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SoDienThoaiLienLac,SoCMNDNguoiDaiDien,SoTaiKhoanNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DONVIUNGHO,DOTUNGHO,CHITIETUNGHO
where DONVIUNGHO.MaDVUH =DOTUNGHO.MaDVUH and DOTUNGHO.MaDotUngHo=CHITIETUNGHO.MaDotUngHo and MaHinhThucUH
not in (select MaHinhThucUH from HINHTHUCUH where TenHinhThucUngHo = 'Quan ao')
)

--Câu 14
select DONVIUNGHO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SoDienThoaiLienLac,SoCMNDNguoiDaiDien,SoTaiKhoanNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DONVIUNGHO,DOTUNGHO
where DONVIUNGHO.MaDVUH = DOTUNGHO.MaDVUH and year(NgayUngHo)=2015
except--ngoại trừ select thứ 2
select DONVIUNGHO.MaDVUH,HoTenNguoiDaiDien,DiaChiNguoiDaiDien,SoDienThoaiLienLac,SoCMNDNguoiDaiDien,SoTaiKhoanNganHang,TenNganHang,ChiNhanhNganHang,TenChuTKNganHang
from DONVIUNGHO,DOTUNGHO
where DONVIUNGHO.MaDVUH = DOTUNGHO.MaDVUH and year(NgayUngHo)=2016

--Câu 15 Hiển thị thông tin của những đơn vị ủng hộ đã thực hiện ít nhất 2 đợt ủng hộ tính từ 30/07/2015 đến hết năm 2015
select * from DONVIUNGHO where MaDVUH in 
(
	select MaDVUH from DOTUNGHO
	where NgayUngHo between '07-31-2015' and '12-31-2015'
	group by MaDVUH
	having count(MaDVUH) >=2
)

--Câu 16Đếm tổng số đợt được nhận ủng hộ của từng hộ dân trong năm 2016 với yêu cầu chỉ thực hiện tính đối với những đợt được nhận ủng hộ có hình thức nhận ủng hộ là 'Tien mat'
select count(HODAN.MaHoDan) from HODAN,DOTNHANUNGHO,CHITIETNHANUNGHO
 where HODAN.MaHoDan = DOTNHANUNGHO.MaHoDan and DOTNHANUNGHO.MaDotNhanUngHo= CHITIETNHANUNGHO.MaDotNhanUngHo and MaHinhThucUH in (
	select MaHinhThucUH from HINHTHUCUH
	where year(NgayNhanUngHo) = 2016 and TenHinhThucUngHo = 'Tien mat'

)

--Câu 17
select NgayUngHo
from DOTUNGHO,DOTNHANUNGHO
where NgayUngHo = NgayNhanUngHo
order by NgayUngHo 

--Câu 18
update CHITIETUNGHO
set DonViTinh = 'NULL' 
where MaHinhThucUH in (
	select MaHinhThucUH from HINHTHUCUH,DOTUNGHO
	where TenHinhThucUngHo = 'Quan ao'and NgayUngHo < '12-30-2015'
)
select * from CHITIETNHANUNGHO

--Câu 19
delete HODAN where MaHoDan not in
(select MaHoDan from DOTNHANUNGHO)

--Câu 20
DELETE CHITIETUNGHO WHERE
MaDotUngHo IN (SELECT MaDotUngHo FROM DOTUNGHO WHERE YEAR(NgayUngHo)<2015)


select*from DONVIUNGHO
select*from DOTNHANUNGHO
select*from DOTUNGHO
Select*from HINHTHUCUH
Select*from CHITIETNHANUNGHO
select*from CHITIETUNGHO
select*from HODAN

