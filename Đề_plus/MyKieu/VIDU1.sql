use master
go
CREATE DATABASE VIDU1
use VIDU1
go
CREATE TABLE PHONGBAN(
   MaPhongBan char(10) NOT NULL,
   TenPB nvarchar(50) NOT NULL,
   DienThoai varchar(20) NOT NULL,
   DiaChi varchar(50) NOT NULL,
CONSTRAINT pk_MaPhongBan PRIMARY KEY (MaPhongBan)
)
CREATE TABLE NHANVIEN(
   MaNV char(20) NOT NULL,
   Hoten nvarchar(50) NOT NULL,
   NgaySinh varchar(20) NOT NULL,
   QueQuan varchar(50) NOT NULL,
   MaPhongBan char(10) NOT NULL
CONSTRAINT pk_MaNV PRIMARY KEY (MaNV),
CONSTRAINT fk_MaPhongBan Foreign Key (MaPhongBan) REFERENCES PHONGBAN(MaPhongBan)
)
drop TABLE PHONGBAN
drop table NHANVIEN
DROP DATABASE VIDU2
insert PHONGBAN
VALUES
('P1',N'PHÒNG 1','DT 1','DC 1'),
('P2',N'PHÒNG 2','DT 2','DC 2'),
('P3',N'PHÒNG 3','DT 3','DC 3')
SELECT *FROM PHONGBAN
insert NHANVIEN
VALUES
('N1',N'Nhân Viên 1','NS1','Q1','P1'),
('N2',N'Nhân Viên 2','NS1','Q1','P1'),
('N3',N'Nhân Viên 3','NS3','Q1','P2'),
('N4',N'Nhân Viên 4','NS4','Q2','P1'),
('N5',N'Nhân Viên 5','NS5','Q1','P2'),
('N6',N'Nhân Viên 6','NS6','Q1','P1')
SELECT*FROM NHANVIEN
--VD1. Đưaradanhsáchtấtcảnhânviênlàmviệcở phòngban P1
SELECT *
From NHANVIEN
WHERE MaPhongBan LIKE 'P1'
--VD2. Đưaradanhsáchtấtcảnhânviên, sắpxếpkếtquảtăngdầntheoMaPBvàQueQuan
SELECT *FROM NHANVIEN
ORDER BY MaPhongBan,QueQuan
--VD2b. ĐưaradanhsáchnhânviêncóquêquánQ1, sắpxếpkếtquảgiảmdầntheoMaPB vàtăngdầntheohọtên 
SELECT MANV,HoTen,NgaySinh,MaPhongBan
from NHANVIEN
WHERE QueQuan like 'Q1'
ORDER BY MaPhongBan desc,HoTen
--vd4 Đếm số nhân viên làm việc trong mỗi phòng ban theo quê quán 
SELECT MaPhongBan,QueQuan,count(MaNV) as SoNV
FROM NHANVIEN 
GROUP BY MaPhongBan,QueQuan
 --vd5 Đếm số nhân viên có quê quán Q1 làm việc trong mỗi phòng ban 
 SELECT MaPhongBan,count(MaNV) AS SoNV
 FROM NHANVIEN
 WHERE QueQuan like'Q1'
 GROUP BY MaPhongBan
 --VD6. Đếmsốnhânviêntrongmỗiphòngban. Cóđưarathôngtin phòngban.
 --C1
select NHANVIEN.MaPhongBan,TenPB,DienThoai,DiaChi,count(MaNV) AS SoNV
FROM PHONGBAN JOIN NHANVIEN ON NHANVIEN.MaPhongBan=PHONGBAN.MaPhongBan
GROUP BY NHANVIEN.MaPhongBan,TenPB,DienThoai,DiaChi
--C2
SELECT COUNT(NHANVIEN.MaNV)AS sONV,NHANVIEN.MaPhongBan,pb.TenPB,pb.DienThoai,pb.DiaChi
from PHONGBAN AS pb,NHANVIEN
WHERE NHANVIEN.MaPhongBan=pb.MaPhongBan
group by NHANVIEN.MaPhongBan,pb.TenPB,pb.DienThoai,pb.DiaChi

--vd7 Đưaradanhsáchcácphòngban cónhiềuhơn3 nhânviên 
select MaPhongBan,COUNT(MaNV) as SoNV
from NHANVIEN
GROUP BY MaPhongBan
having (count (MaNV)>3)
--VD8 Đưaradanhsáchcácphòngban cónhiềuhơn2 nhânviêncóquêquánQ1 làmviệc 
SELECT MaPhongBan,count (MaNV) AS SoNV
FROM NHANVIEN
WHERE QueQuan like'Q1' 
group by MaPhongBan
having (count (MaNV)>2)
