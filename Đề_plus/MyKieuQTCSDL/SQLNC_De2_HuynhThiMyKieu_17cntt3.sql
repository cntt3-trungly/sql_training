use master
go
create database TIEMCHUNG
use TIEMCHUNG
go
DROP DATABASE TIEMCHUNG
create table CHUSOHUU
(
MaChuSH varchar(10) not null,
TenChuSH nvarchar (50)  not null,
DiacHi nvarchar(50) not null,
SoDienThoai varchar(10) not null,
constraint pk_MaChuSH primary key (MaChuSH)

)
create table LOAIVATNUOI
(
MaLoaiVN varchar(10) not null,
TenLoaiVN nvarchar(50) not null,
MoTaChiTiet nvarchar(50) not null,
constraint pk_MaLoaiVN primary key (MaLoaiVN)
)
create table LOAIVACXIN
(
MaLoaiVX varchar(10) not null,
TenLoaiVX nvarchar(50) not null,
PhongBenh nvarchar(50) not null,
DieuKienTiem nvarchar(50) not null,
LieuTrinhTiem nvarchar(50) not null,
LieuLuong float not null,
constraint pk_MaLoaiVX PRIMARY KEY (MaLoaiVX)
)
Create table VATNUOI 
(
MaVN varchar(10) not null,
MaChuSH varchar(10) not null,
MaLoaiVN varchar(10) not null,
TenVN nvarchar(50) not null,
CanNang int not null,
GioiTinh nvarchar(10) not null,
Tuoi int not null,
TienSuBenhLy nvarchar(50) not null,
MauLong nvarchar(50) not null,
TinhTrangSucKhoe nvarchar(50) not null,
constraint pk_MaVN primary key (MaVN),
constraint fk_MaChuSH foreign key (MaChuSH) references CHUSOHUU (MaChuSH),
 constraint fk_MaLoaiVN foreign key (MaLoaiVN) references LOAIVATNUOI (MaLoaiVN)
)
Create table TIEMCHUNG(
MaTC nvarchar(10) not null,
MaVN varchar(10) not null,
MaLoaiVX varchar(10) not null,
NgayTiem date not null,
LanTiem int not null,
constraint pk_MaTC primary key (MaTC),
foreign key (MaVN) references VATNUOI (MaVN),
foreign key (MaLoaiVX) references LOAIVACXIN (MaLoaiVX)

)

 
insert CHUSOHUU 
Values
('SH001','Chu so huu 1','Hoa Hai','0905111111'),
('SH002','Chu so huu 2','Lien Chieu','0905111112'),
('SH003','Chu so huu 3','Hai Chau','0905111113'),
('SH004','Chu so huu 4','Hoa Minh','0905111114'),
('SH005','Chu so huu 5','Hoa Hai','0905111115'),
('SH006','Chu so huu 6','Hoa Xuan','0905111116'),
('SH007','Chu so huu 7','Thanh Khe','0905111117'),
('SH008','Chu so huu 8','Cam Le','0905111118'),
('SH009','Chu so huu 9','Hoa Xuan','0905111119'),
('SH010','Chu so huu 10','Hoa Hai','0905111120')

insert LOAIVATNUOI
values
('LVN01','Cho','Loai thich an thich'),
('LVN02','Meo','Loai dong vat gay hai'),
('LVN03','Chuot','Dong vat nho'),
('LVN04','Chim','Dong vat co canh'),
('LVN05','Soc','La dong vat nho')

insert VATNUOI
values
('VN001','SH001','LVN01','Huskt','20','Duc','12','Duong ruot','den','Dam bao'),
('VN002','SH001','LVN01','Donerman','25','Cai','24','Khong','trang','Dam bao'),
('VN003','SH003','LVN01','Alaskan','15','Duc','46','Khong','vang den ','Dam bao'),
('VN004','SH004','LVN01','ChowChow','30','Cai','24','Viem man tai','trang den','Dam bao'),
('VN005','SH004','LVN02','MaineCoon','12','Duc','6','Viem mong','trang','Dam bao'),
('VN006','SH004','LVN02','Ragdol','10','Cai','7','Khong','den','Dam bao'),
('VN007','SH008','LVN02','Ba Tu','8','Duc','5','Khong','den trang','Dam bao'),
('VN008','SH006','LVN02','Xiem','4','Cai','3','Nhiem sang','vang','Dam bao')

