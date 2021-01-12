CREATE DATABASE SQLCOBAN2
use SQLCOBAN2
go

CREATE TABLE LOAISP(
 MaLoaiSP varchar(20),
 TenLoaiSP nvarchar (30) not null,
  constraint PK_LoaiSP primary key (MaloaiSP)
 )

 CREATE TABLE NHANVIEN(
 MaNV varchar(20),
 HotenNV nvarchar (30) not null,
 GioiTinh nvarchar(10) not null ,
 QueQuan nvarchar(50),
 Tuoi int,
  constraint PK_NhanVien primary key (MaNV)
 )

CREATE TABLE SANPHAM(
 MaSP varchar (20),
 TenSP nvarchar (30) not null,
  MaLoaiSP varchar(20) not null,
  Giaban money ,
   SoLuong int ,  
  constraint PK_SanPham primary key (MaSP),
  constraint FK_MaLoaiSp foreign key (MaLoaiSP) references LOAISP(MaLoaiSP)
 )

  CREATE TABLE BANHANG(
 MaNV varchar(20),
 MaSp varchar (20) ,
 SoLuongDaBan tinyint ,
  constraint PK_BanHang primary key (MaNV,MaSp),
  constraint FK_MaNV foreign key (MaNV) references NHANVIEN(MaNV),
  constraint FK_MaSp foreign key (MaSp) references SANPHAM(MaSP)
 )


INSERT INTO LOAISP VALUES
('Type001',N'Bột giặc'),
('Type002',N'Ti vi'),
('Type003',N'Ghế'),
('Type004',N'Bàn'),
('Type005',N'Đồ dùng học tập'),
('Type006',N'Chip'),
('Type007',N'Mỹ phẩm')

INSERT INTO NHANVIEN VALUES
('NV15',N'Trương Thị Quý',N'Nữ',N'Gia Lai',22),
('NV14',N'Trương Thị Hoa',N'Nữ',N'Bắc Ninh',32),
('NV13',N'Hoàng Thị Cầu',N'Nữ',N'Kon Tum',26),
('NV02',N'Hoàng Minh Trí','Nam',N'Quảng Nam',12),
('NV03',N'Phan Đăng Lưu','Nam',N'Quảng Ngãi',15),
('NV04',N'Nguyễn Thị Tấm',N'Nữ',N'Quảng Nam',25),
('NV19',N'Lý Thế Dân','Nam',N'Bình Định',24),
('NV06',N'Nguyễn Thị Nhật',N'Nữ',N'Phú Yên',12),
('NV07',N'Hoàng Thị Lan',N'Nữ',N'Huế',43),
('NV08',N'Nguyễn Văn Thông','Nam',N'Gia Lai',24),
('NV09',N'Trần Nam','Nam',N'Đà Nẵng',23),
('NV10',N'Lê lợi','Nam',N'Thanh Hóa',43),
('NV11',N'Lý Văn Quang Trung','Nam',N'Quảng Ngãi',22),
('NV12',N'Nguyễn Thị Định',N'Nữ',N'Bình Định',24)

INSERT INTO SANPHAM VALUES
('SP09',N'Chai nuoc tayo','Type001',23000,3),
('SP01',N'Bột giặc ô-mô','Type001',16000,42),
('SP02',N'Bút chữ A','Type002',17000,21),
('SP03',N'Bàn Acexis','Type002',18000,42),
('SP04',N'Kem chống mụn','Type003',19000,34),
('SP05',N'Kem chống ghẻ','Type004',20000,26),
('SP06',N'Kiếm laze','Type005',21000,46),
('SP07',N'Chip Intel','Type004',22000,14),
('SP08',N'Máy tính axuss','Type003',23000,24),
('SP10',N'Tẩy Trang','Type007',33000,32)

INSERT INTO BANHANG VALUES
('NV09','SP02',2),
('NV04','SP01',3),
('NV03','SP05',4),
('NV08','SP04',1),
('NV04','SP06',4),
('NV02','SP04',5),
('NV03','SP03',2),
('NV06','SP04',5),
('NV06','SP05',3),
('NV06','SP06',4)

-------------------------------------------  Phần 2 -------------------------------------------



-- Câu 1 Liệt kê mã loại sản phẩm và số lượng sản phẩm của từng loại sản phẩm

SELECT MaLoaiSP, sum(SoLuong) TongSoLuong FROM SANPHAM GROUP BY MaLoaiSP

-- Câu 2 Liệt kê mã nhân viên, họ tên nhân viên và mã sản phẩm của những sản phẩm mà nhân viên đó đã bán

SELECT nv.MaNV,nv.HotenNV,bh.MaSp FROM NHANVIEN nv
JOIN BANHANG bh ON nv.MaNV=bh.MaNV

-- Câu 3 Liệt kê mã nhân viên, họ tên nhân viên và mã sản phẩm của những sản phẩm mà nhân viên đó đã bán
-- (nếu nhân viên nào chưa bán được sản phầm nào thì vẫn liệt kê nhân viên đó ra)

SELECT nv.MaNV,nv.HotenNV,STRING_AGG(bh.MaSp, ',') as listMaSp FROM NHANVIEN nv
LEFT JOIN BANHANG bh ON nv.MaNV=bh.MaNV
GROUP BY nv.MaNV,nv.HotenNV

-- Câu 4 : Liệt kê mã sản phẩm, tên sản phẩm, mã loại sản phẩm, tên loại sản phẩm của tất cả các sản phẩm hiện có
SELECT sp.MaSP,sp.TenSP,lsp.MaLoaiSP,lsp.TenLoaiSP FROM SANPHAM sp JOIN LOAISP lsp on sp.MaLoaiSP=lsp.MaLoaiSP

-- Cau 5 : Liệt kê những nhân viên đã từng bán được ít nhất 10 sản phẩm 

SELECT nv.MaNV,nv.HotenNV,nv.GioiTinh,nv.QueQuan,nv.Tuoi 
FROM NHANVIEN nv JOIN BANHANG bh ON nv.MaNV=bh.MaNV 
group by nv.MaNV,nv.HotenNV,nv.GioiTinh,nv.QueQuan,nv.Tuoi  having sum(bh.SoLuongDaBan) >=10 


