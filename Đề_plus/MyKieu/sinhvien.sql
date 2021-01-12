use master
go

CREATE DATABASE SinhVien

use SinhVien
go
CREATE TABLE DON_VI_UNG_HO(
	MaDVUH char(10) NOT NULL,
	HoTenNguoiDaiDien varchar(50) NOT NULL,
	DiaChiNguoiDaiDien varchar(50) NOT NULL,
	SoDienThoaiLienLac varchar(20) NOT NULL,
	SoCMNDNguoiDaiDien varchar(20) NOT NULL,
	SoTaiKhoanNganHang varchar(20) NOT NULL,
	TenNganHang varchar(50) NOT NULL,
	ChiNhanhNganHang varchar(50) NOT NULL,
	TenChuTKNganHang varchar(50) NOT NULL,
	CONSTRAINT pk_MaDVUH PRIMARY KEY (MaDVUH) 
)
CREATE TABLE DOT_UNG_HO(
	MaDUH char(10) NOT NULL,
	MaDVUH char(10) NOT NULL,
	NgayUngHo date NOT NULL,
	CONSTRAINT pk_MaDUH PRIMARY KEY (MaDUH) ,
	CONSTRAINT fk_MaDVUH Foreign Key (MaDVUH) REFERENCES DON_VI_UNG_HO(MaDVUH)
)
CREATE TABLE Hinh_Thuc_UH(
	MaHinhThucUH char(10) NOT NULL,
	TenHinhThucUngHo char(10) NOT NULL,
	CONSTRAINT pk_MaHinhThucUH PRIMARY KEY (MaHinhThucUH)
)
CREATE TABLE Chi_Tiet_UNG_HO(
   MaDUH char(10) NOT NULL,
	MaHinhThucUH char(10) NOT NULL,
	CONSTRAINT pk_MaDUH PRIMARY KEY (MaDUH) 
)