insert LOAIVACXIN
values
('VX001','Vacxin 1','Cau trung','Duoi 1','Tiem 2 lan','1'),
('VX002','Vacxin 2','Thuong han','Tu 1-2 ','Tiem 1 lan','3'),
('VX003','Vacxin 3','Dich ta','Duoi 1','Tiem 1 lan','1.5'),
('VX004','Vacxin 4','Tu huyet','Duoi 1','Tiem 2 lan','2'),
('VX005','Vacxin 5','Lo mom','Tu 2-3','Tiem 1 lan','1'),
('VX006','Vacxin 6','Phe quan','Duoi 1','Uong 1 lan','1.5'),
('VX007','Vacxin 7','Cat xon','1','Uong 1 lan','2'),
('VX008','Vacxin 8','Tieu chay','1','Tiem 3 lan','1'),
('VX009','Vacxin 9','Ho hap','1','Tiem 1 lan','1'),
('VX010','Vacxin 10','Care','Duoi 1','Tiem 4 lan','3'),
('VX011','Vacxin 11','Uong van','Tu 1-2','Uong 1 lan','1.5'),
('VX012','Vacxin 12','Tai xanh','12','Uong 3 lan','2.5')

insert TIEMCHUNG
VALUES
('TC0001','VN001','VX007','2016/11/20','3'),
('TC0002','VN001','VX006','2016/10/23','1'),
('TC0003','VN005','VX010','2016/8/3','1'),
('TC0004','VN005','VX011','2016/9/19','2'),
('TC0005','VN005','VX011','2016/9/19','1'),
('TC0006','VN007','VX001','2016/12/7','3'),
('TC0007','VN007','VX002','2015/4/10','1'),
('TC0008','VN008','VX003','2014/10/20','2'),
('TC0009','VN008','VX002','2014/8/6','2'),
('TC0010','VN008','VX001','2015/6/5','1'),
('TC0011','VN003','VX008','2015/8/8','2'),
('TC0012','VN003','VX008','2016/4/10','3'),
('TC0013','VN001','VX006','2015/9/7','1')

/*
a)	Tạo một khung nhìn có tên là V_Vacxin để lấy thông tin
 của tất cả các loại vacxin đã từng được sử dụng để tiêm chủng 
 cho vật nuôi và có liều lượng (LieuLuong) là “1” ml trên 1kg cân nặng */
 Create view  V_Vacxin
 as
 select TenLoaiVX,lvx.LieuLuong
 from LOAIVACXIN as lvx join TIEMCHUNG as tc 
 on lvx.MaLoaiVX=tc.MaLoaiVX
 where lvx.LieuLuong=1 
 --test
 select *from V_Vacxin

 /*
 b)	Thông qua khung nhìn V_Vacxin thực hiện cập nhật liều lượng (LieuLuong)
  thành “4” ml đối với tất cả các loại vacxin
   được nhìn thấy bởi khung nhìn này. (1 điểm) */
   update V_Vacxin
   set LieuLuong=4
  where TenLoaiVX in (select TenLoaiVX from V_Vacxin)
  --TEST
SELECT * FROM LOAIVACXIN
 
 --cau2 a)	Stored Procedure Sp_1: Dùng để cập nhật thông tin
 -- của một vật nuôi nào đó với Mã vật nuôi (MaTN) được truyền
 -- vào như một tham số
 create Proc Sp_1(@MaVN varchar(10))
 as
 update  VATNUOI
 SET MaVN=@MaVN

