CREATE DATABASE EMS
USE EMS
Go

CREATE TABLE [dbo].[Employee](
	[EmpNo] [int] NOT NULL,
[EmpName] [nchar](30) COLLATE 
SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BirthDay] [datetime] NOT NULL,
	[DeptNo] [int] NOT NULL, 
	[MgrNo] [int] NOT NULL, 
	[StartDate] [datetime] NOT NULL,
[Salary] [money] NOT NULL,
	[Status] [int] NOT NULL,
	[Note] [nchar](100) COLLATE 
SQL_Latin1_General_CP1_CI_AS NULL,
	[Level] [int] NOT NULL

) ON [PRIMARY]

GO

ALTER TABLE Employee 
ADD CONSTRAINT PK_Emp PRIMARY KEY (EmpNo)
GO

ALTER TABLE [dbo].[Employee]  ADD  CONSTRAINT [chk_Level] CHECK  (([Level]=(7) OR [Level]=(6) OR [Level]=(5) OR [Level]=(4) OR [Level]=(3) OR [Level]=(2) OR [Level]=(1)))
GO
ALTER TABLE [dbo].[Employee]  ADD  CONSTRAINT [chk_Status] CHECK  (([Status]=(2) OR [Status]=(1) OR [Status]=(0)))

GO
ALTER TABLE [dbo].[Employee]
ADD Email NCHAR(30) 
GO

ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT chk_Email CHECK (Email IS NOT NULL)
GO

ALTER TABLE [dbo].[Employee] ADD CONSTRAINT chk_Email1 UNIQUE(Email)
GO

ALTER TABLE Employee
ADD CONSTRAINT DF_EmpNo DEFAULT 0 FOR EmpNo
GO

ALTER TABLE Employee
ADD CONSTRAINT DF_Status DEFAULT 0 FOR Status
GO

CREATE TABLE [dbo].[Skill](
	[SkillNo] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nchar](30) COLLATE 
SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Note] [nchar](100) COLLATE 
SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE Skill
ADD CONSTRAINT PK_Skill PRIMARY KEY (SkillNo)

GO

CREATE TABLE [dbo].[Department](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nchar](30) COLLATE 
SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Note] [nchar](100) COLLATE 
SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE Department
ADD CONSTRAINT PK_Dept PRIMARY KEY (DeptNo)
GO
CREATE TABLE [dbo].[Emp_Skill](
	[SkillNo] [int] NOT NULL,
	[EmpNo] [int] NOT NULL,
	[SkillLevel] [int] NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[Description] [nchar](100) COLLATE 
SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO

ALTER TABLE Emp_Skill
ADD CONSTRAINT PK_Emp_Skill PRIMARY KEY (SkillNo, EmpNo)
GO

ALTER TABLE Employee  ADD  CONSTRAINT [FK_1] FOREIGN KEY([DeptNo])
REFERENCES Department (DeptNo)



--a) Add at least 8 records into each created tables.

INSERT INTO Skill VALUES
('Java','Language of oracle'),
('C++','Hight performent language'),
('C#','.Net Developer'),
('Switch','IOS device'),
('Android','With 9 billion devide in world'),
('JavaScrip','Popular language for frontend'),
('PHP','Popular language for backend'),
('Golang','Language for embedded system'),
('.NET','framework for web system');

INSERT INTO Department VALUES
('Best Java',' asasas'),
('Best .Net','asdadas'),
('Best c++','asaasdasd'),
('Best Switch','asdasdasda'),
('Best JavaScipt','asdasdasda'),
('Best PHP','asdasdasda'),
('Best C#','asdasdasda'),
('Best Android','asdasdasda');


INSERT INTO Employee VALUES
(1,'Joinny Dept','1999-11-26',2,3,'2020-1-1',1000,2,'Best employee',2,'Trunglyvanquang@gmail.com'),
(2,'SpiderMan','1998-10-22',4,2,'2020-1-4',3000,1,'Best employee',5,'hoangthu@gmail.com'),
(3,'Batman','1999-11-26',4,0,'2020-1-5',1000,2,'Best employee',3,'katrgfjf@gmail.com'),
(4,'Tony Stark','1999-11-26',2,3,'2020-1-1',12000,1,'Best employee',4,'whatthefuck@gmail.com'),
(5,'Peter Parker','1999-11-26',7,3,'2020-1-4',14000,2,'Best employee',3,'heyyouqa@gmail.com'),
(6,'Mary Jain','1999-11-26',8,0,'2020-2-21',14000,1,'Best employee',4,'hheyyouguy@gmail.com'),
(7,'Iron Man','1999-11-26',2,6,'2020-5-16',15000,0,'Best employee',2,'chanthenhi@gmail.com'),
(8,'Ant Man','1999-11-26',4,3,'2020-7-14',26000,1,'Best employee',5,'kimjisoom@gmail.com'),
(9,'Hawk Eye','1999-11-26',3,6,'2021-1-2',21000,1,'Best employee',3,'kiasdqdaaa@gmail.com'),
(10,'Kenny Sang','1999-11-26',1,6,'2020-4-6',51000,1,'Best employee',5,'truufdgidfgdg@gmail.com'),
(11,'Kim Tae Hee','1999-11-26',5,3,'2020-5-12',12000,1,'Best employee',4,'hoangcongduy@gmail.com');

