use master
go
create database NHAPHANPHOI
use NHAPHANPHOI
go



create table NHACUNGCAP
(
  MaNhaCC  varchar(10)  not null,
  TenNhaCC nvarchar(50) not null,
  DiaChi   nvarchar(50) not null,
  SoDT     varchar(50)  not null,
  MaSoThue varchar(50)  not null,
  CONSTRAINT pk_MaNhaCC PRIMARY KEY (MaNhaCC)
)

create table LOAIDICHVU
(
  MaLoaiDV  varchar(10)  not null,
  TenLoaiDV nvarchar(50) not null,
  CONSTRAINT pk_MaLoaiDV PRIMARY KEY (MaLoaiDV)
)

create table MUCPHI
(
  MaMP   varchar(10)  not null,
  DonGia int          not null,
  MoTa   nvarchar(50) not null,
  constraint pk_MaMP primary key (MaMP)
)

create table DONGXE
(
  DongXe    varchar(20) not null,
  HangXe    varchar(20) not null,
  SoChoNgoi int         not null,
  constraint pk_DongXe primary key (DongXe)
)

create table DANGKICUNGCAP
(
  MaDKCC             varchar(10) not null,
  MaNhaCC            varchar(10) not null,
  MaLoaiDV           varchar(10) not null,
  DongXe             varchar(20) not null,
  MaMP               varchar(10) not null,
  NgayBatDauCungCap  date        not null,
  NgayKetThucCungCap date        not null,
  SoLuongXeDangKi    int         not null,
  constraint pk_MaDKCC primary key (MaDKCC),
  foreign key (MaNhaCC) references NhaCungCap (MaNhaCC),
  foreign key (MaLoaiDV) references LoaiDichVu (MaLoaiDV),
  foreign key (DongXe) references DongXe (DongXe),
  foreign key (MaMP) references MucPhi (MaMP)
)
INSERT NHACUNGCAP
VALUES ('NCC001', N'Cty TNHH Toàn Pháp', 'Hai Chau', '051139998888', '568941'),
       ('NCC002', N'Cty Cổ phần Đông du', 'Lien Chieu', '051139998889', '456789'),
       ('NCC003', N'Ông Nguyễn Văn A', 'Hoa Thuan', '05113999890', '321456'),
       ('NCC004', N'Cty Cổ phần Toàn cầu xanh', 'Hai Chau', '051136538905', '513364'),
       ('NCC005', N'Cty TNHH AMA', 'Thanh Khe', '05113875466', '546546'),
       ('NCC006', N'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587479', '524545'),
       ('NCC007', N'Cty TNHH Phan Thành', 'Thanh khe', '05113987456', '113021'),
       ('NCC008', N'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456', '121230'),
       ('NCC009', N'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987212', '533654'),
       ('NCC010', N'Cty Cổ phần Rạng đông', 'Lien Chieu', '05113569654', '187864')


INSERT LOAIDICHVU
VALUES ('DV01', N'Dịch vụ xe taxi'),
       ('DV02', N'Dịch vụ xe buýt công cộng theo tuyến cố định'),
       ('DV03', N'Dịch vụ xe cho thuê theo hợp đồng')


INSERT MUCPHI
VALUES ('MP01', 10000, N'Áp dụng từ 1/2015'),
       ('MP02', 15000, N'Áp dụng từ 2/2015'),
       ('MP03', 20000, N'Áp dụng từ 1/2010'),
       ('MP04', 25000, N'Áp dụng từ 1/2011')



INSERT DONGXE
VALUES ('Hiace', 'Toyota', 16),
       ('Vios', 'Toyota', 5),
       ('Escape', 'Ford', 5),
       ('Cerato', 'KIA', 7),
       ('Forte', 'KIA', 5),
       ('Starex', 'Huyndai', 7),
       ('Grand-i10', 'Huyndai', 7)