UPDATE TIEMCHUNG
set MaVN =@MaVN

--test
execute Sp_1'VN003'
drop proc Sp_1

/*b)	Stored Procedure Sp_2: Dùng để bổ sung thêm bản ghi mới 
vào bảng TIEMCHUNG với yêu cầu Sp_2 phải thực hiện
 kiểm tra tính hợp lệ của dữ liệu được bổ sung,
 với nguyên tắc là không được trùng khóa chính và
  đảm bảo toàn vẹn dữ liệu tham chiếu đến các bảng có liên quan
*/
Create proc Sp_2(@MaTC nvarchar(10),
        @MaVN varchar(10) ,
          @MaLoaiVX varchar(10) ,
         @NgayTiem date ,
        @LanTiem int  )
AS
  IF NOT EXISTS(select *
                from TIEMCHUNG
                where MaTC = @MaTC)
	 and EXISTS(select *
               from VATNUOI
               where MaVN = @MaVN)
    and EXISTS(select *
               from LOAIVACXIN
               where MaLoaiVX = @MaLoaiVX)
	begin
	insert TIEMCHUNG
	values (@MaTC,@MaVN,@MaLoaiVX,@NgayTiem,@LanTiem)
	end
	else print 'Khong hop le'
	--test
	exec Sp_2 'TC004','VN002','VX001','2016-11-2',5
select * from TIEMCHUNG
/*cAU3-Viết 2 Trigger cho bảng TIEMCHUNG theo yêu cầu sau
a)	Trigger_1: Khi thực hiện xóa một bản ghi từ bảng VATNUOI thì hiển thị tổng 
số bản ghi đã được xóa ra giao diện console của database server */
CREATE TRIGGER Trigger_1
  ON TIEMCHUNG  
      FOR DELETE
      AS
    BEGIN
      DECLARE
        @Tong int
      select @Tong = count(*) from deleted
        print 'So ban ghi duoc xoa trong ban vat nuoi :1'
      print 'So ban ghi da duoc xoa trong bang tiem chung : ' + CAST(@Tong as VARCHAR(20))
    end

	--test
	 SELECT count(MaVN)
    FROM VATNUOI 
   /*b)	Trigger_2: Khi thêm mới một bản ghi vào bảng TIEMCHUNG thì giá trị cột NgayTiem,
     cần kiểm tra xem thời gian thêm mới cột ngày tiêm (NgayTiem) có phù hợp hay không, với quy tắc: thời gian tiêm phải nhỏ hơn 
thời gian của lần tiêm chủng cuối cùng (bất kể loại vacxin nào) của
 vật nuôi ít nhất 30 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
 nếu không thì sẽ hiển thị thông báo “Thời gian tiêm chủng phải nhỏ hơn
  thời gian tiêm chủng lần cuối cùng ít nhất 30 ngày” 
  ra giao diện console của database server. (1 điểm) */

 create trigger Trigger_2
 on TIEMCHUNG
 for INSERT
 as
 IF (UPDATE(NgayTiem))
	BEGIN
	  --Xu ly tren inserted
	  declare @maTC varchar(10),@maVN varchar(10)= null,@maLoaiVX varchar(10)=null,@ngayTiem date,@lanTiem int
	  select @ngayTiem=NgayTiem from inserted--Thời gian thêm mới ngày tiêm
	  select @maVN = MaVN from inserted
	  select @maTC = MaTC from inserted
	  select @maLoaiVX= MaLoaiVX from inserted
	  select @lanTiem = LanTiem from inserted
	  --Xu ly tren TIEMCHUNG
	  declare @ngayTiemCuoi date
	  select TOP 2 @ngayTiemCuoi=NgayTiem from TIEMCHUNG where MaVN=@maVN order by NgayTiem DESC --Thoi gian tiêm chủng cc của vật nuôi có MaVN = @maVN
	  --Xu ly dk ngay
	  declare @ngayCheck int
	  select @ngayCheck=DATEDIFF(day,@ngayTiem,@ngayTiemCuoi)
	  
		print @ngayTiem
		print @ngayTiemCuoi
		print @maVN
		print @maTC
		print @ngayCheck
		if(@ngayCheck >=30)
		begin
			print N'Cho phép cập nhật!'
		end
		else 
		begin
			print N'1.Thời gian tiêm phải nhỏ hơn thời gian của lần tiêm chủng cuối cùng ít nhất 30 ngày'
			ROLLBACK TRAN
		end
	END

