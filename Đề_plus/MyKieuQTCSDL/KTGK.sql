use master
go
CREATE DATABASE CAYCANH
use CAYCANH
go
CREATE TABLE KHACHHANG(
   MaKH char(10) NOT NULL,
   HoTenKH varchar(50) NOT NULL,
   DiaChiKH varchar(50) NOT NULL,
   SoDienThoaiKH varchar(20) NOT NULL,
CONSTRAINT pk_MaKH PRIMARY KEY (MaKH)
)
CREATE TABLE HOPDONGCHOTHUE(
   MaHopDong char(10) NOT NULL,
   MaKH char(10) NOT NULL,
   SoTienDuocGiamGia float NOT NULL,
   SoTienDatCoc float NOT NULL,
   TrangThaiHopDong varchar(50),
  
CONSTRAINT pk_MaHopDong PRIMARY KEY (MaHopDong),
 CONSTRAINT fk_MaKH FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
)
CREATE TABLE LOAICAYCANH
(
MaLoaiCC char(10) not null,
MoTaLoaiCC varchar(50) not null,
CONSTRAINT pk_MaLoaiCC PRIMARY KEY (MaLoaiCC)
)
create table CAYCANH(
MaCayCanh char(10) NOT NULL,
Mota nvarchar(50) not null,
MaLoaiCC char(10) not null,
DonGiaChoThue int not null,
CONSTRAINT pk_MaCayCanh PRIMARY KEY (MaCayCanh),
 CONSTRAINT fk_MaLoaiCC FOREIGN KEY (MaLoaiCC) REFERENCES LOAICAYCANH(MaLoaiCC)

)
create TABLE LOAIDICHVU
(
MaLoaiDV char(10) not  null,
MoTaLoaiDV varchar(50) not null,
CONSTRAINT pk_MaLoaiDV PRIMARY KEY (MaLoaiDV)
)
create table CHITIETHOPDONG
(
MaHopDong char(10)  NOT NULL,
MaCayCanh char(10) NOT NULL,
SoLuong int not null,
MaLoaiDV char(10) not  null,
NgayBatDauChoThue date not null,
NgayKetThucChoThue date not null,
CONSTRAINT pk_cthopdong PRIMARY KEY (MaHopDong,MaCayCanh),
CONSTRAINT fk_MaHopDong FOREIGN KEY (MaHopDong) REFERENCES HOPDONGCHOTHUE(MaHopDong),
 CONSTRAINT fk_MaLoaiDV FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV),
 CONSTRAINT fk_MaCayCanh FOREIGN KEY (MaCayCanh) REFERENCES CAYCANH(MaCayCanh)
)
insert KHACHHANG
 values
 ('KH0001','Bui A','Lien Chieu','09012345'),
 ('KH0002','Bui B','Thanh khe','09112345'),
 ('KH0003','Nguyen A','Lien Chieu','09112346'),
  ('KH0004','Nguyen B','Thanh Khe','09012346'),