INSERT DANGKICUNGCAP
VALUES ('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015-11-20', '2016-11-20', 4),
       ('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015-11-20', '2017-11-20', 3),
       ('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017-11-20', '2018-11-20', 5),
       ('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015-11-20', '2019-11-20', 7),
       ('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019-11-20', '2020-11-20', 1),
       ('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016-11-10', '2021-11-20', 2),
       ('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015-11-30', '2016-01-25', 8),
       ('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016-02-28', '2016-08-15', 9),
       ('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016-04-27', '2017-04-30', 10),
       ('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2015-11-21', '2016-12-22', 4),
       ('DK011', 'NCC007', 'DV03', 'Forte', 'MP01', '2016-12-25', '2017-02-20', 5),
       ('DK012', 'NCC007', 'DV02', 'Cerato', 'MP01', '2016-04-14', '2017-12-20', 6),
       ('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015-12-21', '2016-12-21', 8),
       ('DK014', 'NCC008', 'DV01', 'Cerato', 'MP01', '2016-05-20', '2016-12-30', 1),
       ('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018-04-24', '2019-11-20', 6),
       ('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016-06-22', '2016-12-21', 8),
       ('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016-09-30', '2019-09-30', 4),
       ('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '2017-12-13', '2018-09-30', 2),
       ('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '2016-01-24', '2016-12-30', 8),
       ('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016-05-03', '2017-10-21', 7),
       ('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015-01-30', '2016-12-30', 9),
       ('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016-07-25', '2017-12-30', 6),
       ('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017-11-30', '2018-05-20', 5),
       ('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017-12-23', '2019-11-30', 8),
       ('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016-08-24', '2017-10-25', 1)
--cau1:a) Tạo một khung nhìn có tên là V_NhaCungCap 
--để lấy được thông tin của tất cả nhà cung cấp có địa chỉ là "Lien Chieu" 
--và đã từng đăng ký cung cấp phương tiện có ngày bắt đầu đăng ký là "20/11/2015"

create view V_Nhacungcap
as 
 select NCC.MaNhaCC,TenNhaCC,DiaChi,NgayBatDauCungCap
 from NHACUNGCAP AS NCC join DANGKICUNGCAP AS DK
 ON NCC.MaNhaCC=DK.MaNhaCC
 WHERE NCC.DiaChi='Lien Chieu' AND DK.NgayBatDauCungCap='2015-11-20' 
 --test
 select *from V_Nhacungcap
 --b)Thông qua khung nhìn V_NhaCungCap thực hiện cập nhật địa chỉ thành "Thanh Khe"
 -- đối với tất cả các nhà cung cấp được nhìn thấy bởi khung nhìn này
 update V_Nhacungcap
 set DiaChi='Thanh Khe'
 where DiaChi='Lien Chieu'
 --Cau2 
 --a) Stored Procedure Sp_1: Dùng để xóa thông tin của một dòng xe nào đó (tức là xóa 1 bản ghi trong bảng DONGXE)
 -- với tên dòng xe được truyền vào như một tham số của Stored Procedure
 create proc Sp_1(@DongXe varchar(20))
 as
 delete
 from DANGKICUNGCAP
 WHERE DongXe=@DongXe
 DELETE
 FROM DONGXE
 where DongXe=@DongXe

 execute Sp_1 'Vios'
 --b)
 --) Stored Procedure Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng DANGKYCUNGCAP 
 --với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung, 
 --với nguyên tắc là không được trùng khóa chính và đảm bảo toàn vẹn dữ liệu tham chiếu
 -- đến các bảng có liên quan

 create Proc Sp_2(@MaDKCC        varchar(10) ,
  @MaNhaCC            varchar(10) ,
  @MaLoaiDV           varchar(10) ,
  @DongXe             varchar(20) ,
  @MaMP               varchar(10),
  @NgayBatDauCungCap  date       ,
  @NgayKetThucCungCap date       ,
  @SoLuongXeDangKi    int       )  
 as
 if not exists (select * from DANGKICUNGCAP
            WHERE MaDKCC=@MaDKCC)
