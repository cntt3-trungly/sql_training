USE TiemChung
GO
CREATE TABLE LoaiVacXin
(
  MaLoaiVX      varchar(10) not null,
  TenLoaiVX     varchar(50) not null,
  PhongBenh     varchar(50) not null,
  DieuKienTiem  varchar(50) not null,
  LieuTrinhTiem varchar(50) not null,
  LieuLuong     float       not null,
  constraint pk_MaLoaiVX primary key (MaLoaiVX)
)

CREATE TABLE ChuSoHuu
(
  MaChuSH     varchar(10) not null,
  TenChuSH    varchar(50) not null,
  DiaChi      varchar(50) not null,
  SoDienThoai varchar(50) not null,
  constraint pk_MaChuSH primary key (MaChuSH)
)

CREATE TABLE LoaiVatNuoi
(
  MaLoaiVN    varchar(10) not null,
  TenLoaiVN   varchar(50) not null,
  MoTaChiTiet varchar(50) not null,
  constraint pk_MaLoaiVN primary key (MaLoaiVN)
)

CREATE TABLE VatNuoi
(
  MaVN             varchar(10) not null,
  MaLoaiVN         varchar(10) not null,
  MaChuSH          varchar(10) not null,
  TenVN            varchar(50) not null,
  CanNang          int         not null,
  GioiTinh         varchar(50) not null,
  Tuoi             int         not null,
  TienSuBenhLy     varchar(50) not null,
  MauLong          varchar(50) not null,
  TinhTrangSucKhoe varchar(50) not null,
  constraint pk_MaVN primary key (MaVN),
  foreign key (MaChuSH) references ChuSoHuu (MaChuSH),
  foreign key (MaLoaiVN) references LoaiVatNuoi (MaLoaiVN)
)

CREATE TABLE TiemChung
(
  MaTC     varchar(10) not null,
  MaVN     varchar(10) not null,
  MaLoaiVX varchar(10) not null,
  NgayTiem date        not null,
  LanTiem  int         not null
    constraint pk_MaTC primary key (MaTC),
  foreign key (MaVN) references VatNuoi (MaVN),
  foreign key (MaLoaiVX) references LoaiVacXin (MaLoaiVX)
)

INSERT ChuSoHuu
VALUES ('SH001', 'Chu so huu 1', 'Hoa Hai', '0905111111'),
       ('SH002', 'Chu so huu 2', 'Lien Chieu', '0905111112'),
       ('SH003', 'Chu so huu 3', 'Hai Chau', '0905111113'),
       ('SH004', 'Chu so huu 4', 'Hoa Minh', '0905111114'),
       ('SH005', 'Chu so huu 5', 'Hoa Hai', '0905111115'),
       ('SH006', 'Chu so huu 6', 'Hoa Xuan', '0905111116'),
       ('SH007', 'Chu so huu 7', 'Thanh Khe', '0905111117'),
       ('SH008', 'Chu so huu 8', 'Cam Le', '0905111118'),
       ('SH009', 'Chu so huu 9', 'Hoa Xuan', '0905111119'),
       ('SH010', 'Chu so huu 10', 'Hoa Hai', '0905111120')

select *
from ChuSoHuu

insert LoaiVatNuoi
VALUES ('LVN01', 'Cho', 'Loai thich an thit'),
       ('LVN02', 'Meo', 'Loai dong vat gay hai'),
       ('LVN03', 'Chuot', 'Dong vat nho'),
       ('LVN04', 'Chim', 'Dong vat co canh'),
       ('LVN05', 'Soc', 'La dong vat nho')

select *
from LoaiVatNuoi

insert VatNuoi
values ('VN001', 'LVN01', 'SH001', 'Husky', 20, 'Duc', 12, 'Duong ruot', 'den', 'Dam bao'),
       ('VN002', 'LVN01', 'SH001', 'Donerman', 25, 'Cai', 24, 'Khong', 'trang', 'Dam bao'),
       ('VN003', 'LVN01', 'SH003', 'Alaska', 15, 'Duc', 46, 'Khong', 'vang den', 'Dam bao'),
       ('VN004', 'LVN01', 'SH004', 'ChowChow', 30, 'Cai', 24, 'Viem man tai', 'trang den', 'Dam bao'),
       ('VN005', 'LVN02', 'SH004', 'MaineCoon', 12, 'Duc', 6, 'Viem mong', 'trang', 'Dam bao'),
       ('VN006', 'LVN02', 'SH004', 'Ragdoll', 10, 'Cai', 7, 'Khong', 'den', 'Dam bao'),
       ('VN007', 'LVN02', 'SH008', 'Ba tu', 8, 'Duc', 5, 'Khong', 'den trang', 'Dam bao'),
       ('VN008', 'LVN02', 'SH006', 'Xiem', 4, 'Cai', 3, 'Nhiem san', 'vang', 'Dam bao')