('KH0005','Bui A','Hai Chau','09012347'),
('KH0006','Nguyen B','Hai Chau','09112347')
insert LOAICAYCANH
VALUES 
('LCC01','Chung o phong khach'),
('LCC02','Chung o cau thang'),
('LCC03','Chung o ngoai san')
insert CAYCANH
VALUES
('CC001','Hoa hong','LCC01','10000'),
('CC002','Mai tu quy','LCC01','20000'),
('CC003','Hoa anh dao','LCC01','60000'),
('CC004','Bonsai','LCC03','100000'),
('CC005','Hong tieu muoi','LCC02','70000')
INSERT HOPDONGCHOTHUE
VALUES 
('HD0001','KH0002','0','1000000','Da ket thuc'),
('HD0002','KH0002','0','0',''),
('HD0003','KH0001','0','0','Da ket thuc'),
('HD0004','KH0005','0','0','Dang cho thue'),
('HD0005','KH0004','0','0','Dang cho thue'),
('HD0006','KH0004','0','0','Chua bat dau'),
('HD0007','KH0002','0','0','Da ket thuc'),
('HD0008','KH0004','0','0','')
insert LOAIDICHVU
VALUES 
('L01','Chung Tet'),
('L02','Chung nha moi')
insert CHITIETHOPDONG
VALUES
('HD0001','CC003','100','L01','2016/7/3','2016/7/5'),
('HD0002','CC001','150','L01','2015/10/11','2015/10/22'),
('HD0003','CC004','20','L01','2017/12/23','2017/12/30'),
('HD0004','CC002','5','L01','2014/1/1','2014/1/10'),
('HD0005','CC005','10','L01','2016/10/16','2016/10/18'),
('HD0006','CC001','300','L01','2017/12/11','2017/12/22'),
('HD0007','CC004','5','L01','2016/2/1','2016/2/10'),
('HD0007','CC001','15','L01','2016/2/10','2016/2/12')
--Cau3 Liet ke nhưng cay canh co don gia cho thue nho hon 50000
select * from CAYCANH
where DonGiaChoThue <50000
--cau4KH có địa chỉ Lien chieu và sdt bắt đầu 090, KH có địa chi Thanh Khe có sdt bđ 091
select * from KHACHHANG
WHERE (DiaChiKH='Lien Chieu' and SoDienThoaiKH like '090%' ) or
(DiaChiKH='Thanh Khe' and SoDienThoaiKH like '091%' )
--cau5 liet ke nhung khach hang co ho trong ho ten la bui
select * from KHACHHANG
where HoTenKH like 'Bui%'
--cau6 Liet ke thong tin cua toan bo cac cay canh yeu cau sap xep theo mo ta 
--va giam dan theo don gia
select * from CAYCANH
Order by Mota,DonGiaChoThue DESC
--cau7 liet ke hop dong cho thue co trang thai la da ket thuc hoac chua xac dinh
SELECT * FROM HOPDONGCHOTHUE
WHERE (TrangThaiHopDong='Da ket thuc' or TrangThaiHopDong ='')
--cau8 liet ke ho ten cua toan bo khach hang va yeu cau moi ho ten chi duoc liet ke mot lan duy nhat
select distinct kh.HoTenKH 
from KHACHHANG as kh
--cau9 liet ke MaHopDong,MaCayCanh,MaKH,SoLuong,TrangThaiHopDong cua tat ca
-- cac hop dongco trag thai dang cho thue
select ct.MaHopDong,ct.MaCayCanh,hd.MaKH,ct.SoLuong,hd.TrangThaiHopDong
from CHITIETHOPDONG as ct ,HOPDONGCHOTHUE as hd
WHERE ct.MaHopDong=hd.MaHopDong and hd.TrangThaiHopDong='Dang cho thue'
--CAU10 liet ke.... cua tat ca cac hop dong voi yeu cau nhung hoat dong nao 
--chua co mot chi tiet hop dong nao thi cung phai liet ke nhung thong tin do ra
select ct.MaHopDong,ct.MaCayCanh,hd.MaKH,ct.SoLuong,hd.TrangThaiHopDong
from HOPDONGCHOTHUE as hd left join CHITIETHOPDONG as ct 
on hd.MaHopDong=ct.MaHopDong
--CAU11 liet ke thong tin cua khach hang co dia chi hai chau da tung thue cay canh
-- thuoc loai thue cay canh co mo ta la chung o phong khach 
--hoac co khach hang da tung thue cay canh voi thue gian bat dau thue 2017/11/12
select *
from KHACHHANG
where DiaChiKH like 'Hai Chau' and MaKH in(
	select hd.MaKH
	from HOPDONGCHOTHUE as hd, CHITIETHOPDONG as ct,CAYCANH as cc, LOAICAYCANH as l
	where hd.MaHopDong=ct.MaHopDong and ct.MaCayCanh=cc.MaCayCanh
	and cc.MaLoaiCC=l.MaLoaiCC and l.MoTaLoaiCC like 'Chung o phong khach'
	)
	OR MaKH in(
	select hd.MaKH
	from HOPDONGCHOTHUE as hd, CHITIETHOPDONG as ct
	where hd.MaHopDong=ct.MaHopDong
	and ct.NgayBatDauChoThue >= '2017-12-11'
	)
--c2
select kh.MaKH, HoTenKH, DiaChiKH, SoDienThoaiKH
from KHACHHANG kh join HOPDONGCHOTHUE hd on kh.MaKH = hd.MaKH
	join CHITIETHOPDONG cthd on hd.MaHopDong = cthd.MaHopDong
	join CAYCANH cc on cc.MaCayCanh = cthd.MaCayCanh
	join LOAICAYCANH lcc on lcc.MaLoaiCC = cc.MaLoaiCC
where (DiaChiKH like 'Hai Chau' and MoTaLoaiCC like 'Chung o phong khach')
	or ( NgayBatDauChoThue >= '2017/11/12' )
--Cau 12 liet ke thong tin cua khach hang chua tung thue cay canh mot lan nao ca
select kh.MaKH, HoTenKH, DiaChiKH, SoDienThoaiKH
from KHACHHANG as kh ,HOPDONGCHOTHUE as hd
except
select kh.MaKH, HoTenKH, DiaChiKH, SoDienThoaiKH
from KHACHHANG as kh join HOPDONGCHOTHUE as hd on kh.MaKH=hd.MaKH
--c2
select *
from KHACHHANG
where MaKH not in (
	select kh.MaKH
	from HOPDONGCHOTHUE as hd, KHACHHANG as kh
	where hd.MaKH=kh.MaKH
	)