and exists (select * from NHACUNGCAP
where MaNhaCC=@MaNhaCC)
and exists (select * from DONGXE
where DongXe=@DongXe)
and exists (select * from MUCPHI
where MaMP=@MaMP)
  BEGIN
  insert DANGKICUNGCAP
  values (@MaDKCC       ,
  @MaNhaCC            ,
  @MaLoaiDV          ,
  @DongXe             ,
  @MaMP              ,
  @NgayBatDauCungCap      ,
  @NgayKetThucCungCap      ,
  @SoLuongXeDangKi   )
 END
 ELSE 
 PRINT 'Khong thoa man yeu cau '

 --test 
 select * from DANGKICUNGCAP
 execute Sp_2 'DK030','NCC002','DV01','Hiace','MP01','2019-06-11','2019-11-11','10'
 
 --Câu 3
 /* a) Trigger_1: Khi thực hiện xóa bản ghi trong bảng DANGKYCUNGCAP
  thì hiển thị tổng số lượng bản ghi còn lại có trong bảng DANGKYCUNGCAP 
  ra giao diện console của database server
  */
  create trigger Trigger_1
  on DANGKICUNGCAP
  for delete
  as
  begin
   DECLARE
        @Tong int
      select @Tong = count(MaDKCC)
      from DangKiCungCap
      print 'Tong so luong ban ghi con : ' + CAST(@Tong as varchar(20))
    END;

--test
 SELECT count(MaDKCC)as tong
    FROM DANGKICUNGCAP
    DELETE
    FROM DANGKICUNGCAP
    where MaDKCC = 'DK0672';
	DROP TRIGGER Trigger_1
/*
b) Trigger_2: Khi cập nhật giá trị của cột NgayKetThucCungCap,
 cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
  với quy tắc như sau: Khoảng thời gian tính từ ngày bắt đầu cho thuê đến hết
   ngày kết thúc cho thuê phải nhỏ hơn 4 năm.
 Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không thì
 sẽ hiển thị thông báo "Khoảng thời gian đăng ký cung cấp phương tiện 
 tính từ ngày bắt đầu cung cấp 
 đến hết ngày kết thúc cung cấp phải nhỏ hơn 4 năm" 
 ra giao diện console của database server */
 CREATE TRIGGER Trigger_2
      ON DANGKICUNGCAP
      FOR UPDATE
      AS
      IF UPDATE(NgayBatDauCungCap) and UPDATE(NgayKetThucCungCap)
        DECLARE
          @Day int
    DECLARE
      @4year int
    SET @4year = 365 * 4
    SELECT @Day = DATEDIFF(day,NgayBatDauCungCap, NgayKetThucCungCap)
    from inserted
    IF (@Day > 0 and @Day < @4year)
      PRINT 'Cho phep cap nhat'
    ELSE
      BEGIN
        print
            'khoang thoi gian dang ki cung cap phuong tien tinh tu ngay bat dau cung cap den het ngay ket thuc cung cap phai nho hon 4 nam' 
        ROLLBACK TRANSACTION
      END
drop trigger Trigger_2
--test
 UPDATE DANGKICUNGCAP
    SET NgayKetThucCungCap='2019-12-23'
    WHERE MaDKCC = 'DK011';
	select * from DANGKICUNGCAP
/* cau 4 
a)User-defined function func1: Đếm tổng số lượng xe đã được đăng ký cho thuê
 với mức phí là 10.000 VNĐ/km */
 
 create function func1(@MucPhi int )
     RETURNS TABLE
        AS
        RETURN
              (
                SELECT MP.MaMP, MP.DonGia, sum(SoLuongXeDangKi) as TongSoXeDangKi
                from DANGKICUNGCAP DKCC
                       join MUCPHI MP on
                  DKCC.MaMP = MP.MaMP
                where MP.DonGia = @MucPhi
                group by MP.MaMP, MP.DonGia
              )
   --test
    SELECT *
    FROM dbo.func1(10000);