INSERT INTO Emp_Skill VALUES
(1,2,2,'2019-2-6','assa'),
(1,1,1,'2019-2-6','assa'),
(1,3,4,'2019-2-6','assa'),
(1,4,5,'2019-2-6','asdasda'),
(1,5,3,'2019-2-6','asas'),
(1,8,3,'2019-2-6','ass'),
(2,1,3,'2019-2-6','sss'),
(2,2,3,'2019-2-6','asdas'),
(2,4,4,'2019-2-6','asdasd'),
(2,5,5,'2019-2-6','asads'),
(2,6,6,'2019-2-6','asdasd'),
(2,8,1,'2019-2-6','asda'),
(3,1,1,'2019-2-6','fsdds'),
(3,2,2,'2019-2-6','asdsa'),
(3,5,3,'2019-2-6','asdasd'),
(3,4,5,'2019-2-6','asdsadasd'),
(3,9,6,'2019-2-6','asdasdas'),
(3,11,3,'2019-2-6','asdad'),
(4,2,3,'2019-2-6','asdasdas'),
(4,6,1,'2019-2-6','asdasd'),
(4,8,3,'2019-2-6','asdasda'),
(4,9,3,'2019-2-6','asdasd'),
(6,1,3,'2019-2-6','asdsad'),
(6,2,2,'2019-2-6','asdasda'),
(6,3,3,'2019-2-6','asdasd'),
(6,6,3,'2019-2-6','asdsad'),
(6,4,3,'2019-2-6','asdad'),
(7,6,1,'2019-2-6','asdas'),
(7,3,1,'2019-2-6','asdasd'),
(7,10,3,'2019-2-6','asdasd'),
(7,4,3,'2019-2-6','asdad'),
(8,1,2,'2019-2-6','asdasasd'),
(8,2,3,'2019-2-6','asdasd'),
(8,7,3,'2019-2-6','asdasd');


--b) 	Specify name, email and department name of the employees that have been working at least six months.

-- SELECT DATEDIFF(month,StartDate,GETDATE()) FROM Employee

SELECT  EE.EmpName,EE.Email, DP.DeptName FROM Employee EE JOIN Department DP on EE.DeptNo=DP.DeptNo 
WHERE  DATEADD(MONTH,-6,GETDATE())>= EE.StartDate



--c) c.	Specify the names of the employees whore have either ‘C++’ or ‘.NET’ skills.

SELECT EP.EmpName FROM Employee EP 
JOIN Emp_Skill ES ON EP.EmpNo=ES.EmpNo 
JOIN Skill SK ON ES.SkillNo=SK.SkillNo 
WHERE SK.SkillName in ('C++','.NET')

-- d) 	List all employee names, manager names, manager emails of those employees

SELECT E1.EmpName,E2.EmpName as 'Manager Name' ,E2.Email as 'Manager Email' FROM Employee E1 JOIN Employee E2 ON E1.MgrNo=E2.EmpNo;

-- e)  Specify the departments which have >=2 employees, print out the list of departments’ employees right after each department

SELECT D.DeptName, STRING_AGG(trim(EmpName), ', ') AS ListEM
FROM Employee  AS E
JOIN Department AS D
ON E.DeptNo = D.DeptNo
WHERE d.DeptNo
IN ( SELECT D.DeptNo
FROM Employee AS E
JOIN Department AS D
ON E.DeptNo = D.DeptNo
GROUP BY D.DeptNo
HAVING COUNT(E.EmpNo) >= 2)
GROUP BY D.DeptName





-- f)  List all name, email and skill number of the employees and sort ascending order by employee’s name. 

 SELECT  EP.EmpName,EP.Email,count(SK.SkillNo) AS NumberOfSkill FROM Employee EP 
 JOIN Emp_Skill ES ON EP.EmpNo=ES.EmpNo 
 JOIN Skill SK ON ES.SkillNo=SK.SkillNo
 GROUP BY  EP.EmpName,EP.Email,EP.EmpNo

 --g) Create a view to list all employees are working (include: name of employee and skill name, department name).
 CREATE VIEW view_employee AS
 SELECT  EM.EmpName,SK.SkillName,DP.DeptName FROM Employee EM
 JOIN Emp_Skill ES ON EM.EmpNo = ES.EmpNo
 JOIN Skill SK ON ES.SkillNo = SK.SkillNo
 JOIN Department DP ON EM.DeptNo=DP.DeptNo
 WHERE Status=1