--Cau 13 liet ke thong tin cua câc khach hang da tung thue laoi cay canh 
--duoc mo ta la chung o phong khach va 
-- da tung thue cay canh vao thang 12/2017
select *
from KHACHHANG
where MaKH in(
	select hd.MaKH
	from HOPDONGCHOTHUE as hd, CHITIETHOPDONG as ct,CAYCANH as cc, LOAICAYCANH as l
	where hd.MaHopDong=ct.MaHopDong and ct.MaCayCanh=cc.MaCayCanh
	and cc.MaLoaiCC=l.MaLoaiCC and l.MoTaLoaiCC like 'Chung o phong khach' and month(ct.NgayBatDauChoThue) like '12' 
	and year(ct.NgayBatDauChoThue) like '2017'
	)
--c2
select kh.MaKH, HoTenKH, DiaChiKH, SoDienThoaiKH
from KHACHHANG kh join HOPDONGCHOTHUE hd on kh.MaKH = hd.MaKH
	join CHITIETHOPDONG cthd on hd.MaHopDong = cthd.MaHopDong
	join CAYCANH cc on cc.MaCayCanh = cthd.MaCayCanh
	join LOAICAYCANH lcc on lcc.MaLoaiCC = cc.MaLoaiCC
where ( MoTaLoaiCC like 'Chung o phong khach' and NgayBatDauChoThue between '2017/12/1' and '2017/12/31' )
--cau14 liet ke thong tin cua nhung khach hang da tung thue cay canh vao nam 2016 va chua tung thue vao nam 2017
select *
from KHACHHANG
where MaKH  in (select hd.MaKH
               from HOPDONGCHOTHUE as hd,CHITIETHOPDONG as ct
			   where  hd.MaHopDong=ct.MaHopDong and  YEAR(ct.NgayBatDauChoThue) like 2016
			   )
AND MaKH not in (
			select hd.MaKH
            from HOPDONGCHOTHUE as hd,CHITIETHOPDONG as ct
			where  hd.MaHopDong=ct.MaHopDong and  YEAR(ct.NgayBatDauChoThue) like 2017
			)
--Cau15 hie thi ... cua nhung cay canh tung duoc thue voi so luong lon hon 10 trong mot hop dong bat ki nao do
--kq hien thi can duoc xoa bot trung lap
select DISTINCT c.MaCayCanh, c.MaLoaiCC
from CAYCANH as c,CHITIETHOPDONG as ct
where c.MaCayCanh=ct.MaCayCanh and ct.SoLuong > '10'
--c16dem tong so khach hang da tung thue cay canh trong nam 2016 
--voi yeu cau chi thuc hien voi nhung k.hang da tung thue it nhat 2 lan va0 nam 2016
select count(MaKH) from KHACHHANG where MaKH in  (
	select hd.MaKH from HOPDONGCHOTHUE hd join CHITIETHOPDONG ct on hd.MaHopDong = ct.MaHopDong 
	where year(ct.NgayBatDauChoThue)='2016'
	group by MaKH having count(MaKH) >=2
)
--Cau 17 liet ke nhung khach hang chi thue mot lan duy nhat va chi thue mot nhom cay cnah trong nam 2017 .
--kq duoc sap xep giam dan theo makh
select kh.MaKH, HoTenKH, DiaChiKH, SoDienThoaiKH,MaCayCanh
from KHACHHANG kh join HOPDONGCHOTHUE hd on kh.MaKH = hd.MaKH
join CHITIETHOPDONG cthd on hd.MaHopDong = cthd.MaHopDong
where year(NgayBatDauChoThue)= '2017'
group by kh.MaKH, HoTenKH, DiaChiKH, SoDienThoaiKH, MaCayCanh
having count(MaCayCanh) =1
order by MaKH desc
--cau 18:
update HOPDONGCHOTHUE
set TrangThaiHopDong = 'Bi huy'
where TrangThaiHopDong like 'Chua bat dau' and SoTienDatCoc = '0'

--cau 19: cap  nhat nagykthuc trong bang cthd tnah null cho nhung cay canh da tung duoc thue tu 2 lan tro len
update CHITIETHOPDONG
set NgayKetThucChoThue = ''
where MaCayCanh in (select MaCayCanh
                    from CHITIETHOPDONG
					group by MaCayCanh
					having count(*)>=2)
--cau20:xoa nhung dich vu chua tung duoc su dung trong bat cu  1 hop dong nao
delete from LOAIDICHVU
where MaLoaiDV not in (
	select ct.MaLoaiDV 
	from CHITIETHOPDONG as ct,HOPDONGCHOTHUE as hd
	where ct.MaHopDong = hd.MaHopDong)

