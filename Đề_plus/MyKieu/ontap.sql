use master
go
create database Ontap
use Ontap
go
CREATE TABLE TBLKhoa
(Makhoa char(10)primary key,
 Tenkhoa char(30),
 Dienthoai char(10));
CREATE TABLE TBLGiangVien(
Magv int primary key,
Hotengv char(30),
Luong decimal(5,2),
Makhoa char(10) references TBLKhoa);
CREATE TABLE TBLSinhVien(
Masv int primary key,
Hotensv char(40),
Makhoa char(10)foreign key references TBLKhoa,
Namsinh int,
Quequan char(30));
CREATE TABLE TBLDeTai(
Madt char(10)primary key,
Tendt char(30),
Kinhphi int,
Noithuctap char(30));
CREATE TABLE TBLHuongDan(
Masv int primary key,
Madt char(10)foreign key references TBLDeTai,
Magv int foreign key references TBLGiangVien,
KetQua decimal(5,2));
INSERT INTO TBLKhoa VALUES
('Geo','Dia ly va QLTN',3855413),
('Math','Toan',3855411),
('Bio','Cong nghe Sinh hoc',3855412);
INSERT INTO TBLGiangVien VALUES
(11,'Thanh Binh',700,'Geo'),     
(12,'Thu Huong',500,'Math'),
(13,'Chu Vinh',650,'Geo'),
(14,'Le Thi Ly',500,'Bio'),
(15,'Tran Son',900,'Math');
INSERT INTO TBLSinhVien VALUES
(1,'Le Van Son','Bio',1990,'Nghe An'),
(2,'Nguyen Thi Mai','Geo',1990,'Thanh Hoa'),
(3,'Bui Xuan Duc','Math',1992,'Ha Noi'),
(4,'Nguyen Van Tung','Bio',null,'Ha Tinh'),
(5,'Le Khanh Linh','Bio',1989,'Ha Nam'),
(6,'Tran Khac Trong','Geo',1991,'Thanh Hoa'),
(7,'Le Thi Van','Math',null,'null'),
(8,'Hoang Van Duc','Bio',1992,'Nghe An');
INSERT INTO TBLDeTai VALUES
('Dt01','GIS',100,'Nghe An'),
('Dt02','ARC GIS',500,'Nam Dinh'),
('Dt03','Spatial DB',100, 'Ha Tinh'),
('Dt04','MAP',300,'Quang Binh' );
INSERT INTO TBLHuongDan VALUES
(1,'Dt01',13,8),
(2,'Dt03',14,0),
(3,'Dt03',12,10),
(5,'Dt04',14,7),
(6,'Dt01',13,Null),
(7,'Dt04',11,10),
(8,'Dt03',15,6);
select *from TBLKhoa
SELECT * FROM TBLSinhVien
select *from TBLGiangVien
select *from TBLDeTai
select *from TBLHuongDan
--1Đưa ra thông tin gồm mã số, họ tênvà tên khoa của tất cả các giảng viên
select gv.Magv ,gv.Hotengv,k.Tenkhoa
from TBLGiangVien as gv join TBLKhoa as k
on gv.MaKhoa =k.Makhoa
--2
select gv.Magv ,gv.Hotengv,k.Tenkhoa 
from TBLGiangVien as gv join TBLKhoa as k
on gv.MaKhoa=k.MaKhoa
where k.Tenkhoa = 'Dia ly va QLTN'
--3 Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
Select count (SV.Masv) as Soluong,K.Tenkhoa 
from TBLSinhVien as SV JOIN  TBLKhoa as K ON SV.Makhoa=K.Makhoa
Where K.Tenkhoa = 'Cong nghe Sinh hoc '
group BY  K.Tenkhoa
--4Đưa ra danh sách gồm mã số, họ tênvà tuổi của các sinh viên khoa ‘TOAN’
Select sv.Masv ,sv.Hotensv,sv.Namsinh as Tuoi
from TBLSinhVien as sv join TBLKhoa as k on sv.Makhoa=k.Makhoa
Where k.Tenkhoa = 'TOAN '
--5 Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
select count (gv.Magv) as Soluong,k.Tenkhoa
from TBLGiangVien as gv join TBLKhoa AS k on gv.Makhoa=k.Makhoa
where k.Tenkhoa= 'Cong nghe Sinh hoc'
group by Tenkhoa
--6Cho biết thông tin về sinh viên không tham gia thực tập
SELECT sv.Masv,sv.Hotensv 
from TBLSinhVien AS sv
where not exists(
select Hd.Masv
from TBLHuongDan AS Hd
where sv.Masv=Hd.Masv
)
--7Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
select k.Makhoa ,k.TenKhoa,count (k.Makhoa) as Sogiangvien
from TBLGiangVien AS gv join TBLKhoa as k on gv.Makhoa=k.Makhoa
group by k.Makhoa,k.Tenkhoa
--8 Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
select sv.Hotensv,k.Dienthoai
from TBLKhoa as k join TBLSinhVien as sv on k.Makhoa=sv.Makhoa
where sv.Hotensv like 'Le van son '
--9. Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
SELECT dT.Madt ,dt.Tendt,gv.Hotengv
from TBLGiangVien gv join TBLHuongDan AS HD ON gv.Magv=HD.Magv
JOIN TBLDeTai as dT on dT.Madt=HD.Madt
WHERE gv.Hotengv LIKE 'Tran son'
--10Cho biết tên đề tài không có sinh viên nào thực tập
select dt.Tendt,dt.Madt
from TBLDeTai as dt 
where not exists(
select hd.Madt
from TBLHuongDan AS hd
where hd.Madt=dt.Madt)
--11 Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên
select gv.Magv,gv.Hotengv,k.Tenkhoa
from TBLGiangVien AS gv join TBLKhoa AS k on gv.Makhoa=k.Makhoa
where gv.Magv in (
select hd.Magv
from TBLHuongDan as hd
group by hd.Magv
HAVING COUNT (hd.Magv)>3
)
--12Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
Select dt.Madt ,dt.Kinhphi,dt.Tendt
From TBLDeTai dt
where dt.Kinhphi=(select MAX(dt.Kinhphi ) 
from TBLDeTai dt)
--