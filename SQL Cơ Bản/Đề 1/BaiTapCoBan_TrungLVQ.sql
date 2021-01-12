use BANHANG
go
create table LOAISP(
 MaLoaiSP varchar(20),
 TenLoaiSP nvarchar (30) not null,
  constraint PK_LoaiSP primary key (MaloaiSP)
 )

 create table NHANVIEN(
 MaNV varchar(20),
 HotenNV nvarchar (30) not null,
 GioiTinh nvarchar(10) not null ,
 QueQuan nvarchar(50),
 Tuoi int,
  constraint PK_NhanVien primary key (MaNV)
 )

create table SANPHAM(
 MaSP varchar(20),
 TenSP nvarchar (30) not null,
  MaLoaiSP varchar(20) not null,
  Giaban money ,
  constraint PK_SanPham primary key (MaSP),
  constraint FK_MaLoaiSp foreign key (MaLoaiSP) references LOAISP(MaLoaiSP)
 )

  create table BANHANG(
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
('NV21',N'Trương Thị KHoa',N'Nam',N'Bắc Ninh',31),
('NV18',N'Trương ads',N'Nữ',null,22),
('NV17',N'Trương asddd',N'Nữ',null,32),
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
('SP09',N'Chai nuoc tayo','Type001',23000),
('SP01',N'Bột giặc ô-mô','Type001',16000),
('SP02',N'Bút chữ A','Type002',17000),
('SP03',N'Bàn Acexis','Type002',18000),
('SP04',N'Kem chống mụn','Type003',19000),
('SP05',N'Kem chống ghẻ','Type004',20000),
('SP06',N'Kiếm laze','Type005',21000),
('SP07',N'Chip Intel','Type004',22000),
('SP08',N'Máy tính axuss','Type003',23000),
('SP10',N'Tẩy Trang','Type007',33000)

INSERT INTO BANHANG VALUES 
('NV14','SP03',1),
('NV15','SP04',1),
('NV18','SP05',1),
('NV17','SP06',1),
('NV11','SP01',1),
('NV12','SP01',1),
('NV03','SP08',1),
('NV04','SP08',1),
('NV06','SP02',1),
('NV07','SP03',1),
('NV09','SP06',1),
('NV09','SP02',2),
('NV04','SP01',3),
('NV03','SP05',4),
('NV08','SP04',1),
('NV04','SP06',4),
('NV02','SP04',5),
('NV03','SP03',2),
('NV06','SP01',1)

SELECT * FROM BANHANG
-- Câu 1 : Thêm 1 nhân viên có MãNV là 'NV01', Tên là Nguyễn Chí Phèo, Nam, Quê ở Quảng Trị, 18 tuổi

INSERT INTO NHANVIEN VALUES
('NV01',N'Nguyễn Chí Phèo','Nam','Quảng Trị',18);

--Câu 2 : Xóa những nhân viên nữ quê ở Kon Tum

DELETE FROM NHANVIEN 
WHERE GioiTinh='nữ' and QueQuan='Kon Tum';

select * from NHANVIEN

--Câu 3 : Tăng giá bán lên gấp đôi cho những sản phẩm có mã loại sản phẩm là 'Type001'
SELECT * FROM SANPHAM

UPDATE SANPHAM
SET GiaBan=Giaban*2
WHERE MaLoaiSP='Type001';

--Câu 4 : Hãy liệt kê thông tin toàn bộ nhân viên trong công ty

SELECT * FROM NHANVIEN

--Câu 5 : Hãy liệt kê toàn bộ thông tin của nhân viên từ 23 tuổi trở lên và có quê quán ở Bình Định

SELECT* FROM NHANVIEN WHERE Tuoi>=23 and QueQuan=N'Bình Định'

--Câu 6 : Hãy liệt kê Mã sản phẩm của những sản phẩm đã từng được bán

SELECT sp.MaSP FROM SANPHAM sp JOIN BANHANG bh on sp.MaSP=bh.MaSp; 

--Câu 7 : Hãy liệt kê những nhân viên có họ là Nguyễn

SELECT * FROM NHANVIEN WHERE HotenNV like N'Nguyễn%'

--Câu 8 : Hãy liệt kê những nhân viên có tên là Hoa

SELECT * FROM NHANVIEN WHERE HotenNV like N'% Hoa'

--Câu 9 : Hãy liệt kê những sản phẩm có tên bao gồm 12 ký tự

SELECT * from SANPHAM WHERE LEN(REPLACE(TenSP,' ', ''))=12

--Câu 10 : Hãy liệt kê những sản phẩm thuộc loại 'Mỹ phẩm'

SELECT sp.MaSP,sp.TenSP,sp.MaLoaiSP,sp.Giaban 
FROM SANPHAM sp JOIN LOAISP ls ON sp.MaLoaiSP= ls.MaLoaiSP WHERE ls.TenLoaiSP=N'Mỹ Phẩm';

--Câu 11 : Hãy liệt kê những sản phẩm có giá bán dưới 20.000 hoặc chưa từng được bán lần nào

----cách 1: 
SELECT * FROM SANPHAM 
WHERE MaSP not in ( SELECT sp.MaSP FROM SANPHAM sp JOIN BANHANG bh ON sp.MaSP=bh.MaSp)

----cách 2: 
SELECT * FROM SANPHAM 
EXCEPT
SELECT sp.MaSP,sp.TenSP,sp.MaLoaiSP,sp.Giaban FROM SANPHAM sp JOIN BANHANG bh ON sp.MaSP=bh.MaSp

-- Câu 12: Hãy liệt kê những nhưng viên chưa từng bán được sản phẩm nào và những nhân viên chỉ mới bán được sản phẩm Bột giặt OMO

----cách 1:
SELECT N.*
FROM NHANVIEN N
LEFT JOIN BANHANG B
ON B.MaNV=N.MaNV
WHERE B.MaNV IS NULL
OR B.MaNV IN(
SELECT MaNV
FROM BANHANG B
JOIN SANPHAM S
ON B.MaSP=S.MaSP
EXCEPT
SELECT MaNV
FROM BANHANG B
JOIN SANPHAM S
ON B.MaSP=S.MaSP WHERE S.TeNSP!=N'Bột giặc ô-mô' )

----cách 2

SELECT DISTINCT a. *
FROM NHANVIEN a LEFT JOIN BANHANG b ON a.MaNV = b.MaNV LEFT JOIN SANPHAM c ON b.MaSP=c.MaSP
WHERE b.MaNV IS NULL
OR
(c.TeNSP=N'Bột giặc ô-mô' and( SELECT COUNT(*) FROM BANHANG d WHERE a.MaNV=d.MaNV)=1)

-- Câu 13 Hãy liệt kê mã nhân viên của những nhân viên có quê ở Gia Lai và chưa từng bán được sản phẩm nào
SELECT * FROM NHANVIEN 
WHERE MaNV not in ( SELECT nv.MaNV FROM NHANVIEN nv JOIN BANHANG bh ON nv.MaNV=bh.MaNV) And QueQuan=N'Gia Lai';

--Câu 14 Hãy liệt kê MaSP, TênSP, Mã Loại SP, Giá Bán, Tên Loại SP của tất cả những sản phẩm đã có niêm yết giá bán

SELECT * FROM SANPHAM sp JOIN BANHANG bh ON  bh.MaSp=sp.MaSP WHERE Giaban is not null;


    

--15Hãy liệt kê MãNV, Họ tên NV, Giới Tính, Quê Quán của nhân viên

--và mã sản phẩm, tên sản phẩm, loại sản phẩm, tên loại sản phẩm,

--số lượng đã bán của tất cả các những nhân viên đã từng bán được hàng.

SELECT N.MaNV,N.HoTenNV,N.GioiTinh,N.QueQuan,B.MaSP, S.TeNSP,L.MaLoaiSP,L.TenLoaiSP,B.SoLuongDaBan
FROM NHANVIEN N
JOIN BANHANG B
ON B.MaNV=N.MaNV
JOIN SANPHAM S
ON S.MaSP=B.MaSP
JOIN LOAISP L
ON L.MaLoaiSP=S.MaLoaiSP


--16Hãy liệt kê Mã Loại SP, Tên loại SP của những loại sản phẩm đã từng được bán

SELECT L.MaLoaiSP,L.TenLoaiSP
FROM LOAISP L
JOIN SANPHAM S
ON S.MaLoaiSP=L.MaLoaiSP
JOIN BANHANG B
ON B.MaSP=S.MaSP
GROUP BY L.MaLoaiSP,L.TenLoaiSP


--17Hãy liệt kê tên (họ + tên) của những nhân viên trong công ty
--(nếu có tên trùng nhau thì chỉ hiển thị tên đó 1 lần)

SELECT left(nv.HoTenNV,CHARINDEX(' ', nv.HoTenNV)) AS Họ, right(nv.HoTenNV,(CHARINDEX(' ', REVERSE(nv.HoTenNV)))) AS Tên
--HÀM CHAR INDEX TRẢ VỀ VỊ TRÍ DẤU SPACE TỪ TRÁI SANG PHẢI + HÀM REVERSE ĐẢO CHUỖI TỪ PHẢI SANG TRÁI
FROM NHANVIEN nv
GROUP BY nv.HoTenNV

--18Hãy liệt kê MaNV, TênNV, Quê Quán của tất cả nhân viên,

--nếu bạn nào chưa có quê quán thì mục quê quán sẽ hiển thị là 'Cõi trên xuống'

SELECT nv.MaNV, nv.HoTenNV, COALESCE(nv.QueQuan,N'Cõi trên xuống') as QueQuan
FROM NHANVIEN nv

--19 Hãy liệt kê 5 nhân viên có tuổi đời cao nhất trong công ty

SELECT TOP(5) nv.*
FROM NHANVIEN nv
ORDER BY nv.Tuoi DESC

--20Hãy liệt kê những nhân viên có tuổi đời từ 25 đến 35 tuổi

SELECT nv.*
FROM NHANVIEN nv
WHERE nv.Tuoi BETWEEN 25 AND 35



