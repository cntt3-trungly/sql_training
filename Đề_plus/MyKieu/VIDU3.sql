use master 
go
create database VIDU3
use VIDU3
go
create table MONHOC(
	MaMH char(10) NOT NULL,
	TenMH NVARCHAR (50) NOT NULL,
	SoTC INT NOT NULL,
	CONSTRAINT pk_MaMH primary key (MaMH)
)
create table LOP_sh
(
 MaLSH char(10) not null,
 TenLSH varchar (20) not null,
 constraint pk_MaLSH primary key (MaLSH)
)
CREATE TABLE Sinhvien
(
 MaSV CHAR(10) NOT NULL,
 MaLSH char(10) not null,
 constraint pk_MaSV PRIMARY KEY (MaSV),
 CONSTRAINT fk_MaLSH  foreign key (MaLSH) references LOP_sh(MaLSH)
)
CREATE TABLE Loptinchi(
  MaLTC char(10) not null,
  MaMH char(10) not null,
  MAGV CHAR(10)  not null,
  constraint pk_MaLTC primary key (MaLTC),
  constraint fk_MaMH FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH)

)
create table BangDiem
(
  MaLTC char(10) not null,
  MaSV char(10) not null,
  Diemtk float not null,

  constraint fk_MaLTC FOREIGN KEY (MaLTC) REFERENCES Loptinchi(MaLTC)
)
select *from MONHOC

SELECT *FROM LOP_sh
select *from Sinhvien
SELECT *FROM Loptinchi
select *from BangDiem
--VD10. TínhđiểmtrungbìnhcủamỗisinhviênthuộclớpsinhhoạtLSH1
SELECT d.MaSV,sh.TenLSH, SUM(d.Diemtk* m.SoTC)/SUM(m.SoTC) AS DiemTB
FROM MONHOC AS m INNER JOIN Loptinchi AS l ON m.MaMH= l.MaMH INNER JOIN BangDiem AS d ON l.MaLTC= d.MaLTC INNER JOIN Sinhvien AS s on d.MaSV=s.MaSV Inner join LOP_sh as sh on s.MaLSH=sh.MaLSH
 where TenLSH in( select TenLSH from Sinhvien
                    WHERE TenLSH like 'LSH1'
                  )
GROUP BY d.MaSV,sh.TenLSH
--vd11 Đưaradanhsáchcácsinhviêncóđiểmtrungbình>= 8.5 
SELECT d.MaSV, SUM(d.Diemtk* m.SoTC)/SUM(m.SoTC) AS DiemTB
FROM MONHOC AS m INNER JOIN Loptinchi AS l ON m.MaMH= l.MaMH INNER JOIN BangDiem AS d ON l.MaLTC= d.MaLTC
GROUP BY MaSV
having SUM(d.Diemtk* m.SoTC)/SUM(m.SoTC)>=8.5
--VD12 ĐưaradanhsáchcácsinhviênlớpL1 cóđiểmtrungbìnhhọckỳ1 nămhọc 2014-2015 >= 8.5 
SELECT d.MaSV,s.MaLSH, SUM(d.Diemtk* m.SoTC)/SUM(m.SoTC) AS DiemTB
FROM MONHOC AS m INNER JOIN Loptinchi AS l ON m.MaMH= l.MaMH INNER JOIN BangDiem AS d ON l.MaLTC= d.MaLTC INNER JOIN Sinhvien AS s on d.MaSV=s.MaSV
WHERE MaLSH IN (SELECT MaLSH from Sinhvien
           where MaLSH = 'L1')
GROUP BY d.MaSV ,s.MaLSH
having SUM(d.Diemtk* m.SoTC)/SUM(m.SoTC)>=8.5
--vd13 Đưaradanhsáchn = 2 sinhviêncóđiểmtrungbìnhcaonhất
select TOP (2)  d.MaSV ,SUM(d.Diemtk*m.SoTC)/SUM (m.SoTC) AS DiemTB
FROM MONHOC AS m INNER JOIN Loptinchi as l on m.MaMH=L.MaMH INNER JOIN BangDiem AS d ON l.MaLTC=d.MaLTC
group by MaSV
ORDER BY sum (d.Diemtk*m.SoTC)/sum(m.SoTC) DESC

