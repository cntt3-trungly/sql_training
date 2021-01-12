--08
use master
go
create database Internet
use Internet
go

create table KHACHHANG
(
  MaKH  varchar(10)  not null,
  TenKH nvarchar(50) not null,
  Email nvarchar(50)  not null,
  SoDT     varchar(50)  not null,
  DiaChi   nvarchar(50) not null,
  CONSTRAINT pk_MaKH PRIMARY KEY (MaKH)
)
create table DMSANPHAM
(
  MaDM  varchar(10)  not null,
  TenDanhMuc nvarchar(50) not null,
  MoTa nvarchar(50)  not null,
  CONSTRAINT pk_MaDM PRIMARY KEY (MaDM)
)
create table THANHTOAN
(
  MaTT  varchar(10)  not null,
  PhuongThucTT nvarchar(50) not null,
 
  CONSTRAINT pk_MaTT PRIMARY KEY (MaTT)
)
create table DONHANG
(
  MaDH  varchar(10)  not null,
  MaKH varchar(10) not null,
 MaTT  varchar(10)  not null,
 NgayDat date not null,
  CONSTRAINT pk_MaDH PRIMARY KEY (MaDH),
  foreign key (MaKH) references KHACHHANG (MaKH),
  foreign key (MaTT) references THANHTOAN (MaTT)
)
create table SANPHAM
(
  MaSP  varchar(10)  not null,
   MaDM varchar(10) not null,
 TenSP nvarchar(50) not null,
  GiaTien float not null,
   SoLuongCon int not null,
    XuatXu nvarchar(50) not null,
  CONSTRAINT pk_MaSP PRIMARY KEY (MaSP),
  foreign key (MaDM) references DMSANPHAM (MaDM)
)
create table CHITIETDONHANG
(
  MaDH  varchar(10)  not null,
   MaSP varchar(10) not null,
   SoLuong int not null,
     TongTien float not null,
  CONSTRAINT pk_CTdathang PRIMARY KEY (MaDH, MaSP),
  foreign key (MaDH) references DONHANG (MaDH),
  foreign key (MaSP) references SANPHAM (MaSP),
)
--a1.2
Create trigger Them
on SANPHAM
for insert
as
begin
Declare @MaSP  varchar(10) , 
 @MaDM varchar(10) ,
 @TenSP nvarchar(50),
 @GiaTien float ,
 @SoLuongCon int ,
 @XuatXu nvarchar(50)
  select  @MaSP = MaSP from inserted
 select  @MaDM = MaDM from inserted
 select  @TenSP = TenSP from inserted
 select  @GiaTien = GiaTien from inserted
 select  @SoLuongCon = SoLuongCon from inserted
 select  @XuatXu = XuatXu from inserted

 Select *FROM SANPHAM as sp join DMSANPHAM as dm 
 on sp.MaDM=dm.MaDM
 where GiaTien>0 and SoLuongCon>0
 END
 --test
 


 --b1.3

 create proc Them (
						@MaDH VARCHAR(10),
						@MaKH VARCHAR(10),
						@MaTT VARCHAR(10),
						@NgayDat date	
					   )
as					
begin
	select @NgayDat=NgayDat  from DONHANG AS DH JOIN KHACHHANG as kh on DH.MaKH=kh.MaKH 
	if(@NgayDat<=GETDATE()) 
	begin
		insert into DONHANG values(@MaDH, @MaKH, @MaTT, @NgayDat)
	end
end
go

--b2.2


 create proc Sp (
						@MaDH nvarchar(50),
						@MaSP nvarchar(50),
						@SoLuong int,
						@TongTien float	
					   )
as					
begin
	declare @sl int
	declare @slc int 
	select @sl=SoLuong, @slc=SoLuongCon from CHITIETDONHANG as ct join SANPHAM as sp on ct.MaSP=sp.MaSP
	if(@sl > 0 and @slc>0 ) 
	begin
		update CHITIETDONHANG 
		set MaDH=@MaDH, MaSP=@MaSP, SoLuong=@SoLuong, TongTien=@TongTien
	end;
end;
go
--C1.3
CREATE function LietKe(@MaSP varchar(10))
returns table
as return

select

--c2
CREATE FUNCTION TinhDiemThuong(
@MaKH VARCHAR(10)
)  
RETURNS INT
AS
BEGIN
DECLARE @diemthuong int
IF (SELECT SUM( CT.TongTien)  
FROM DONHANG DH JOIN CHITIETDONHANG CT ON DH.MaDH=CT.MaDH
WHERE DH.MaKH=@MaKH
GROUP BY DH.MaKH ) > 2000000
BEGIN
SELECT @diemthuong =50
END  
ELSE  SELECT @diemthuong =20
RETURN @diemthuong
END 