/*
b)
User-defined function func2: Tính khoảng thời gian dài nhất
 (kể từ lúc bắt đầu đăng ký cho thuê đến lúc kết thúc đăng ký cho thuê) 
 mà nhà cung cấp nào đó đã từng thực hiện đăng ký cho thuê xe.
  (Lưu ý: Chỉ xét các khoảng thời gian dựa theo từng lần đăng ký cho thuê xe,
   không xét trên toàn bộ các lần đăng ký).
   Mã của nhà cung cấp được truyền vào như là một tham số của function này
*/
CREATE FUNCTION func2(@MaNhaCC varchar(10))
      RETURNS TABLE
        AS
        RETURN
              (
                SELECT NCC.MaNhaCC,
                       NCC.TenNhaCC,
                       MAX(DATEDIFF(DAY, DKCC.NgayBatDauCungCap, DKCC.NgayKetThucCungCap)) AS ThoiGianDangKi
                FROM NHACUNGCAP as  NCC
                       JOIN DANGKICUNGCAP as DKCC ON NCC.MaNhaCC = DKCC.MaNhaCC
                where NCC.MaNhaCC = @MaNhaCC
                GROUP BY NCC.MaNhaCC, NCC.TenNhaCC
              )
--test 
SELECT *
    FROM dbo.func2('NCC001');

 /*Câu 5: Tạo Stored Procedure Sp_Xe để tìm những dòng xe đã được các nhà cung cấp (bất kỳ) đăng ký cho thuê với
    loại hình dịch vụ là "Dịch vụ xe cho thuê theo hợp đồng" từ đầu năm 2015 đến hết năm 2016 để xóa thông tin về
    những dòng xe đó (tức là phải xóa những bản ghi trong bảng DONGXE có liên quan) và xóa những lần đăng ký cung cấp
    cho thuê xe liên quan đến dòng xe đó (tức là phải xóa những bản ghi trong bảng DANGKYCUNGCAP có liên quan). (2 điểm)*/

    /*Test SQL*/
    SELECT DX.DongXe
    FROM DONGXE DX
           join DANGKICUNGCAP DKCC on DX.DongXe = DKCC.DongXe
           join LOAIDICHVU LDV on DKCC.MaLoaiDV = LDV.MaLoaiDV
    where LDV.TenLoaiDV like 'Dich vu xe cho thue theo hop dong'
      and ((Year(DKCC.NgayBatDauCungCap) BETWEEN 2015 AND 2016) and
           (Year(DKCC.NgayKetThucCungCap) BETWEEN 2015 AND 2016))

    --Create proc
    CREATE PROC Sp_Xe
    as
    BEGIN
      DECLARE
        @BangPhu TABLE
                 (
                   DongXe varchar(20) not null

                 )

      INSERT INTO @BangPhu (DongXe)
      SELECT DX.DongXe
      FROM DONGXE DX
             join DANGKICUNGCAP DKCC on DX.DongXe = DKCC.DongXe
             join LOAIDICHVU LDV on DKCC.MaLoaiDV = LDV.MaLoaiDV
      where LDV.TenLoaiDV like 'Dich vu xe cho thue theo hop dong'
        and ((Year(DKCC.NgayBatDauCungCap) BETWEEN 2015 AND 2016) and
             (Year(DKCC.NgayKetThucCungCap) BETWEEN 2015 AND 2016))


      DELETE
      FROM DANGKICUNGCAP
      WHERE DongXe IN (select DongXe from @BangPhu)

      DELETE
      FROM DONGXE
      where DongXe IN (SELECT DongXe from @BangPhu)
    END

     
      /*Test PROC*/
    Execute Sp_Xe

    SELECT *
    FROM DANGKICUNGCAP
    select *
    from DONGXE;