/*cau4
a)	User-defined function funct1:
 Đếm số lượng các loại vacxin mà vật nuôi đã được tiêm chủng trong năm 2016, 
 chỉ đếm đối với những vật nuôi có chủ sở hữu ở địa chỉ là “Hoa hai”
  Mã vật nuôi được truyền vào như là một tham số của function này. */

  create function funct1(@maVN varchar(10))
  returns table
  as
  return
  	select tc.MaVN,vn.TenVN,sh.TenChuSH,sh.DiaChi,count(MaLoaiVX) as N'Số lần tiêm'
		from TIEMCHUNG as tc join VATNUOI as vn on tc.MaVN=vn.MaVN join CHUSOHUU as sh on sh.MaChuSH = vn.MaChuSH
		where tc.MaVN=@maVN and year(NgayTiem)='2016' and sh.DiaChi like 'Hoa Hai'
		group by tc.MaVN,vn.TenVN,sh.TenChuSH,sh.DiaChi

select * from funct1('VN001')

/* b)	User-defined function funct2: Tính số lần tiêm chủng nhiều nhất của tất cả các vật nuôi thuộc loài (TenLoaiTN) có tên là  là “Cho” .
Chỉ tính số lần tiêm trong khoảng thời gian từ đầu năm 2014 đến cuối năm 2016. (1 điểm) */
	create function funct2()
	returns table
	as
		return
        select tc.MaVN,vn.TenVN,lvn.TenLoaiVN,count(MaLoaiVX) as N'Số lần tiêm'
		from TIEMCHUNG as tc join VATNUOI as vn on tc.MaVN=vn.MaVN join LOAIVATNUOI as lvn on vn.MaLoaiVN =lvn.MaLoaiVN
		where NgayTiem > '2014-1-1' and NgayTiem < '2016-12-31' and lvn.TenLoaiVN like 'Cho'
		group by tc.MaVN,vn.TenVN,lvn.TenLoaiVN
	go
/*Câu 5: Tạo Stored Procedure Sp_TiemChung để tìm những vật nuôi thuộc loài “Cho” và đã được tiêm chủng từ hai loại vacxin trở lên 
vào đầu năm 2014 đến cuối năm 2016 để xóa thông tin của những vật nuôi đó (tức là phải xóa những bản ghi trong bảng VATNUOI có liên quan) 
và xóa những lần tiêm chủng cho vật nuôi đó (tức là phải xóa những bản ghi trong bảng TIEMCHUNG có liên quan). (2 điểm) */
	create function find()
	returns table
	as
	return 
		select tc.MaVN
		from TIEMCHUNG as tc join VATNUOI as vn on tc.MaVN=vn.MaVN join LOAIVATNUOI as lvn on vn.MaLoaiVN =lvn.MaLoaiVN
		where NgayTiem > '2014-1-1' and NgayTiem < '2016-12-31' and lvn.TenLoaiVN like 'Cho'  
		group by tc.MaVN
		having count(MaLoaiVX)>=2
	go

	create proc Sp_TiemChung
	as
	begin
		declare @ThongTin table (maVatNuoi varchar(10) not null)
		insert into @ThongTin
		select * from find()


		delete from TIEMCHUNG
		where MaVN in (select maVatNuoi from @ThongTin)
		delete from VATNUOI
		where MaVn in (select maVatNuoi from @ThongTin)
	end