select *
from VatNuoi

insert LoaiVacXin
VALUES ('VX001', 'Vacxin 1', 'Cau trung', 'Duoi 1', 'Tiem 2 lan', 1),
       ('VX002', 'Vacxin 2', 'Thuong han', 'Tu 1-2', 'Tiem 1 lan', 3),
       ('VX003', 'Vacxin 3', 'Dich ta', 'Duoi 1', 'Tiem 1 lan', 1.5),
       ('VX004', 'Vacxin 4', 'Tu huyet', 'Duoi 1', 'Tiem 2 lan', 2),
       ('VX005', 'Vacxin 5', 'Lo mom', 'Tu 2-3', 'Tiem 1 lan', 1),
       ('VX006', 'Vacxin 6', 'Phe quan', 'Duoi 1', 'Tiem 1 lan', 1.5),
       ('VX007', 'Vacxin 7', 'Cat xon', '1', 'Tiem 1 lan', 2),
       ('VX008', 'Vacxin 8', 'Tieu Chay', '1', 'Tiem 3 lan', 1),
       ('VX009', 'Vacxin 9', 'Ho hap', '1', 'Tiem 1 lan', 1),
       ('VX010', 'Vacxin 10', 'Care', 'Duoi 1', 'Tiem 4 lan', 3),
       ('VX011', 'Vacxin 11', 'Uong van', 'Tu 1-2', 'Tiem 1 lan', 1.5),
       ('VX012', 'Vacxin 12', 'Tai xanh', '12', 'Tiem 3 lan', 2.5)

select *
from LoaiVacXin

insert TiemChung
values ('TC001', 'VN001', 'VX007', '2016-11-20', 3),
       ('TC002', 'VN001', 'VX006', '2016-10-23', 3),
       ('TC003', 'VN005', 'VX010', '2016-8-3', 1),
       ('TC004', 'VN005', 'VX011', '2016-9-19', 2),
       ('TC005', 'VN005', 'VX011', '2016-9-19', 1),
       ('TC006', 'VN007', 'VX001', '2016-12-7', 3),
       ('TC007', 'VN007', 'VX002', '2015-4-10', 1),
       ('TC008', 'VN008', 'VX003', '2014-10-20', 2),
       ('TC009', 'VN008', 'VX002', '2014-8-6', 2),
       ('TC010', 'VN008', 'VX001', '2015-6-5', 1),
       ('TC011', 'VN003', 'VX008', '2015-8-8', 2),
       ('TC012', 'VN003', 'VX008', '2016-4-10', 3),
       ('TC013', 'VN001', 'VX006', '2015-9-7', 1),
       ('TC014', 'VN001', 'VX007', '2016-10-9', 2),
       ('TC015', 'VN003', 'VX007', '2014-10-8', 1)

select *
from TiemChung


/*Câu 1 :a) Tạo một khung nhìn có tên là V_Vacxin để lấy thông tin của tất cả các loại vacxin đã
từng được sử dụng để tiêm chủng cho vật nuôi và có liều lượng (LieuLuong) là “1” ml
trên 1kg cân nặng */

/*Test SQL */
select LVX.MaLoaiVX, LVX.TenLoaiVX, LVX.PhongBenh, LVX.DieuKienTiem, LVX.LieuTrinhTiem, LVX.LieuLuong
from LoaiVacXin LVX
       join TiemChung TC on LVX.MaLoaiVX = TC.MaLoaiVX
where LVX.LieuLuong = 1;

/*Create view*/

