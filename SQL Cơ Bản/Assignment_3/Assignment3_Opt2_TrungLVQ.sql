CREATE DATABASE BANHANG2
USE BANHANG2 
GO

CREATE TABLE San_Pham (
Ma_SP varchar(10) ,
Ten_SP nvarchar(30) not null,
DonGia int ,
constraint PK_San_Pham primary key (Ma_SP)
)

CREATE TABLE Khach_Hang (
Ma_KH varchar(10) ,
Ten_KH nvarchar(40) not null,
Phone_No varchar(30) not null,
Ghi_chu nvarchar(50) ,
constraint PK_Khach_Hang primary key (Ma_KH)
)

CREATE TABLE Don_Hang (
Ma_DH varchar(10) ,
Ngay_DH date not null,
Ma_SP varchar(10) ,
Ma_KH varchar(10), 
So_Luong int not null ,
constraint PK_Don_Hang primary key (Ma_DH),
constraint FK_Don_Hang_Khach_Hang foreign key (Ma_KH) references Khach_Hang(Ma_KH),
constraint FK_Don_Hang_San_Pham foreign key (Ma_Sp) references San_Pham(Ma_Sp)
)

-- Insert Data
INSERT INTO San_Pham VALUES 
('SP01',N'Bóng Bàn','200000'),
('SP02',N'Ba lô','130000'),
('SP03',N'Bóng Đá','430000'),
('SP04',N'Bóng xà BAN','130000')


INSERT INTO Khach_Hang VALUES
('KH01',N'Lý Văn Quang Trung','0905306110',N'Khách Hàng Thân Thiết'),
('KH02',N'Hoàng Công Duy Hy','0903102043',N'Khách Hàng SS'),
('KH03',N'Phan Công Tài','091124771',N'Khách hàng thường xuyên')

INSERT INTO Don_Hang VALUES
('DH01','2020-1-1','SP01','KH01',3),
('DH02','2020-2-2','SP01','KH02',2),
('DH03','2020-3-3','SP03','KH02',1),
('DH04','2020-4-4','SP04','KH03',4),
('DH05','2020-5-5','SP02','KH03',5)

-- Create view 
 CREATE VIEW view_DONHANG 
 AS
 SELECT kh.Ten_KH,dh.Ngay_DH,sp.Ten_SP,dh.So_Luong, ( dh.So_Luong * sp.DonGia) AS ThanhTien FROM Don_Hang dh
 JOIN Khach_Hang kh ON dh.Ma_KH=kh.Ma_KH
 JOIN San_Pham sp ON sp.Ma_SP=dh.Ma_SP 

 ----------------------------------   Question 2 ------------------------------------

 CREATE DATABASE Assignment3_Opt2
 USE Assignment3_Opt2
 GO
 
CREATE TABLE Department  (
  Department_Number int identity(1,1) ,
  Department_Name varchar(30) Not null,
  constraint PK_Department primary key (Department_Number)
)

CREATE TABLE Employee_Table  (
Employee_Number int identity(1,1) ,
Employee_Name varchar(30) not null,
Department_Number int ,
constraint PK_Employee_Tabler primary key (Employee_Number),
constraint FK_Employee_Table_Department foreign key (Department_Number) references Department(Department_Number)
)



CREATE TABLE Employee_Skill_Table   (
  Employee_Number int ,
  Skill_Code varchar(20) not null,
  Date_Registered date not null,
  constraint PK_Employee_Skill_Table primary key (Employee_Number,Skill_Code),
constraint FK_Employee_Skill_Table_Employee_Table foreign key (Employee_Number) references Employee_Table(Employee_Number)
)

-- add row 
INSERT INTO Department VALUES
('Fresher 102'),
('Junior 202'),
('Master 104')

INSERT INTO Employee_Table VALUES
('Joinny Mark',2),
('Tony Stark',1),
('Kimtae Hee',3),
('Park HangSeo',2),
('Quang Trung',1),
('King Chef',3),
('Queen AAS',3),
('Tommy',3),

INSERT INTO Employee_Skill_Table VALUES
(1,'Java','2020-1-3'),
(2, 'C++','2020-1-4'),
(3, 'C#','2020-1-5'),
(1, 'Javascipt','2021-1-3'),
(4, 'Golang','2020-2-4')

--a.	Use JOIN selection
SELECT emp.Employee_Name FROM Employee_Table emp 
JOIN Employee_Skill_Table emt ON emp.Employee_Number=emt.Employee_Number WHERE emt.Skill_Code='Java'

--b.	Use sub query
SELECT emp.Employee_Name FROM Employee_Table emp 
WHERE emp.Employee_Number IN 
( SELECT emt.Employee_Number FROM Employee_Skill_Table emt WHERE  emt.Skill_Code='Java')

--3.	Specify the departments which have >=3 employees, print out the list of 
--departments’ employees right after each department.3.	Specify the departments which have >=3 employees, 
--print out the list of departments’ employees right after each department.

SELECT dp.Department_Name,STRING_AGG(emp.Employee_Name,' , ') AS ListEmployee FROM Employee_Table emp 
JOIN Department dp ON emp.Department_Number=dp.Department_Number
GROUP BY dp.Department_Name
HAVING Count(emp.Employee_Number)>=3 

-- 4.4.	Use SUB-QUERY technique to list out the different employees 
--(include employee number and employee names) who have multiple skills.

SELECT Employee_Number,Employee_Name from Employee_Table WHERE Employee_Number  IN
(SELECT emp.Employee_Number FROM Employee_Table emp 
JOIN Employee_Skill_Table emt ON emp.Employee_Number=emt.Employee_Number 
GROUP BY emp.Employee_Number
HAVINg COUNT(emt.Skill_Code)>=2)

--5 5.	Create a view to show different employees 
--(with following information: employee number and employee name, department name) who have multiple skills.

CREATE VIEW view_employee_with_multipleSkill
AS
SELECT emp.Employee_Number,emp.Employee_Name,dp.Department_Name FROM Employee_Table emp 
JOIN Employee_Skill_Table emt ON emp.Employee_Number=emt.Employee_Number 
JOIN Department dp ON emp.Department_Number=dp.Department_Number
GROUP BY emp.Employee_Number,emp.Employee_Name,dp.Department_Name
HAVINg COUNT(emt.Skill_Code)>=2
