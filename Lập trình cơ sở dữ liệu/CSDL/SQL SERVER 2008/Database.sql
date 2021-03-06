USE [master]
GO
/****** Object:  Database [DBQLCONGVAN]    Xem thêm:    www.manguonvip.com ******/
CREATE DATABASE [DBQLCONGVAN]
GO

USE [DBQLCONGVAN]
GO
/****** Object:  StoredProcedure [dbo].[BaoCao_CongVanDen_CQ]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BaoCao_CongVanDen_CQ]
	@CQ nvarchar(50)
AS
BEGIN
	SELECT soden,socv,convert(char(10),ngaycv,103) as ngayki,convert(char(10),ngaynhan,103) as ngaynhan
	from congvanden a,coquan b
	where a.macq=b.macq and b.tencq like @cq
END

GO
/****** Object:  StoredProcedure [dbo].[BaoCao_CongVanDen_Thang]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BaoCao_CongVanDen_Thang]
	@thang int
AS
BEGIN
	SELECT soden,socv,convert(char(10),ngaycv,103) as ngayki,convert(char(10),ngaynhan,103) as ngaynhan,b.tencq
	from congvanden a,coquan b
	where a.macq=b.macq and @thang = datepart(m,a.ngaynhan)
END
GO
/****** Object:  StoredProcedure [dbo].[BaoCao_CongVanDi_Thang]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BaoCao_CongVanDi_Thang]
	@thang int
AS
BEGIN
	
	SELECT sodi,socv,convert(char(10),ngayki,103) as ngayki
	from congvandi a
	where @thang = datepart(month,a.ngayki)
END

GO
/****** Object:  StoredProcedure [dbo].[CapNhatTinhTrangCongVan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CapNhatTinhTrangCongVan] 
	@Soden int,
	@TT int

AS
BEGIN
if exists (Select * from Xuly where soden=@soden)
	begin	
		update Xuly
		set Matientrinh=@TT
		where Soden=@Soden
	end
	else
		Select errcode=1
	

END

GO
/****** Object:  StoredProcedure [dbo].[ChinhSuaCongVanDen]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChinhSuaCongVanDen]
	@Soden int,
	@SoCV nvarchar(20),
	@MaCQ int,
	@NgayCV datetime,
	@Ngaynhan datetime,
	@LoaiCV int,
	@Trichyeunoidung nvarchar(50),
	@file_path varchar(50)
AS
BEGIN
if exists (Select * from Congvanden where soden=@soden)
	begin	
		update Congvanden
		set SoCV=@SoCV,NgayCV=@NgayCV,LoaiCV=@LoaiCV,Ngaynhan=@Ngaynhan,MaCQ=@MaCQ,Trichyeunoidung=@Trichyeunoidung,file_path=@file_path
		where Soden=@Soden
	end
	else
		Select errcode=1
	

END

GO
/****** Object:  StoredProcedure [dbo].[ChinhSuaCongVanDi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChinhSuaCongVanDi]
	@Sodi int,
	@SoCV nvarchar(20),
	@LoaiCV int,
	@NgayCV datetime,
	@Trichyeunoidung nvarchar(50),
	@file_path varchar(50)
AS
BEGIN
if exists (Select * from Congvandi where sodi=@sodi)
	begin	
		update Congvandi
		set SoCV=@SoCV,LoaiCV=@LoaiCV,Ngayki=@NgayCV,Trichyeunoidung=@Trichyeunoidung,file_path=@file_path
		where Sodi=@Sodi
	end
	else
		Select errcode=1
	

END

GO
/****** Object:  StoredProcedure [dbo].[DoiPass]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DoiPass]
	@id int,
	@passcu varchar(50),
	@passmoi varchar(50)
AS
BEGIN
	if exists(select * from taikhoan where  id=@id and Passwd=@passcu)
	begin
		update taikhoan set Passwd=@passcu where id=@id
		select errcode=0,errmsg='Doi pass word thanh cong'
	end
	else 
	begin
		
		select errcode=1,errmsg='Password cu khong dung'
	end
END

GO
/****** Object:  StoredProcedure [dbo].[KiemTraDangNhap]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KiemTraDangNhap] 
	-- Add the parameters for the stored procedure here
	@username varchar(30),
	@userpass varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if exists (Select * from Taikhoan where Username like @username)
	begin
		if exists (Select * from Taikhoan where Username = @username and pwdcompare(@userpass,Passwd)=0)
		begin
--			//quyen cua sinh vien la 4
			Select ID,Username,errcode=0,MaNV,quyen from Taikhoan where Username like @username
		end
		
	end
	else
			Select errcode=1
END

GO
/****** Object:  StoredProcedure [dbo].[LayCongVanDen]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayCongVanDen] 
AS
BEGIN
	Select Soden,SoCV,c.TenLoaiCV,Convert(char(10),NgayCV,103) as NgayCV,Convert(char(10),Ngaynhan,103) as NgayNhan,TenCQ,Trichyeunoidung,(case Phanphoi when 'false' then N'Chưa chuyển' else N'Đã chuyển' end) as Trangthai,file_path
	from Congvanden a,Coquan b,LoaiCongVan c
	where a.MaCQ=b.MaCQ and c.Maloaicv=a.LoaiCV
END


GO
/****** Object:  StoredProcedure [dbo].[LayCongVanDen_by]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayCongVanDen_by] 
 @MaNV varchar(10)
AS
BEGIN
	Select Soden,SoCV,c.TenLoaiCV,Convert(char(10),NgayCV,103) as NgayCV,Convert(char(10),Ngaynhan,103) as NgayNhan,TenCQ,Trichyeunoidung,(case Phanphoi when 'false' then N'Chưa chuyển' else N'Đã chuyển' end) as Trangthai,file_path
	from Congvanden a,Coquan b,LoaiCongVan c
	where a.MaCQ=b.MaCQ and c.Maloaicv=a.LoaiCV and a.NguoiLuu=@MaNV
end

GO
/****** Object:  StoredProcedure [dbo].[LayCongVanDi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayCongVanDi]

AS
BEGIN
	Select Sodi,SoCV,b.TenLoaiCV,Convert(char(10),Ngayki,103) as NgayKi,Trichyeunoidung,file_path
	from Congvandi a,LoaiCongVan b
	where a.LoaiCV=b.MaloaiCV
END

GO
/****** Object:  StoredProcedure [dbo].[LayCongVanDi_by]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayCongVanDi_by] 

	@MaNV varchar(10)
AS
BEGIN
	Select Sodi,SoCV,TenloaiCV,Convert(char(10),Ngayki,103) as NgayCV,Trichyeunoidung,file_path
	from Congvandi a,LoaiCongVan b
	where a.NguoiLuu=@MaNV and a.LoaiCV=b.MaloaiCV
END

GO
/****** Object:  StoredProcedure [dbo].[LayCV_ChuaPhanPhoi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayCV_ChuaPhanPhoi]
	@Manv varchar(10)
AS
BEGIN
	
	SELECT distinct a.Soden,SoCV,TenLoaiCV,Convert(char(10),NgayCV,103) as NgayCV,Convert(char(10),Ngaynhan,103) as NgayNhan,TenCQ,Trichyeunoidung
	from Congvanden a,PhanphoiCV b,Coquan c,LoaiCongVan d
	where @Manv=a.NguoiLuu and a.LoaiCV=d.MaloaiCV and a.MaCQ=c.MaCQ and a.Soden not in(select Soden from PhanphoiCV)
	
END

GO
/****** Object:  StoredProcedure [dbo].[LayCV_DaPhanPhoi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayCV_DaPhanPhoi]
	@Manv varchar(10)
AS
BEGIN
	
	SELECT distinct a.Soden,SoCV,TenloaiCV,Convert(char(10),NgayCV,103) as NgayCV,Convert(char(10),Ngaynhan,103) as NgayNhan,TenCQ,Trichyeunoidung
	from Congvanden a,PhanphoiCV b,Coquan c,LoaiCongVan d
	where @Manv=a.NguoiLuu and a.LoaiCV=d.MaloaiCV and a.MaCQ=c.MaCQ and a.Soden in(select Soden from PhanphoiCV)
END

GO
/****** Object:  StoredProcedure [dbo].[LayCV_DuocDoc]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayCV_DuocDoc] 
	@ID nvarchar(10)
AS
BEGIN
	SELECT a.Soden,SoCV,TenLoaiCV,Convert(char(10),NgayCV,103) as NgayCV,Convert(char(10),Ngaynhan,103) as NgayNhan,dbo.LoaiCV(Nguoixuly) as ThaoTac,file_path
	from Congvanden a,PhanphoiCV b,LoaiCongVan d
	where a.Soden=b.Soden and a.LoaiCV=d.MaloaiCV and charindex(@ID,Nguoidoc) <> 0
END

GO
/****** Object:  StoredProcedure [dbo].[LayCV_DuocXuLy]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayCV_DuocXuLy] 
	@ID nvarchar(10)
AS
BEGIN
	
	SELECT a.Soden,a.SoCV,TenloaiCV,Ngaynhan,Hanxuly,Noidung as tinhtrang,file_path
	from Congvanden a,PhanphoiCV b,Xuly c,Tientrinhxuly d,LoaiCongVan e
	where a.Soden=b.Soden and a.LoaiCV=e.MaloaiCV and @ID=Nguoixuly and a.Soden=c.Soden and c.Matientrinh=d.Matientrinh
	
END

GO
/****** Object:  StoredProcedure [dbo].[LayDanhSachCoQUan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayDanhSachCoQUan] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	Select *
	from Coquan
END

GO
/****** Object:  StoredProcedure [dbo].[LayDanhSachNhanVien]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDanhSachNhanVien]
	
AS
BEGIN
	select *
	from Nhanvien
END

GO
/****** Object:  StoredProcedure [dbo].[LayLoaiCongVan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayLoaiCongVan]
	
AS
BEGIN
	
	SELECT *
	from LoaiCongVan
END

GO
/****** Object:  StoredProcedure [dbo].[LayThongTinNhanVien]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayThongTinNhanVien]
	@ID int
AS
BEGIN
	Select TenNV,Chucvu,Convert(char(10),Ngaysinh,103) as NS,Convert(char(10),Ngaybatdaulam,103) as NBDL
	from Nhanvien a,Taikhoan b
	where a.MaNV=b.Manv and ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[LayTinhTrang]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LayTinhTrang]

AS
BEGIN
	
	SELECT * 
	from tientrinhxuly
END

GO
/****** Object:  StoredProcedure [dbo].[suanguoidung]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suanguoidung]
@id int,
@quyen int
as
begin
	update taikhoan set Quyen=@quyen  where ID=@id
	select ErrCode=1,ErrMsg=N'cap nhat nguoi dung thanh cong'	
end

GO
/****** Object:  StoredProcedure [dbo].[Suataikhoan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Suataikhoan]
	@ID int,
	@Quyen int
AS
BEGIN
	if exists(select * from taikhoan where  ID=@ID)
	begin
		update Taikhoan set quyen=@Quyen where ID=@ID
	end
	else 
	begin
		
		select errcode=1,errmsg='Khong co TK nay'
	end
END

GO
/****** Object:  StoredProcedure [dbo].[ThemCongVanDen]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemCongVanDen] 
	@SoCV nvarchar(20),
	@NgayCV datetime,
	@LoaiCV int,
	@Ngaynhan datetime,
	@MaCQ int,
	@Trichyeunoidung nvarchar(50),
	@file_path varchar(50),
	@NguoiLuu int

AS
BEGIN
	insert into Congvanden
	values (@SoCV,@LoaiCV,@NgayCV,@NguoiLuu,@Ngaynhan,@MaCQ,@Trichyeunoidung,'False',@file_path)
	select errcode=0
END

GO
/****** Object:  StoredProcedure [dbo].[ThemCongVanDi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemCongVanDi] 
	@SoCV nvarchar(20),
	@LoaiCV int,
	@NgayCV datetime,
	@NguoiLuu int,
	@Trichyeunoidung nvarchar(50),
	@file_path varchar(50)
AS
BEGIN
	insert into Congvandi
	values (@SoCV,@LoaiCV,@NgayCV,@NguoiLuu,@Trichyeunoidung,@file_path)
	select errcode=0
END

GO
/****** Object:  StoredProcedure [dbo].[themnguoidung]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themnguoidung]
@username varchar(50),
@pass varchar(50),
@manv int,
@quyen int
as
begin
	insert into taikhoan(Username,Passwd,MaNV,Quyen)
	values(@username,pwdencrypt(@pass),@manv,@quyen)
	select ErrCode=1,ErrMsg=N'them nguoi dung thanh cong'	
end
GO
/****** Object:  StoredProcedure [dbo].[ThemPhanPhoiCV]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThemPhanPhoiCV]
	@Soden int,
	@Nguoidoc nvarchar(50),
	@Nguoixuly nvarchar(10),
	@Hanxuly datetime
AS
BEGIN
	if(@Nguoixuly <> '-1')
	begin
		insert into Xuly 
		values (@Soden,1)
		insert into PhanPhoiCV
		values (@Soden,@Nguoidoc,@Nguoixuly,@Hanxuly)
	end
	else
	begin
		insert into PhanPhoiCV(Soden,Nguoidoc)
		values (@Soden,@Nguoidoc)
	end

	Update Congvanden set Phanphoi='True' 
	where Soden=@Soden
	select errcode=0
	
END

GO
/****** Object:  StoredProcedure [dbo].[Themtaikhoan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Themtaikhoan]
	@USname varchar(50),
	@passcu varchar(50),
	@Manv int,
	@Quyen int
AS
BEGIN
	if exists(select * from nhanvien where  Manv=@Manv)
	begin
		insert Taikhoan(username,passwd,Manv,quyen) values(@USname,pwdencrypt(@passcu),@Manv,@Quyen)
	end
	else 
	begin
		
		select errcode=1,errmsg='Khong co nhan vien nay'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[XoaCongVanDen]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[XoaCongVanDen]
	@Soden int
AS
BEGIN
	DELETE Congvanden WHERE Soden=@Soden
select errcode=0
END

GO
/****** Object:  StoredProcedure [dbo].[XoaCongVanDi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[XoaCongVanDi]
	@Sodi int
AS
BEGIN
	DELETE Congvandi WHERE Sodi=@Sodi
select errcode=0
END

GO
/****** Object:  StoredProcedure [dbo].[xoanguoidung]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[xoanguoidung]
@id varchar(50)
as
begin
	delete from  taikhoan   where ID in (@id)
	select ErrCode=1,ErrMsg=N'Xoa nguoi dung thanh cong'	
end
GO
/****** Object:  StoredProcedure [dbo].[XoaPhanPhoiCV]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[XoaPhanPhoiCV]
	@Soden int
AS
BEGIN
	
	delete PhanPhoiCV where @Soden=Soden
	delete Xuly where @Soden=Soden
	Update Congvanden set Phanphoi='false' where Soden=@Soden
	select errcode=0
END

GO
/****** Object:  UserDefinedFunction [dbo].[LoaiCV]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function  [dbo].[LoaiCV](@Nxl int)
returns nvarchar(10)
as
begin
declare @st nvarchar(10)
if(@Nxl)<>'' set @st=N'Xử Lý'
else  set @st=N'Đọc'
return (@st)
end
GO
/****** Object:  Table [dbo].[Congvanden]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Congvanden](
	[Soden] [int] IDENTITY(1,1) NOT NULL,
	[SoCV] [varchar](20) NOT NULL,
	[LoaiCV] [int] NOT NULL,
	[NgayCV] [datetime] NOT NULL,
	[NguoiLuu] [int] NOT NULL,
	[Ngaynhan] [datetime] NOT NULL,
	[MaCQ] [int] NOT NULL,
	[Trichyeunoidung] [nvarchar](50) NULL,
	[Phanphoi] [bit] NOT NULL,
	[file_path] [nchar](50) NULL,
 CONSTRAINT [pk_CVDen_soden] PRIMARY KEY CLUSTERED 
(
	[Soden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Congvandi]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Congvandi](
	[Sodi] [int] IDENTITY(1,1) NOT NULL,
	[SoCV] [varchar](20) NOT NULL,
	[LoaiCV] [int] NOT NULL,
	[Ngayki] [datetime] NOT NULL,
	[NguoiLuu] [int] NOT NULL,
	[Trichyeunoidung] [nvarchar](50) NULL,
	[file_path] [nchar](50) NULL,
 CONSTRAINT [pk_CVDi_sodi] PRIMARY KEY CLUSTERED 
(
	[Sodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coquan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coquan](
	[MaCQ] [int] IDENTITY(1,1) NOT NULL,
	[TenCQ] [nvarchar](30) NOT NULL,
	[DiaCHi] [nvarchar](30) NOT NULL,
	[SDT] [nvarchar](10) NULL,
	[Fax] [nvarchar](10) NULL,
 CONSTRAINT [pk_CQ_MaCQ] PRIMARY KEY CLUSTERED 
(
	[MaCQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiCongVan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCongVan](
	[MaloaiCV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiCV] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LoaiCongVan] PRIMARY KEY CLUSTERED 
(
	[MaloaiCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nhanvien]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[Manv] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](20) NOT NULL,
	[Gioitinh] [bit] NOT NULL,
	[Chucvu] [nvarchar](20) NOT NULL,
	[Ngaysinh] [datetime] NOT NULL,
	[Ngaybatdaulam] [datetime] NOT NULL,
	[Diachi] [nvarchar](30) NULL,
 CONSTRAINT [pk_Nhanvien_MaNV] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanphoiCV]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanphoiCV](
	[Mathaotac] [int] IDENTITY(1,1) NOT NULL,
	[Soden] [int] NOT NULL,
	[Nguoidoc] [varchar](100) NOT NULL,
	[Nguoixuly] [varchar](50) NULL,
	[Hanxuly] [datetime] NULL,
 CONSTRAINT [pk_PhanPhoi_Mathaotac] PRIMARY KEY CLUSTERED 
(
	[Mathaotac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Taikhoan]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Taikhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Passwd] [varchar](100) NOT NULL,
	[MaNV] [int] NOT NULL,
	[Quyen] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
UPDATE STATISTICS [dbo].[Taikhoan] WITH ROWCOUNT = 4, PAGECOUNT = 1
GO
/****** Object:  Table [dbo].[Tientrinhxuly]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tientrinhxuly](
	[Matientrinh] [int] IDENTITY(1,1) NOT NULL,
	[Noidung] [nvarchar](30) NOT NULL,
 CONSTRAINT [pk_Tientringxuly_MTT] PRIMARY KEY CLUSTERED 
(
	[Matientrinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xuly]    Xem thêm:    www.manguonvip.com ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xuly](
	[MaXL] [int] IDENTITY(1,1) NOT NULL,
	[Soden] [int] NOT NULL,
	[Matientrinh] [int] NOT NULL,
 CONSTRAINT [pk_Xuly_Maxl] PRIMARY KEY CLUSTERED 
(
	[MaXL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Congvanden] ON 

INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (8, N'JQK', 1, CAST(0x0000A47E00000000 AS DateTime), 1, CAST(0x0000A03700000000 AS DateTime), 3, N'Công văn xử lý tài chính', 1, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (9, N'CV220', 1, CAST(0x0000A48A00000000 AS DateTime), 1, CAST(0x0000A04300000000 AS DateTime), 2, N'Công văn xử lý báo giá', 1, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (11, N'CV221', 2, CAST(0x0000A47500000000 AS DateTime), 1, CAST(0x0000A02F00000000 AS DateTime), 1, N'Công văn mời thầu', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (12, N'CV201', 2, CAST(0x0000A46D00000000 AS DateTime), 1, CAST(0x0000A02600000000 AS DateTime), 1, N'Công văn mời thầu', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (13, N'CV202', 3, CAST(0x0000A47500000000 AS DateTime), 1, CAST(0x0000A03C00000000 AS DateTime), 1, N'Công văn mời thầu', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (14, N'CV203', 3, CAST(0x0000A47C00000000 AS DateTime), 1, CAST(0x0000A03700000000 AS DateTime), 1, N'Công văn mời thầu', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (15, N'CV204', 4, CAST(0x0000A46E00000000 AS DateTime), 1, CAST(0x0000A03C00000000 AS DateTime), 2, N'Công văn mời thầu', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (16, N'CV205', 1, CAST(0x0000A47400000000 AS DateTime), 1, CAST(0x0000A03C00000000 AS DateTime), 2, N'Công văn mời thầu', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (17, N'178-NDCP', 3, CAST(0x0000A4B300000000 AS DateTime), 2, CAST(0x0000A0FF00000000 AS DateTime), 3, N'Công văn mời thầu', 1, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (18, N'CV206', 1, CAST(0x0000A47500000000 AS DateTime), 1, CAST(0x0000A03D00000000 AS DateTime), 1, N'Công văn xử lý tài chính', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (19, N'CV207', 2, CAST(0x0000A47500000000 AS DateTime), 1, CAST(0x0000A03C00000000 AS DateTime), 1, N'Công văn xử lý tài chính', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (20, N'CV208', 1, CAST(0x0000A47500000000 AS DateTime), 1, CAST(0x0000A03D00000000 AS DateTime), 1, N'Công văn xử lý vốn dư', 0, N'CV/den/20_3.doc                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (21, N'CV209', 4, CAST(0x0000A48300000000 AS DateTime), 1, CAST(0x0000A03D00000000 AS DateTime), 1, N'Công văn xử lý tài chính', 1, N'CV/den/21_Nê Document.doc                         ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (22, N'QÐ-2012', 3, CAST(0x0000A4AD00000000 AS DateTime), 1, CAST(0x0000A06900000000 AS DateTime), 1, N'Công văn xử lý hóa đơn', 0, N'CV/den/22_New Microsoft Word Document.doc         ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (23, N'CV210', 2, CAST(0x0000A48200000000 AS DateTime), 1, CAST(0x0000A04400000000 AS DateTime), 1, N'Công văn hành chính', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (24, N'CV211', 1, CAST(0x0000A48A00000000 AS DateTime), 2, CAST(0x0000A06100000000 AS DateTime), 2, N'Công văn hành chính', 1, N'CV/den/24_greated(0347204)_quanlycongvan.doc      ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (25, N'CV212', 4, CAST(0x0000A46D00000000 AS DateTime), 1, CAST(0x0000A03D00000000 AS DateTime), 1, N'Công văn xử lý tài chính', 0, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (27, N'CV213', 2, CAST(0x0000A49000000000 AS DateTime), 2, CAST(0x0000A05900000000 AS DateTime), 1, N'Công văn hành chính', 1, N'CV/den/27_greated(05131190)_thu nghiem.doc        ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (28, N'CV214', 4, CAST(0x0000A4A000000000 AS DateTime), 2, CAST(0x0000A05A00000000 AS DateTime), 1, N'Công văn hành chính', 0, N'CV/den/28_greated(223152947)_Doc1.doc             ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (29, N'CV215', 1, CAST(0x0000A4A500000000 AS DateTime), 2, CAST(0x0000A05F00000000 AS DateTime), 2, N'Công văn hành chính', 1, N'CV/den/29_greated(023845)_quanlycongvan.doc       ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (30, N'CV216', 3, CAST(0x0000A4A500000000 AS DateTime), 2, CAST(0x0000A06800000000 AS DateTime), 3, N'Công văn xử lý báo giá', 0, N'CV/den/30_greated(01047533)_quanlycongvan.doc     ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (31, N'CV217', 1, CAST(0x0000A4AC00000000 AS DateTime), 2, CAST(0x0000A06400000000 AS DateTime), 2, N'Công văn xử lý báo giá', 1, N'CV/den/31_greated(02320345)_quanlycongvan.doc     ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (32, N'NDCP-879-TTLT', 4, CAST(0x0000A4B300000000 AS DateTime), 2, CAST(0x0000A08300000000 AS DateTime), 2, N'Công văn xử lý báo giá', 1, N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (33, N'CV218', 1, CAST(0x0000A55D00000000 AS DateTime), 1, CAST(0x0000A13300000000 AS DateTime), 1, N'Công văn xử lý báo giá', 1, N'                                                  ')
INSERT [dbo].[Congvanden] ([Soden], [SoCV], [LoaiCV], [NgayCV], [NguoiLuu], [Ngaynhan], [MaCQ], [Trichyeunoidung], [Phanphoi], [file_path]) VALUES (35, N'CV219', 1, CAST(0x0000A55D00000000 AS DateTime), 1, CAST(0x0000A11700000000 AS DateTime), 1, N'Công văn xử lý báo giá', 0, N'                                                  ')
SET IDENTITY_INSERT [dbo].[Congvanden] OFF
SET IDENTITY_INSERT [dbo].[Congvandi] ON 

INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (1, N'CV000123', 1, CAST(0x0000A48A00000000 AS DateTime), 1, N'', N'CV/di/1_greated(21548331)_zzz.doc                 ')
INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (2, N'CV000232', 2, CAST(0x0000A49800000000 AS DateTime), 1, N'Công văn xử lý tài chính', N'CV/di/2_3.doc                                     ')
INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (3, N'CV000234', 3, CAST(0x0000A49800000000 AS DateTime), 1, N'Công văn xử lý báo giá', N'Nodownload.aspx                                   ')
INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (4, N'CV000235', 3, CAST(0x0000A4A500000000 AS DateTime), 2, N'Công văn mời thầu', N'CV/den/4_greated(2342796)_zzz.doc                 ')
INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (5, N'CV000236', 4, CAST(0x0000A4A900000000 AS DateTime), 2, N'Công văn xử lý vốn dư', N'CV/den/5_greated(215327862)_quanlycongvan.doc     ')
INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (6, N'TTLT-99', 6, CAST(0x0000A4C800000000 AS DateTime), 2, N'Công văn xử lý hóa đơn', N'CV/di/6_greated(211055609)_Doc1.doc               ')
INSERT [dbo].[Congvandi] ([Sodi], [SoCV], [LoaiCV], [Ngayki], [NguoiLuu], [Trichyeunoidung], [file_path]) VALUES (7, N'CV000238', 1, CAST(0x0000A56B00000000 AS DateTime), 5, N'Công văn hành chính', N'                                                  ')
SET IDENTITY_INSERT [dbo].[Congvandi] OFF
SET IDENTITY_INSERT [dbo].[Coquan] ON 

INSERT [dbo].[Coquan] ([MaCQ], [TenCQ], [DiaCHi], [SDT], [Fax]) VALUES (1, N'SONADEZI', N'123', N'061399999', N'061399998')
INSERT [dbo].[Coquan] ([MaCQ], [TenCQ], [DiaCHi], [SDT], [Fax]) VALUES (2, N'Google', N'456', N'099999999', N'099999998')
INSERT [dbo].[Coquan] ([MaCQ], [TenCQ], [DiaCHi], [SDT], [Fax]) VALUES (3, N'FaceBook', N'999', N'0987654321', N'0123456789')
SET IDENTITY_INSERT [dbo].[Coquan] OFF
SET IDENTITY_INSERT [dbo].[LoaiCongVan] ON 

INSERT [dbo].[LoaiCongVan] ([MaloaiCV], [TenLoaiCV]) VALUES (1, N'Tờ trình')
INSERT [dbo].[LoaiCongVan] ([MaloaiCV], [TenLoaiCV]) VALUES (2, N'Quyết đinh')
INSERT [dbo].[LoaiCongVan] ([MaloaiCV], [TenLoaiCV]) VALUES (3, N'Pháp lệnh')
INSERT [dbo].[LoaiCongVan] ([MaloaiCV], [TenLoaiCV]) VALUES (4, N'Giấy mời')
INSERT [dbo].[LoaiCongVan] ([MaloaiCV], [TenLoaiCV]) VALUES (5, N'Công điện')
INSERT [dbo].[LoaiCongVan] ([MaloaiCV], [TenLoaiCV]) VALUES (6, N'Văn bản nội bộ')
SET IDENTITY_INSERT [dbo].[LoaiCongVan] OFF
SET IDENTITY_INSERT [dbo].[Nhanvien] ON 

INSERT [dbo].[Nhanvien] ([Manv], [TenNV], [Gioitinh], [Chucvu], [Ngaysinh], [Ngaybatdaulam], [Diachi]) VALUES (1, N'Nguyễn Quang Minh', 1, N'Quan Tri', CAST(0x0000818D00000000 AS DateTime), CAST(0x0000A02F00000000 AS DateTime), N'393/8 kp5b')
INSERT [dbo].[Nhanvien] ([Manv], [TenNV], [Gioitinh], [Chucvu], [Ngaysinh], [Ngaybatdaulam], [Diachi]) VALUES (2, N'Anh hung', 1, N'Giam Doc', CAST(0x0000846800000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), N'393/8')
INSERT [dbo].[Nhanvien] ([Manv], [TenNV], [Gioitinh], [Chucvu], [Ngaysinh], [Ngaybatdaulam], [Diachi]) VALUES (3, N'bill gate', 1, N'Nhan vien', CAST(0xFFFFF31700000000 AS DateTime), CAST(0x0000A03100000000 AS DateTime), N'1234')
INSERT [dbo].[Nhanvien] ([Manv], [TenNV], [Gioitinh], [Chucvu], [Ngaysinh], [Ngaybatdaulam], [Diachi]) VALUES (5, N'Luog Van Dao', 1, N'Chu Tich', CAST(0x0000837800000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'e761 ')
INSERT [dbo].[Nhanvien] ([Manv], [TenNV], [Gioitinh], [Chucvu], [Ngaysinh], [Ngaybatdaulam], [Diachi]) VALUES (8, N'Tran Minh Thuan', 1, N'Pho Giam Doc', CAST(0x0000836C00000000 AS DateTime), CAST(0x00009FF500000000 AS DateTime), N'bien hoa')
SET IDENTITY_INSERT [dbo].[Nhanvien] OFF
SET IDENTITY_INSERT [dbo].[PhanphoiCV] ON 

INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (12, 8, N'2.3.', N'3', CAST(0x0000A03C00000000 AS DateTime))
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (23, 24, N'1.3.', N'3', CAST(0x0000A06100000000 AS DateTime))
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (24, 27, N'3.', NULL, NULL)
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (25, 31, N'3.', N'3', CAST(0x0000A05900000000 AS DateTime))
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (27, 29, N'1.3.', NULL, NULL)
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (28, 32, N'1.2.3.', N'3', CAST(0x0000A07300000000 AS DateTime))
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (29, 17, N'1.2.3.', N'3', CAST(0x0000A07600000000 AS DateTime))
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (30, 21, N'1.', NULL, NULL)
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (31, 33, N'1.', NULL, NULL)
INSERT [dbo].[PhanphoiCV] ([Mathaotac], [Soden], [Nguoidoc], [Nguoixuly], [Hanxuly]) VALUES (32, 9, N'1.', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PhanphoiCV] OFF
SET IDENTITY_INSERT [dbo].[Taikhoan] ON 

INSERT [dbo].[Taikhoan] ([ID], [Username], [Passwd], [MaNV], [Quyen]) VALUES (1, N'sakura', N'12345', 2, 0)
INSERT [dbo].[Taikhoan] ([ID], [Username], [Passwd], [MaNV], [Quyen]) VALUES (12, N'thuanem', N'123456', 3, 0)
INSERT [dbo].[Taikhoan] ([ID], [Username], [Passwd], [MaNV], [Quyen]) VALUES (5, N'thuan', N'123', 8, 1)
INSERT [dbo].[Taikhoan] ([ID], [Username], [Passwd], [MaNV], [Quyen]) VALUES (6, N'giangnamnam', N'12345', 1, 1)
SET IDENTITY_INSERT [dbo].[Taikhoan] OFF
SET IDENTITY_INSERT [dbo].[Tientrinhxuly] ON 

INSERT [dbo].[Tientrinhxuly] ([Matientrinh], [Noidung]) VALUES (1, N'Trước hạn chưa xử lý')
INSERT [dbo].[Tientrinhxuly] ([Matientrinh], [Noidung]) VALUES (2, N'Trước hạn đang xử lý')
INSERT [dbo].[Tientrinhxuly] ([Matientrinh], [Noidung]) VALUES (3, N'Trước hạn đã xử lý')
INSERT [dbo].[Tientrinhxuly] ([Matientrinh], [Noidung]) VALUES (4, N'Sau hạn chưa xử lý')
INSERT [dbo].[Tientrinhxuly] ([Matientrinh], [Noidung]) VALUES (5, N'Sau hạn đang xử lý')
INSERT [dbo].[Tientrinhxuly] ([Matientrinh], [Noidung]) VALUES (6, N'Sau hạn đã xử lý')
SET IDENTITY_INSERT [dbo].[Tientrinhxuly] OFF
SET IDENTITY_INSERT [dbo].[Xuly] ON 

INSERT [dbo].[Xuly] ([MaXL], [Soden], [Matientrinh]) VALUES (5, 8, 1)
INSERT [dbo].[Xuly] ([MaXL], [Soden], [Matientrinh]) VALUES (12, 24, 3)
INSERT [dbo].[Xuly] ([MaXL], [Soden], [Matientrinh]) VALUES (13, 31, 1)
INSERT [dbo].[Xuly] ([MaXL], [Soden], [Matientrinh]) VALUES (15, 32, 1)
INSERT [dbo].[Xuly] ([MaXL], [Soden], [Matientrinh]) VALUES (16, 17, 5)
SET IDENTITY_INSERT [dbo].[Xuly] OFF
ALTER TABLE [dbo].[Congvanden] ADD  CONSTRAINT [DF_Congvanden_NguoiLuu]  DEFAULT ((1)) FOR [NguoiLuu]
GO
ALTER TABLE [dbo].[Congvandi] ADD  CONSTRAINT [DF_Congvandi_NguoiLuu]  DEFAULT ((1)) FOR [NguoiLuu]
GO
ALTER TABLE [dbo].[Nhanvien] ADD  CONSTRAINT [DF__Nhanvien__Gioiti__09DE7BCC]  DEFAULT ('true') FOR [Gioitinh]
GO
ALTER TABLE [dbo].[Congvanden]  WITH CHECK ADD  CONSTRAINT [FK_Congvanden_LoaiCV] FOREIGN KEY([LoaiCV])
REFERENCES [dbo].[LoaiCongVan] ([MaloaiCV])
GO
ALTER TABLE [dbo].[Congvanden] CHECK CONSTRAINT [FK_Congvanden_LoaiCV]
GO
ALTER TABLE [dbo].[Congvanden]  WITH CHECK ADD  CONSTRAINT [fk_Congvanden_MaCQ] FOREIGN KEY([MaCQ])
REFERENCES [dbo].[Coquan] ([MaCQ])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Congvanden] CHECK CONSTRAINT [fk_Congvanden_MaCQ]
GO
ALTER TABLE [dbo].[Congvanden]  WITH CHECK ADD  CONSTRAINT [FK_Congvanden_NguoiLuu] FOREIGN KEY([NguoiLuu])
REFERENCES [dbo].[Nhanvien] ([Manv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Congvanden] CHECK CONSTRAINT [FK_Congvanden_NguoiLuu]
GO
ALTER TABLE [dbo].[Congvandi]  WITH CHECK ADD  CONSTRAINT [FK_Congvandi_Nhanvien] FOREIGN KEY([NguoiLuu])
REFERENCES [dbo].[Nhanvien] ([Manv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Congvandi] CHECK CONSTRAINT [FK_Congvandi_Nhanvien]
GO
ALTER TABLE [dbo].[PhanphoiCV]  WITH CHECK ADD  CONSTRAINT [fk_Phanphoi_Soden] FOREIGN KEY([Soden])
REFERENCES [dbo].[Congvanden] ([Soden])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanphoiCV] CHECK CONSTRAINT [fk_Phanphoi_Soden]
GO
ALTER TABLE [dbo].[Taikhoan]  WITH CHECK ADD  CONSTRAINT [FK_Taikhoan_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[Taikhoan] CHECK CONSTRAINT [FK_Taikhoan_Nhanvien]
GO
ALTER TABLE [dbo].[Xuly]  WITH CHECK ADD  CONSTRAINT [fk_Xuly_MTT] FOREIGN KEY([Matientrinh])
REFERENCES [dbo].[Tientrinhxuly] ([Matientrinh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xuly] CHECK CONSTRAINT [fk_Xuly_MTT]
GO
ALTER TABLE [dbo].[Xuly]  WITH CHECK ADD  CONSTRAINT [fk_Xuly_Soden] FOREIGN KEY([Soden])
REFERENCES [dbo].[Congvanden] ([Soden])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xuly] CHECK CONSTRAINT [fk_Xuly_Soden]
GO
ALTER TABLE [dbo].[Nhanvien]  WITH CHECK ADD  CONSTRAINT [chk_Nhanvien] CHECK  (([Ngaybatdaulam]>[Ngaysinh]))
GO
ALTER TABLE [dbo].[Nhanvien] CHECK CONSTRAINT [chk_Nhanvien]
GO
/****** Object:  Statistic [_WA_Sys_00000002_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_29221CFB] ON [dbo].[Congvanden]([SoCV]) WITH STATS_STREAM = 0x01000000010000000000000000000000035E184E00000000E903000000000000A903000000000000A7030000A7000000140000000000000008D000340000000007000000A1427F014BA00000150000000000000015000000000000000000803FCDCC4C3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000000C0000000100000010000000F43C8F400000A84100000000F43C8F40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000A601000000000000450200000000000060000000000000007A000000000000009600000000000000B200000000000000CC00000000000000E80000000000000005010000000000001F010000000000003901000000000000540100000000000072010000000000008C01000000000000300010000000803F000000000000803F04000001001A00313233300010000000803F000000000000803F04000001001C00626E686A6E300010000000803F000000000000803F04000001001C0062766466683000100000000040000000000000803F04000001001A00666768300010000000803F000000000000803F04000001001C00666768686A300010000000803F000000000000803F04000001001D006668676A7662300010000000803F0000A0400000803F04000001001A004A514B300010000000803F000000000000803F04000001001A006E6E6E300010000000803F000000000000803F04000001001B006E6E6E6E300010000000803F000000000000803F04000001001E0051D02D32303132300010000000803F000000400000803F04000001001A00757575300010000000803F0000803F0000803F04000001001A00777777FF01000000000000000B0000000B000000280000002800000000000000000000002A000000313233627664666866676868676A76626A686A686A6A686B6B514B6E6E6E6E73646667767575757777770F000000400000000081030000008105030000C001080000810209000001050B0000C001100000C00111000081051200000102170000010219000081041B000081051F00008103240000010327000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000003_29221CFB] ON [dbo].[Congvanden]([LoaiCV]) WITH STATS_STREAM = 0x01000000010000000000000000000000FF09DC69000000001802000000000000D80100000000000038033F043800000004000A0000000000000000003F000000070000009FB574014BA0000014000000000000001400000000000000000000000000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000A04100000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000007C00000000000000200000000000000037000000000000004E0000000000000065000000000000001000140000000041000000000000803F01000000040000100014000000A040000000000000803F020000000400001000140000008040000000000000803F030000000400001000140000004040000000000000803F04000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000004_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000004_29221CFB] ON [dbo].[Congvanden]([NgayCV]) WITH STATS_STREAM = 0x010000000100000000000000000000003DE3D3A800000000A90300000000000069030000000000003D0300413D0000000800170300000000000000000014000007000000D2E17E014BA0000015000000000000001500000000000000000000008988883D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F0000000F0000000100000018000000000000410000A84100000000000000410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000D0200000000000078000000000000009300000000000000AE00000000000000C900000000000000E400000000000000FF000000000000001A01000000000000350100000000000050010000000000006B010000000000008601000000000000A101000000000000BC01000000000000D701000000000000F2010000000000001000180000000040000000000000803F0000000026A00000040000100018000000803F000000000000803F0000000027A00000040000100018000000803F000000000000803F000000002DA00000040000100018000000A040000000000000803F000000002EA00000040000100018000000803F000000000000803F0000000035A00000040000100018000000803F000000000000803F0000000037A00000040000100018000000803F000000000000803F000000003BA00000040000100018000000803F000000000000803F000000003CA000000400001000180000000040000000000000803F0000000043A00000040000100018000000803F000000000000803F0000000049A00000040000100018000000803F000000000000803F0000000057A00000040000100018000000803F000000000000803F0000000059A00000040000100018000000803F000000000000803F000000005EA00000040000100018000000803F000000000000803F0000000066A00000040000100018000000803F000000000000803F00000000E0A00000040000
GO
/****** Object:  Statistic [_WA_Sys_00000005_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000005_29221CFB] ON [dbo].[Congvanden]([NguoiLuu]) WITH STATS_STREAM = 0x0100000001000000000000000000000091C1DE3A00000000DA010000000000009A01000000000000380300103800000004000A00000000000000000000000037070000009FB574014BA0000014000000000000001400000000000000000000000000003F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000A04100000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000003E00000000000000100000000000000027000000000000001000140000008041000000000000803F010000000400001000140000008040000000000000803F02000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000006_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000006_29221CFB] ON [dbo].[Congvanden]([Ngaynhan]) WITH STATS_STREAM = 0x01000000010000000000000000000000E098E80500000000630300000000000023030000000000003D0380413D0000000800170300000000000000000014000007000000D2E17E014BA000001500000000000000150000000000000000000000D9899D3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D0000000D0000000100000018000000000000410000A8410000000000000041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000C701000000000000680000000000000083000000000000009E00000000000000B900000000000000D400000000000000EF000000000000000A01000000000000250100000000000040010000000000005B0100000000000076010000000000009101000000000000AC01000000000000100018000000803F000000000000803F0000000026A00000040000100018000000803F000000000000803F000000002FA000000400001000180000000040000000000000803F0000000037A000000400001000180000008040000000000000803F000000003CA000000400001000180000008040000000000000803F000000003DA00000040000100018000000803F000000000000803F0000000043A00000040000100018000000803F000000000000803F0000000044A00000040000100018000000803F000000000000803F0000000059A00000040000100018000000803F000000000000803F000000005AA000000400001000180000000040000000000000803F000000005FA00000040000100018000000803F000000000000803F0000000061A00000040000100018000000803F000000000000803F0000000069A00000040000100018000000803F000000000000803F00000000FFA00000040000
GO
/****** Object:  Statistic [_WA_Sys_00000007_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000007_29221CFB] ON [dbo].[Congvanden]([MaCQ]) WITH STATS_STREAM = 0x0100000001000000000000000000000071F5CDCC00000000F901000000000000B901000000000000380344A03800000004000A00000000000000000000000080070000009AB574014BA000001400000000000000140000000000000000000000ABAAAA3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000030000000100000014000000000080400000A04100000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000005D0000000000000018000000000000002F0000000000000046000000000000001000140000007041000000000000803F010000000400001000140000008040000000000000803F02000000040000100014000000803F000000000000803F03000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000008_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000008_29221CFB] ON [dbo].[Congvanden]([Trichyeunoidung]) WITH STATS_STREAM = 0x01000000010000000000000000000000D03F107A00000000F003000000000000B003000000000000E7020000E7000000640000000000000008D000340000000007000000AA427F014BA00000150000000000000015000000000000000000803F8C2EBA3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0000000A00000001000000100000001886E1400000A841000000001886E140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000BA010000000000004C02000000000000500000000000000063000000000000008400000000000000A900000000000000DA00000000000000F70000000000000014010000000000004101000000000000680100000000000093010000000000001000100000003041000000000000803F040000300010000000803F0000803F0000803F0400000100210063006300630063006300300010000000803F000000000000803F0400000100250064006F006900200072006F006900300010000000803F000000000000803F040000010031006600670068002000660067006800730067002000640068002000300010000000803F000000000000803F04000001001D00670066006700300010000000803F000000000000803F04000001001D00670067006700300010000000803F000000000000803F04000001002D006800660067006A002000660067002000730066002000300010000000803F000000000000803F040000010027006A006A006A006A006A006A006A006A00300010000000803F000000000000803F04000001002B007300640066002000680067002000640066006600300010000000803F000000000000803F0400000100270074006800F400690020006800CD1E6300FF01000000000000000B0000000600000028000000280000000000000000000000250000006300630063006300630066006700680020006600670068007300670020006400680020006700670067006A006A006A006A006A006A006A006A0074006800F400690020006800CD1E63000600000046000000008105000000810D0500008103120000810815000001081D000000
GO
/****** Object:  Statistic [_WA_Sys_00000009_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000009_29221CFB] ON [dbo].[Congvanden]([Phanphoi]) WITH STATS_STREAM = 0x01000000010000000000000000000000865CDBF900000000D40100000000000094010000000000006803001D680000000100010000000000000000000000000007000000AF427F014BA0000015000000000000001500000000000000000000000000003F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000200000001000000110000000000803F0000A841000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000003800000000000000100000000000000024000000000000001000110000009041000000000000803F000400001000110000004040000000000000803F01040000
GO
/****** Object:  Statistic [_WA_Sys_0000000A_29221CFB]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_0000000A_29221CFB] ON [dbo].[Congvanden]([file_path]) WITH STATS_STREAM = 0x010000000100000000000000000000001F2C0F33000000001608000000000000D607000000000000EF02511AEF000000640000000000000008D000340000000007000000B4427F014BA00000150000000000000015000000000000000000803FCDCCCC3D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000080000000100000074000000E879BE420000A8410000803FE879BE42000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000F80300000000000072060000000000004000000000000000B7000000000000002E01000000000000A5010000000000001C0200000000000093020000000000000A0300000000000081030000000000001000740000003041000000000000803F20002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F00320030005F0033002E0064006F00630020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F00320031005F004E00EA00200044006F00630075006D0065006E0074002E0064006F0063002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F00320032005F004E006500770020004D006900630072006F0073006F0066007400200057006F0072006400200044006F00630075006D0065006E0074002E0064006F006300200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F00320036005F006300680061006E006700650064002800300029005F00730064006600640063002E0064006F00630020002000200020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F0000803F0000803F430056002F00640065006E002F00320038005F00670072006500610074006500640028003000350036003400330032003500330029005F0074006800750020006E0067006800690065006D002E0064006F00630020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F00320039005F006700720065006100740065006400280032003200340035003100390034003200310029005F007A007A007A002E0064006F006300200020002000200020002000200020002000200020002000200020000400001000740000000040000000000000803F4E006F0064006F0077006E006C006F00610064002E00610073007000780020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000FF01000000010000000B00000007000000280000002800000000000000000000001401000020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000430056002F00640065006E002F00320030005F0033002E0064006F0063002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200032005F004E006500770020004D006900630072006F0073006F0066007400200057006F0072006400200044006F00630075006D0065006E0074002E0064006F00630020002000200020002000200020002000200037005F00670072006500610074006500640028003000350031003300310031003900300029005F0074006800750020006E0067006800690065006D002E0064006F0063002000200020002000200020002000200039005F006700720065006100740065006400280032003200340035003100390034003200310029005F007A007A007A002E0064006F006300200020002000200020002000200020002000200020002000200020004E006F0064006F0077006E006C006F00610064002E006100730070007800200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020000800000040000000008532000000C008320000812A3A0000812A640000812A8E0000012AB800000132E2000000
GO
/****** Object:  Statistic [pk_CVDen_soden]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[Congvanden]([pk_CVDen_soden]) WITH STATS_STREAM = 0x010000000100000000000000000000005D9A8C4600000000F102000000000000B10200000000000038035F003800000004000A000000000000000000300029000700000095B574014BA00000140000000000000014000000000000000000803FCDCC4C3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000000B0000000100000014000000000080400000A0410000000000008040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000550100000000000058000000000000006F0000000000000086000000000000009D00000000000000B400000000000000CB00000000000000E200000000000000F900000000000000100100000000000027010000000000003E01000000000000100014000000803F000000000000803F08000000040000100014000000803F000000000000803F09000000040000100014000000803F000000400000803F0D000000040000100014000000803F0000803F0000803F0F000000040000100014000000803F0000803F0000803F11000000040000100014000000803F0000803F0000803F13000000040000100014000000803F0000803F0000803F15000000040000100014000000803F0000803F0000803F17000000040000100014000000803F0000803F0000803F19000000040000100014000000803F0000803F0000803F1B000000040000100014000000803F000000000000803F1C000000040000, ROWCOUNT = 25, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_1AD3FDA4]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_1AD3FDA4] ON [dbo].[Congvandi]([SoCV]) WITH STATS_STREAM = 0x01000000010000000000000000000000F27D9DC2000000001903000000000000D902000000000000A7030000A7000000140000000000000008D00034000000000700000022767B01C7A5000007000000000000000700000000000000000000002549123E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000070000000100000010000000499284400000E0400000000049928440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013000000000000000000000000000000F60000000000000065010000000000006D01000000000000380000000000000053000000000000006E000000000000008800000000000000A300000000000000BE00000000000000DC00000000000000300010000000803F000000000000803F04000001001B0064646464300010000000803F000000000000803F04000001001B006667686A300010000000803F000000000000803F04000001001A0067686B300010000000803F000000000000803F04000001001B006B6B6B6B300010000000803F000000000000803F04000001001B0071717171300010000000803F000000000000803F04000001001E0054544C542D3939300010000000803F000000000000803F04000001001A007A7A7AFF01000000000000000700000007000000280000002800000000000000000000001D000000646464646667686A67686B6B6B6B6B7171717154544C542D39397A7A7A08000000400000000081040000008104040000810308000081040B000081040F0000810713000001031A0000000700000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_1AD3FDA4]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000003_1AD3FDA4] ON [dbo].[Congvandi]([LoaiCV]) WITH STATS_STREAM = 0x010000000100000000000000000000001BFB5DDC00000000DA010000000000009A01000000000000380300013800000004000A00000000000000000000000007070000002D0E58014BA00000030000000000000003000000000000000000803FABAAAA3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000404000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000003E0000000000000010000000000000002700000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000004_1AD3FDA4]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000004_1AD3FDA4] ON [dbo].[Congvandi]([Ngayki]) WITH STATS_STREAM = 0x010000000100000000000000000000006D19462B000000002802000000000000E8010000000000003D0300003D0000000800170300000000000000000000000007000000E31F07005BA0000005000000000000000500000000000000000000000000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000018000000000000410000A04000000000000000410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000008C0000000000000020000000000000003B0000000000000056000000000000007100000000000000100018000000803F000000000000803F0000000043A000000400001000180000000040000000000000803F0000000051A00000040000100018000000803F000000000000803F000000005EA00000040000100018000000803F000000000000803F0000000062A00000040000
GO
/****** Object:  Statistic [_WA_Sys_00000005_1AD3FDA4]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000005_1AD3FDA4] ON [dbo].[Congvandi]([NguoiLuu]) WITH STATS_STREAM = 0x010000000100000000000000000000001277CE5700000000BB010000000000007B01000000000000380379153800000004000A000000000000000000FFFFFFFF07000000D17A54014BA0000003000000000000000300000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000404000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001F0000000000000008000000000000001000140000004040000000000000803F01000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000006_1AD3FDA4]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000006_1AD3FDA4] ON [dbo].[Congvandi]([Trichyeunoidung]) WITH STATS_STREAM = 0x01000000010000000000000000000000CF2CC47E0000000095030000000000005503000000000000E7020000E7000000640000000000000008D00034000000000700000021767B01C7A50000070000000000000007000000000000000000803FABAA2A3E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050000000500000001000000100000002549A2410000E040000000002549A2410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130000000000000000000000000000001501000000000000E101000000000000E90100000000000028000000000000003B000000000000007000000000000000BD00000000000000DE00000000000000100010000000803F000000000000803F040000300010000000803F0000803F0000803F04000001003500640064006400640064006400640064006400640064006400640064006400300010000000803F000000000000803F04000001004D006700660067002000670066007200200062006E00200067007400790068002000110120006400680020006800670066006400670020003000100000000040000000000000803F0400000100210068006600670068006A00300010000000803F000000000000803F04000001003700740068006F006E0067002000740069006E002000630068007500790065006E00FF0100000000000000070000000600000028000000280000000000000000000000420000006100730064006400640064006400640064006400640064006400640064006400640064006700660067002000670066007200200062006E002000670074007900680020001101200064006800200068006700660064006700200068006600670068006A00740068006F006E0067002000740069006E002000630068007500790065006E000600000041000000008103000000810F030000811B12000082052D00000110320000000700000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000007_1AD3FDA4]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000007_1AD3FDA4] ON [dbo].[Congvandi]([file_path]) WITH STATS_STREAM = 0x010000000100000000000000000000004021674E000000001C08000000000000DC07000000000000EF02511AEF000000640000000000000008D000340000000007000000EF757B01C7A5000007000000000000000700000000000000000000002549123E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000700000001000000740000000000C8420000E040000000000000C8420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130000000000000000000000000000007903000000000000680600000000000070060000000000003800000000000000AF0000000000000026010000000000009D0100000000000014020000000000008B020000000000000203000000000000100074000000803F000000000000803F20002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F0034005F0067007200650061007400650064002800320033003400320037003900360029005F007A007A007A002E0064006F00630020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640065006E002F0035005F006700720065006100740065006400280032003100350033003200370038003600320029005F007100750061006E006C00790063006F006E006700760061006E002E0064006F00630020002000200020002000040000100074000000803F000000000000803F430056002F00640069002F0031005F00670072006500610074006500640028003200310035003400380033003300310029005F007A007A007A002E0064006F00630020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640069002F0032005F0033002E0064006F0063002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F430056002F00640069002F0036005F006700720065006100740065006400280032003100310030003500350036003000390029005F0044006F00630031002E0064006F006300200020002000200020002000200020002000200020002000200020002000040000100074000000803F000000000000803F4E006F0064006F0077006E006C006F00610064002E00610073007000780020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000040000FF01000000000000000700000007000000280000002800000000000000000000004701000020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000430056002F00640065006E002F0034005F0067007200650061007400650064002800320033003400320037003900360029005F007A007A007A002E0064006F0063002000200020002000200020002000200020002000200020002000200020002000200035005F006700720065006100740065006400280032003100350033003200370038003600320029005F007100750061006E006C00790063006F006E006700760061006E002E0064006F0063002000200020002000200069002F0031005F00670072006500610074006500640028003200310035003400380033003300310029005F007A007A007A002E0064006F0063002000200020002000200020002000200020002000200020002000200020002000200032005F0033002E0064006F006300200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200036005F006700720065006100740065006400280032003100310030003500350036003000390029005F0044006F00630031002E0064006F0063002000200020002000200020002000200020002000200020002000200020004E006F0064006F0077006E006C006F00610064002E006100730070007800200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020002000200020000B00000040000000008132000000C004320000C003360000812B390000012B64000040028F0000812C910000812CBD0000012CE900000132150100000700000000000000
GO
/****** Object:  Statistic [pk_CVDi_sodi]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[Congvandi]([pk_CVDi_sodi]) WITH STATS_STREAM = 0x01000000010000000000000000000000EABB6B4200000000DA010000000000009A01000000000000380300203800000004000A0000000000000000000000000007000000C37A54014BA00000030000000000000003000000000000000000803FABAAAA3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000404000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000003E0000000000000010000000000000002700000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000, ROWCOUNT = 7, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_1CF15040]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_1CF15040] ON [dbo].[Coquan]([TenCQ]) WITH STATS_STREAM = 0x01000000010000000000000000000000BAA90852000000001702000000000000D701000000000000E7030020E70000003C0000000000000008D0003400000000070000002C81460134A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000080410000803F00000000000080410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000002F0000000000000073000000000000000800000000000000300010000000803F000000000000803F0400000100270053004F004E004100440045005A004900FF01000000000000000100000001000000280000002800000000000000000000000800000053004F004E004100440045005A004900020000004000000000010800000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_1CF15040]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000003_1CF15040] ON [dbo].[Coquan]([DiaCHi]) WITH STATS_STREAM = 0x01000000010000000000000000000000EA530328000000000302000000000000C301000000000000E7030000E70000003C0000000000000008D00034E7000000070000003681460134A0000001000000000000000100000000000000000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000001000000100000000000C0400000803F000000000000C04000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000025000000000000005F000000000000000800000000000000300010000000803F000000000000803F04000001001D00310032003300FF010000000000000001000000010000002800000028000000000000000000000003000000310032003300020000004000000000010300000000
GO
/****** Object:  Statistic [_WA_Sys_00000004_1CF15040]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000004_1CF15040] ON [dbo].[Coquan]([SDT]) WITH STATS_STREAM = 0x010000000100000000000000000000006487DBB9000000001702000000000000D701000000000000E7020034E7000000140000000000000008D0003401000000070000003A81460134A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000080410000803F00000000000080410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000002F0000000000000073000000000000000800000000000000300010000000803F000000000000803F0400000100270036003100330039003900390039003900FF01000000000000000100000001000000280000002800000000000000000000000800000036003100330039003900390039003900020000004000000000010800000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_1CF15040]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000005_1CF15040] ON [dbo].[Coquan]([Fax]) WITH STATS_STREAM = 0x010000000100000000000000000000004C741B67000000001702000000000000D701000000000000E7020034E7000000140000000000000008D0003401000000070000003A81460134A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000080410000803F00000000000080410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000002F0000000000000073000000000000000800000000000000300010000000803F000000000000803F0400000100270036003100330039003900390039003800FF01000000000000000100000001000000280000002800000000000000000000000800000036003100330039003900390039003800020000004000000000010800000000
GO
/****** Object:  Statistic [pk_CQ_MaCQ]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[Coquan]([pk_CQ_MaCQ]) WITH STATS_STREAM = 0x01000000010000000000000000000000F811363000000000BB010000000000007B0100000000000038033D083800000004000A0000000000000000000000000007000000C614460134A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001F000000000000000800000000000000100014000000803F000000000000803F01000000040000, ROWCOUNT = 3, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_7E37BEF6]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_7E37BEF6] ON [dbo].[LoaiCongVan]([TenLoaiCV]) WITH STATS_STREAM = 0x01000000010000000000000000000000365CF20F000000001702000000000000D701000000000000E703803FE7000000280000000000000008D00034000000000700000005ED52014BA0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000080410000803F00000000000080410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000002F0000000000000073000000000000000800000000000000300010000000803F000000000000803F040000010027005400DD1E200074007200EC006E006800FF0100000000000000010000000100000028000000280000000000000000000000080000005400DD1E200074007200EC006E006800020000004000000000010800000000
GO
/****** Object:  Statistic [PK_LoaiCongVan]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[LoaiCongVan]([PK_LoaiCongVan]) WITH STATS_STREAM = 0x0100000001000000000000000000000094D661DC000000001802000000000000D801000000000000380300003800000004000A00000000000000000000000000070000004F3853014BA00000060000000000000006000000000000000000803FABAA2A3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000C04000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000007C00000000000000200000000000000037000000000000004E000000000000006500000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000100014000000803F000000000000803F06000000040000, ROWCOUNT = 6, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_07F6335A]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_07F6335A] ON [dbo].[Nhanvien]([TenNV]) WITH STATS_STREAM = 0x010000000100000000000000000000006CD496F5000000002302000000000000E301000000000000E7033D08E7000000280000000000000008D00034000000000700000077236D012FA0000001000000000000000100000000000000000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000001000000100000000000B0410000803F000000000000B04100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000035000000000000007F000000000000000800000000000000300010000000803F000000000000803F04000001002D004C0079002000480075006E006700200041006E006800FF01000000000000000100000001000000280000002800000000000000000000000B0000004C0079002000480075006E006700200041006E006800020000004000000000010B00000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_07F6335A]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000003_07F6335A] ON [dbo].[Nhanvien]([Gioitinh]) WITH STATS_STREAM = 0x010000000100000000000000000000009BCDBD6B00000000B801000000000000780100000000000068030000680000000100010000000000000000007F000000070000007C236D012FA0000001000000000000000100000000000000000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000001000000110000000000803F0000803F000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001C000000000000000800000000000000100011000000803F000000000000803F01040000
GO
/****** Object:  Statistic [_WA_Sys_00000004_07F6335A]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000004_07F6335A] ON [dbo].[Nhanvien]([Chucvu]) WITH STATS_STREAM = 0x010000000100000000000000000000005BAD1202000000001702000000000000D701000000000000E7030000E7000000280000000000000008D0003400000000070000007C236D012FA0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000080410000803F00000000000080410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000002F0000000000000073000000000000000800000000000000300010000000803F000000000000803F040000010027005100750061006E002000540072006900FF0100000000000000010000000100000028000000280000000000000000000000080000005100750061006E002000540072006900020000004000000000010800000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_07F6335A]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000005_07F6335A] ON [dbo].[Nhanvien]([Ngaysinh]) WITH STATS_STREAM = 0x01000000010000000000000000000000B29B857B00000000BF010000000000007F010000000000003D0300003D000000080017030000000000000000000000000700000081236D012FA0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000018000000000000410000803F000000000000004100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000023000000000000000800000000000000100018000000803F000000000000803F0000000068840000040000
GO
/****** Object:  Statistic [_WA_Sys_00000006_07F6335A]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000006_07F6335A] ON [dbo].[Nhanvien]([Ngaybatdaulam]) WITH STATS_STREAM = 0x010000000100000000000000000000006597146600000000BF010000000000007F010000000000003D0300003D000000080017030000000000000000000000000700000081236D012FA0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000018000000000000410000803F000000000000004100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000023000000000000000800000000000000100018000000803F000000000000803F000000002FA00000040000
GO
/****** Object:  Statistic [_WA_Sys_00000007_07F6335A]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000007_07F6335A] ON [dbo].[Nhanvien]([Diachi]) WITH STATS_STREAM = 0x01000000010000000000000000000000B729FD57000000001F02000000000000DF01000000000000E7020000E70000003C0000000000000008D00034000000000700000081236D012FA0000001000000000000000100000000000000000000000000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000001000000100000000000A0410000803F000000000000A04100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000033000000000000007B000000000000000800000000000000300010000000803F000000000000803F04000001002B003300390033002F00380020006B00700035006200FF01000000000000000100000001000000280000002800000000000000000000000A0000003300390033002F00380020006B00700035006200020000004000000000010A00000000
GO
/****** Object:  Statistic [pk_Nhanvien_MaNV]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[Nhanvien]([pk_Nhanvien_MaNV]) WITH STATS_STREAM = 0x010000000100000000000000000000008A785C5A00000000BB010000000000007B01000000000000380301003800000004000A000000000000000000000000000700000050156E012FA0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001F000000000000000800000000000000100014000000803F000000000000803F01000000040000, ROWCOUNT = 5, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_6E01572D]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_6E01572D] ON [dbo].[PhanphoiCV]([Soden]) WITH STATS_STREAM = 0x0100000001000000000000000000000024FC830D000000001802000000000000D801000000000000380300003800000004000A00000000000000000000000000070000003D5D010049A00000060000000000000006000000000000000000803FABAA2A3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000C04000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000007C00000000000000200000000000000037000000000000004E000000000000006500000000000000100014000000803F000000000000803F02000000040000100014000000803F000000000000803F03000000040000100014000000803F000000400000803F07000000040000100014000000803F000000000000803F08000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000004_6E01572D]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000004_6E01572D] ON [dbo].[PhanphoiCV]([Nguoidoc]) WITH STATS_STREAM = 0x010000000100000000000000000000003D6C452000000000CD020000000000008D02000000000000A7030000A7000000640000000000000008D000340000804007000000E961030049A000000600000000000000060000000000000000000000ABAA2A3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006000000060000000100000010000000555575400000C0400000000055557540000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000D100000000000000290100000000000030000000000000004D00000000000000670000000000000084000000000000009D00000000000000B800000000000000300010000000803F000000000000803F04000001001D00312E322E332E300010000000803F000000000000803F04000001001A00312E33300010000000803F000000000000803F04000001001D00312E332E322E300010000000803F000000000000803F04000001001900322E300010000000803F000000000000803F04000001001B00322E332E300010000000803F000000000000803F04000001001900332EFF010000000000000006000000060000002800000028000000000000000000000006000000312E322E332E080000004000000000C002000000810402000041010400000103010000C1020200000102040000010204000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_6E01572D]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000005_6E01572D] ON [dbo].[PhanphoiCV]([Nguoixuly]) WITH STATS_STREAM = 0x01000000010000000000000000000000EB17ECC1000000001F02000000000000DF01000000000000A7023D08A7000000320000000000000008D00034CD02000007000000ED61030049A000000600000000000000060000000000000000000000ABAAAA3E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000200000001000000100000005555553F0000C0400000803F5555553F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000040000000000000007B0000000000000010000000000000002800000000000000300010000000803F000000000000803F04000001001800323000100000008040000000000000803F0400000100180033FF01000000010000000600000003000000280000002800000000000000000000000200000032330300000040000000008101000000040101000000
GO
/****** Object:  Statistic [_WA_Sys_00000006_6E01572D]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000006_6E01572D] ON [dbo].[PhanphoiCV]([Hanxuly]) WITH STATS_STREAM = 0x01000000010000000000000000000000A04F24CB000000002802000000000000E8010000000000003D0200003D000000080017030000000000000000ED61030007000000ED61030049A00000060000000000000006000000000000000000803FABAA2A3E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000400000001000000180000005555D5400000C0400000803F5555D5400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000008C0000000000000020000000000000003B0000000000000056000000000000007100000000000000100018000000803F000000000000803F000000002EA00000040000100018000000803F0000803F0000803F0000000034A00000040000100018000000803F000000000000803F0000000035A00000040000100018000000803F000000000000803F000000003CA00000040000
GO
/****** Object:  Statistic [pk_PhanPhoi_Mathaotac]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[PhanphoiCV]([pk_PhanPhoi_Mathaotac]) WITH STATS_STREAM = 0x01000000010000000000000000000000010F040E000000001802000000000000D801000000000000380300003800000004000A0000000000000000000000803F07000000385D010049A00000060000000000000006000000000000000000803FABAA2A3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000C04000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000007C00000000000000200000000000000037000000000000004E000000000000006500000000000000100014000000803F000000000000803F0A000000040000100014000000803F000000000000803F0C000000040000100014000000803F000000000000803F0D000000040000100014000000803F000000400000803F11000000040000, ROWCOUNT = 10, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000001_43D61337]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000001_43D61337] ON [dbo].[Taikhoan]([ID]) WITH STATS_STREAM = 0x01000000010000000000000000000000C5C63063000000002802000000000000E801000000000000380300003800000004000A000000000000000000000000000700000064BE7801C7A5000004000000000000000400000000000000000000000000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040000000100000014000000000080400000804000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000007C000000000000008400000000000000200000000000000037000000000000004E000000000000006500000000000000100014000000803F000000000000803F01000000040000100014000000803F000000000000803F05000000040000100014000000803F000000000000803F06000000040000100014000000803F000000000000803F0C0000000400000400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000002_43D61337]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_43D61337] ON [dbo].[Taikhoan]([Username]) WITH STATS_STREAM = 0x01000000010000000000000000000000303D634F00000000A4020000000000006402000000000000A7030000A7000000320000000000000008D00034000000000700000063BE7801C7A5000004000000000000000400000000000000000000000000803E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000400000001000000100000000000D84000008040000000000000D8400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130000000000000000000000000000009700000000000000F000000000000000F80000000000000020000000000000003E000000000000005A000000000000007800000000000000300010000000803F000000000000803F04000001001E0068756E67616E68300010000000803F000000000000803F04000001001C00746875616E300010000000803F000000000000803F04000001001E00746875616E656D300010000000803F000000000000803F04000001001F0076616E64616F3131FF01000000000000000400000004000000280000002800000000000000000000001600000068756E67616E68746875616E656D76616E64616F31310500000040000000008107000000C10507000001020C000001080E0000000400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_43D61337]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000003_43D61337] ON [dbo].[Taikhoan]([Passwd]) WITH STATS_STREAM = 0x01000000010000000000000000000000F5A7C2AA0000000042030000000000000203000000000000A7030000A7000000640000000000000008D0003400000000070000005EBE7801C7A5000004000000000000000400000000000000000000000000803E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000400000001000000100000000000D04100008040000000000000D041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013000000000000000000000000000000E4000000000000008E010000000000009601000000000000200000000000000051000000000000008200000000000000B300000000000000300010000000803F000000000000803F0400000100310001002AF005DE9B20C5341738CB8C808D37949113CA7E0CDD939F300010000000803F000000000000803F040000010031000100E71C34273845AFDD25C1081EEB3D22329A034F0848255C0C300010000000803F000000000000803F040000010031000100731F0EFDEE9830149E8027B35E794EB401C42C2E4B98C5C6300010000000803F000000000000803F0400000100310001005675408485A2A3F2B02BE7C6CF7B2CD8859FE088ED3450E5FF01000000000000000400000004000000280000002800000000000000000000006200000001002AF005DE9B20C5341738CB8C808D37949113CA7E0CDD939FE71C34273845AFDD25C1081EEB3D22329A034F0848255C0C731F0EFDEE9830149E8027B35E794EB401C42C2E4B98C5C65675408485A2A3F2B02BE7C6CF7B2CD8859FE088ED3450E50600000040000000004002000000811802000081181A0000811832000001184A0000000400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000004_43D61337]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000004_43D61337] ON [dbo].[Taikhoan]([MaNV]) WITH STATS_STREAM = 0x010000000100000000000000000000006C84E7F5000000000902000000000000C90100000000000038037E0C3800000004000A0000000000000000003D22329A0700000086B47801C7A50000040000000000000004000000000000000000803F0000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000030000000100000014000000000080400000804000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000005D00000000000000650000000000000018000000000000002F000000000000004600000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F05000000040000100014000000803F000000000000803F080000000400000400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_43D61337]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000005_43D61337] ON [dbo].[Taikhoan]([Quyen]) WITH STATS_STREAM = 0x01000000010000000000000000000000E681687800000000EA01000000000000AA01000000000000380300003800000004000A00000000000000000000000000070000005DBE7801C7A5000004000000000000000400000000000000000000000000003F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000020000000100000014000000000080400000804000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000003E000000000000004600000000000000100000000000000027000000000000001000140000000040000000000000803F000000000400001000140000000040000000000000803F010000000400000400000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000002_2B3F6F97]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_2B3F6F97] ON [dbo].[Tientrinhxuly]([Noidung]) WITH STATS_STREAM = 0x01000000010000000000000000000000D08D1CE40000000047020000000000000702000000000000E7030000E70000003C0000000000000008D000340000000007000000BE5A850134A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000020420000803F00000000000020420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000004700000000000000A3000000000000000800000000000000300010000000803F000000000000803F04000001003F0054007200B001DB1E630020006800A11E6E00200063006800B001610020007800ED1E20006C00FD00FF01000000000000000100000001000000280000002800000000000000000000001400000054007200B001DB1E630020006800A11E6E00200063006800B001610020007800ED1E20006C00FD00020000004000000000011400000000
GO
/****** Object:  Statistic [pk_Tientringxuly_MTT]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[Tientrinhxuly]([pk_Tientringxuly_MTT]) WITH STATS_STREAM = 0x01000000010000000000000000000000E250BB4D00000000F901000000000000B90100000000000038031CE43800000004000A0000000000000000000000000007000000F920860134A00000050000000000000005000000000000000000803FCDCC4C3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000030000000100000014000000000080400000A04000000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000005D0000000000000018000000000000002F000000000000004600000000000000100014000000803F000000000000803F01000000040000100014000000803F0000803F0000803F03000000040000100014000000803F0000803F0000803F05000000040000, ROWCOUNT = 6, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_3C69FB99]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000002_3C69FB99] ON [dbo].[Xuly]([Soden]) WITH STATS_STREAM = 0x0100000001000000000000000000000012C7D9D400000000BB010000000000007B01000000000000380300003800000004000A0000000000000000000000000007000000C0DC070035A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001F000000000000000800000000000000100014000000803F000000000000803F03000000040000
GO
/****** Object:  Statistic [_WA_Sys_00000003_3C69FB99]    Xem thêm:    www.manguonvip.com ******/
CREATE STATISTICS [_WA_Sys_00000003_3C69FB99] ON [dbo].[Xuly]([Matientrinh]) WITH STATS_STREAM = 0x01000000010000000000000000000000259F78E300000000BB010000000000007B01000000000000380300003800000004000A0000000000000000000000000007000000C4DC070035A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001F000000000000000800000000000000100014000000803F000000000000803F01000000040000
GO
/****** Object:  Statistic [pk_Xuly_Maxl]    Xem thêm:    www.manguonvip.com ******/
UPDATE STATISTICS [dbo].[Xuly]([pk_Xuly_Maxl]) WITH STATS_STREAM = 0x01000000010000000000000000000000A6CCAE7200000000BB010000000000007B01000000000000380300003800000004000A0000000000000000000000000007000000C0DC070035A0000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000001F000000000000000800000000000000100014000000803F000000000000803F02000000040000, ROWCOUNT = 5, PAGECOUNT = 1
GO
USE [master]
GO
ALTER DATABASE [DBQLCONGVAN] SET  READ_WRITE 
GO