CREATE VIEW V_Vacxin
AS
select LVX.MaLoaiVX, LVX.TenLoaiVX, LVX.PhongBenh, LVX.DieuKienTiem, LVX.LieuTrinhTiem, LVX.LieuLuong
from LoaiVacXin LVX
       join TiemChung TC on LVX.MaLoaiVX = TC.MaLoaiVX
where LVX.LieuLuong = 1;


UPDATE V_Vacxin
SET LieuLuong ='4';

select *
from V_Vacxin;

/* Câu 2 a) Stored Procedure Sp_1: Dùng để cập nhật thông tin của một vật nuôi nào đó với
Mã vật nuôi (MaTN) được truyền vào như một tham số.*/

/* Nếu chi truyền vào Mã vật nuôi */
CREATE PROC Sp_1(@MaVN varchar(10))
AS
BEGIN
  UPDATE VatNuoi
  SET MaLoaiVN ='LVN02',
      MaChuSH='SH002',
      TenVN='Chihuahua',
      CanNang=20
  WHERE MaVN = @MaVN
END;


EXEC SP_1 'VN001';

SELECT *
FROM VatNuoi

  /*b)Stored Procedure Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng TIEMCHUNG
  với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung, với
  nguyên tắc là không được trùng khóa chính và đảm bảo toàn vẹn dữ liệu tham chiếu
  đến các bảng có liên quan. */


  CREATE PROC Sp_2(@MaTC varchar(10),
                   @MaVN varchar(50),
                   @MaLoaiVX varchar(50),
                   @NgayTiem date,
                   @LanTiem int)
  AS

  IF NOT EXISTS(select *
                from TiemChung
                WHERE MaTC = @MaTC)
    BEGIN
      IF EXISTS(select* from VatNuoi where MaVN = @MaVN)
        BEGIN
          IF EXISTS(select* from LoaiVacXin where MaLoaiVX = @MaLoaiVX)
            BEGIN
              INSERT TiemChung VALUES (@MaTC, @MaVN, @MaLoaiVX, @NgayTiem, @LanTiem)
              print 'Insert Data seccessfully'
            END
          ELSE
            print @MaLoaiVX + ' must be exist in database LoaiVacXin'
        END
      ELSE
        print @MaVN + ' must be exist in database VatNuoi'
    END
  ELSE
    print @MaTC + ' is exist in database.Id cannot be duplicates ';


    /*DROP PROC*/
  DROP PROCEDURE Sp_2
    /*Test*/
  select *
  from TiemChung E

  EXEC Sp_2 'TC017', 'VN003', 'VX011', '2017-2-9', '2'

    /*Câu 3 a) Trigger_1: Khi thực hiện xóa một bản ghi từ bảng VATNUOI thì hiển thị tổng số
        bản ghi đã được xóa ra giao diện console của database server.*/

    /* Test SQL*/
  SELECT count(MaVN)
  from VatNuoi;

    /*Tạo trigger*/
    CREATE TRIGGER Trigger_1
      ON TiemChung
      FOR DELETE
      AS
    BEGIN
      DECLARE
        @count int
      select @count = count(*) from deleted

      print 'Số bản ghi đã xóa trong bang vat nuoi : 1'
      print 'Số bản ghi đã xóa trong bang tiem chung :  ' + CAST(@count as VARCHAR(10))

    END

    /*DROP TRIGGER*/
    DROP TRIGGER Trigger_1
    /*Test : Tạo ra procedure xóa vật nuôi và xóa bản ghi có mã vật nuôi liên quan trong bảng tiêm chủng*/

    CREATE PROC Xoa_VatNuoi(@MaVN varchar(10))
    AS
    IF EXISTS(SELECT *
              from VatNuoi
              WHERE MaVN = @MaVN)
      BEGIN
        DELETE FROM TiemChung WHERE MaVN = @MaVN
        DELETE FROM VatNuoi WHERE MaVN = @MaVN
      END
    ELSE
      PRINT 'Không tồn tại để xóa '

    EXEC Xoa_VatNuoi 'VN007';

      /*Câu 3b) Trigger_2: Khi thêm mới một bản ghi vào bảng TIEMCHUNG thì giá trị cột
NgayTiem, cần kiểm tra xem thời gian thêm mới cột ngày tiêm (NgayTiem) có phù hợp hay
không, với quy tắc: thời gian tiêm phải nhỏ hơn thời gian của lần tiêm chủng cuối cùng
(bất kể loại vacxin nào) của vật nuôi ít nhất 30 ngày. Nếu dữ liệu hợp lệ thì cho phép cập
nhật, nếu không thì sẽ hiển thị thông báo “Thời gian tiêm chủng phải nhỏ hơn thời gian
tiêm chủng lần cuối cùng ít nhất 30 ngày” ra giao diện console của database server.*/

      /*Test SQL*/
    select *
    from TiemChung TC
           join VatNuoi V on TC.MaVN = V.MaVN

    select VN.MaVN, Max(Tc.NgayTiem) NgayTiemCuoiCung
    from TiemChung TC
           join VatNuoi VN on TC.MaVN = VN.MaVN
    group by VN.MaVN
      /*Create Trigger*/

      CREATE TRIGGER Trigger_2
        ON TiemChung
        FOR INSERT
        AS
      BEGIN
        DECLARE
          @BangPhu TABLE
                   (
                     MaVN             varchar(20),
                     NgayTiemCuoiCung date
                   )
        DECLARE
          @temp int

        INSERT INTO @BangPhu (MaVN, NgayTiemCuoiCung)
        SELECT VN.MaVN, Max(Tc.NgayTiem) NgayTiemCuoiCung
        from TiemChung TC
               join VatNuoi VN on TC.MaVN = VN.MaVN
        group by VN.MaVN

        SELECT @temp = DATEDIFF(day, @BangPhu.NgayTiemCuoiCung, inserted.NgayTiem)
        from inserted
               join @BangPhu on inserted.MaVN=@BangPhu.MaVN;

        IF (@temp < 30 and @temp > 0)
          print 'Thêm dữ liệu thành công'
        else
          BEGIN
            print 'Không thể thêm dữ liệu'
            rollback TRANSACTION
          END
      end

      /*DROP TRIGGer*/
      DROP TRIGGER Trigger_2
      /*Test SQL*/
      select *
      from TiemChung
      INSERT TiemChung
      values ('TC020', 'VN001', 'VX007', '2018-12-17', 7)


      /*Bài 4 câu a)User-defined function funct1: Đếm số lượng các loại vacxin mà vật nuôi đã được
      tiêm chủng trong năm 2016, chỉ đếm đối với những vật nuôi có chủ sở hữu ở địa chỉ là “Hoa
      hai”. Mã vật nuôi được truyền vào như là một tham số của function này.  */

      /*Test SQL*/
      SELECT count(DISTINCT LVX.MaLoaiVX)
      FROM LoaiVacXin LVX
             join TiemChung TC on LVX.MaLoaiVX = TC.MaLoaiVX
             join VatNuoi VN on TC.MaVN = VN.MaVN
             join ChuSoHuu CSH on VN.MaChuSH = CSH.MaChuSH
      where year(TC.NgayTiem) = 2016
        and CSH.DiaChi like 'Hoa Minh'
        and VN.MaVN like 'VN005'

      /*Create Function*/
      CREATE FUNCTION funct1(@MaVN varchar(10))
        RETURNS int
      AS
      BEGIN
        DECLARE
          @Tong int
        SELECT @Tong = count(DISTINCT LVX.MaLoaiVX)
        FROM LoaiVacXin LVX
               join TiemChung TC
                    on LVX.MaLoaiVX = TC.MaLoaiVX
               join VatNuoi VN on TC.MaVN = VN.MaVN
               join ChuSoHuu CSH on VN.MaChuSH = CSH.MaChuSH
        where year(TC.NgayTiem) = 2016
          and CSH.DiaChi like 'Hoa Minh'
          and VN.MaVN = @MaVN
        return @Tong
      end

      /*DROP funtion*/
      DROP FUNCTION funct1
      select dbo.funct1('VN005') as TongLoaiVacxin

      /*b) User-defined function funct2: Tính số lần tiêm chủng nhiều nhất của tất cả các vật
      nuôi thuộc loài (TenLoaiTN) có tên là là “Cho” .Chỉ tính số lần tiêm trong khoảng thời gian
      từ đầu năm 2014 đến cuối năm 2016*/

      /*Test SQL*/
      select count(TC.LanTiem) as SoLanTiemNhieuNhat, VN.MaVN, VN.TenVN
      FROM TiemChung TC
             join VatNuoi VN on TC.MaVN = VN.MaVN
             join LoaiVatNuoi LVN on VN.MaLoaiVN = LVN.MaLoaiVN
      where (YEAR(TC.NgayTiem) BETWEEN 2014 and 2016)
        and LVN.TenLoaiVN like 'cho'
        and LanTiem in (
        SELECT max(TC.LanTiem) as Lantiem
        FROM TiemChung TC
               join VatNuoi VN on TC.MaVN = VN.MaVN
               join LoaiVatNuoi LVN on VN.MaLoaiVN = LVN.MaLoaiVN
        WHERE (YEAR(TC.NgayTiem) BETWEEN 2014 and 2016)
          and LVN.TenLoaiVN like 'cho'
        group by VN.MaVN
      )
      group by VN.MaVN, VN.TenVN
      /*Create Funtion*/
      CREATE FUNCTION funct2(@TenVN varchar(50))
        RETURNS TABLE
          AS
          RETURN select count(TC.LanTiem) as SoLanTiemNhieuNhat, VN.MaVN, VN.TenVN
                 FROM TiemChung TC
                        join VatNuoi VN on TC.MaVN = VN.MaVN
                        join LoaiVatNuoi LVN on VN.MaLoaiVN = LVN.MaLoaiVN
                 where (YEAR(TC.NgayTiem) BETWEEN 2014 and 2016)
                   and LVN.TenLoaiVN like @TenVN
                   and LanTiem in (
                   SELECT max(TC.LanTiem) as Lantiem
                   FROM TiemChung TC
                          join VatNuoi VN on TC.MaVN = VN.MaVN
                          join LoaiVatNuoi LVN on VN.MaLoaiVN = LVN.MaLoaiVN
                   WHERE (YEAR(TC.NgayTiem) BETWEEN 2014 and 2016)
                     and LVN.TenLoaiVN like @TenVN
                   group by VN.MaVN
                 )
                 group by VN.MaVN, VN.TenVN
      select *
      from dbo.funct2('cho')

      /*Câu 5.Tạo Stored Procedure Sp_TiemChung để tìm những vật nuôi thuộc loài “Cho” và đã
      được tiêm chủng từ hai loại vacxin trở lên vào đầu năm 2014 đến cuối năm 2016 để xóa
      thông tin của những vật nuôi đó (tức là phải xóa những bản ghi trong bảng VATNUOI có
      liên quan) và xóa những lần tiêm chủng cho vật nuôi đó (tức là phải xóa những bản ghi
      trong bảng TIEMCHUNG có liên quan).*/

      /*Tests sql*/
      SELECT VN.MaVN as SoLoaiVacxin
      FROM TiemChung TC
             join VatNuoi VN on TC.MaVN = VN.MaVN
             join LoaiVatNuoi LVN on VN.MaLoaiVN = LVN.MaLoaiVN
      WHERE (YEAR(TC.NgayTiem) BETWEEN 2014 and 2016)
        and LVN.TenLoaiVN like 'cho'
      GROUP BY VN.MaVN
      HAVING count(DISTINCT MaLoaiVX) >= 2


      /*Create proceduce*/
      CREATE PROC Sp_TiemChung
      AS
      DECLARE
        @MaVN TABLE
              (
                MaVN varchar(10)
              )
      INSERT INTO @MaVN(MaVN)
      SELECT VN.MaVN as SoLoaiVacxin
      FROM TiemChung TC
             join VatNuoi VN on TC.MaVN = VN.MaVN
             join LoaiVatNuoi LVN on VN.MaLoaiVN = LVN.MaLoaiVN
      WHERE (YEAR(TC.NgayTiem) BETWEEN 2014 and 2016)
        and LVN.TenLoaiVN like 'cho'
      GROUP BY VN.MaVN
      HAVING count(DISTINCT MaLoaiVX) >= 2
      DELETE
      FROM TiemChung
      WHERE MaVN IN (SELECT MaVN from @MaVN)
      DELETE
      FROM VatNuoi
      WHERE MaVN IN (SELECT MaVN from @MaVN)

        /*DROP proceduce*/
      DROP PROC Sp_TiemChung
        /*test*/
      EXEC Sp_TiemChung

      select *
      from VatNuoi
      SELECT *
      FROM TiemChung



