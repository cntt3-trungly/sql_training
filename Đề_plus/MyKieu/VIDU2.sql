use master
go
CREATE DATABASE VIDU2
use VIDU2
go
create table MON_HOC(
	MaMH char(10) NOT NULL,
	TenMH NVARCHAR (50) NOT NULL,
	SoTC INT NOT NULL,
	CONSTRAINT pk_MaMH primary key (MaMH)
)
CREATE TABLE LOP_TIN_CHI(
  MaLTC char(10) not null,
  MaMH char(10) not null,
  MAGV CHAR(10)  not null,
  constraint pk_MaLTC primary key (MaLTC),
  constraint fk_MaMH FOREIGN KEY (MaMH) REFERENCES MON_HOC(MaMH)

)
CREATE TABLE BANG_DIEM(
  MaLTC char(10) not null,
  MaSV char(10) not null,
  DiemTK float not null,
  constraint fk_MaLTC FOREIGN KEY (MaLTC) REFERENCES LOP_TIN_CHI(MaLTC)
)
SELECT *FROM MON_HOC
select *from LOP_TIN_CHI
select *from BANG_DIEM
 --VIDU9:Tínhđiểmtrungbìnhcủamỗisinhviên 
 select BD.MaSV ,SUM(BD.DiemTK *mh.SoTC)/Sum(mh.SoTC) as DiemTB
 FROM BANG_DIEM BD,MON_HOC mh,LOP_TIN_CHI L
 where MaSV in (select MaLTC from LOP_TIN_CHI WHERE( BD.MaLTC=L.MaLTC))
 GROUP by BD.MaSV   
     HAVING MaSV  in (select MaMH from MON_HOC WHERE (mh.MaMH=L.MaMH))
             
	--C2
	SELECT d.MaSV, SUM(d.DiemTK* m.SoTC)/SUM(m.SoTC) AS DiemTB
    FROM MON_HOC AS m INNER JOIN LOP_TIN_CHI AS l ON m.MaMH= l.MaMH INNER JOIN BANG_DIEM AS d ON l.MaLTC= d.MaLTC
	GROUP by MaSV   		



