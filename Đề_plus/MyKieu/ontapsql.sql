use master
go
create database Ontapsql
use Ontapsql
go



Create table NhanVien
(
   MaNV char(20) not null,
   HoTen nvarchar(50) not null,
   NgaySinh date not null,
   QueQuan nvarchar(50) not null,
   BacLuong int not null,
   MaPB CHAR(20) NOT NULL,
   Constraint pk_MaNV Primary key (MaNV)
)

Create table Luong
(
MaNV char(20) not null,
ThangNam NVARCHAR not null,
SoTien float not null,
Constraint pk_ThangNam Primary Key (ThangNam),

)

INSERT INTO NhanVien VALUES('NV1', N'Nguyễn Văn A','1999-01-02', N'Đà Nẵng', 3, 'PB1') 
select *from NhanVien