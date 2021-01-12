zCREATE DATABASE [DMS1]
USE DMS1
GO 
/****** Object:  Table [dbo].[EMPMAJOR]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPMAJOR](
	[emp_no] [char](6) NOT NULL,
	[major] [char](3) NOT NULL,
	[major_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[major] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMP]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMP](
	[emp_no] [char](6) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[dept_no] [char](3) NOT NULL,
	[job] [varchar](50) NULL,
	[salary] [money] NOT NULL,
	[bonus] [money] NULL,
	[ed_level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPT](
	[dept_no] [char](3) NOT NULL,
	[dept_name] [varchar](50) NOT NULL,
	[mgn_no] [char](6) NULL,
	[admr_dept] [char](3) NOT NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPPROJACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPPROJACT](
	[emp_no] [char](6) NOT NULL,
	[proj_no] [char](6) NOT NULL,
	[act_no] [int] NOT NULL,
 CONSTRAINT [PK_EPA] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[proj_no] ASC,
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT](
	[act_no] [int] NOT NULL,
	[act_des] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Dept]    Script Date: 06/01/2015 17:22:33 ******/


/****** Object:  ForeignKey [FK__EMP__dept_no__3E52440B]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMP]  WITH CHECK ADD FOREIGN KEY([dept_no])
REFERENCES [dbo].[DEPT] ([dept_no])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK_Major]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPMAJOR]  WITH CHECK ADD  CONSTRAINT [FK_Major] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPMAJOR] CHECK CONSTRAINT [FK_Major]
GO
/****** Object:  ForeignKey [FK_EPA1]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA1] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA1]
GO
/****** Object:  ForeignKey [FK_EPA2]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA2] FOREIGN KEY([act_no])
REFERENCES [dbo].[ACT] ([act_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA2]
GO

-- Câu 1 : Add at least 8 records into each created tables.

INSERT INTO DEPT VALUES
('D01','Department 1','NV01','01','17 hight way street'),
('D02','Department 2','NV02','01','23 kinomo hi'),
('D03','Department 3','NV03','02','56 tran thi ly'),
('D04','Department 4','NV04','03','23 moneasc sea'),
('D05','Department 5',null,'04','17 killae khi'),
('D06','Department 6',null,'03','25 fkuw kigams'),
('D07','Department 7',null,'02','89 sroqssd'),
('D08','Department 8',null,'01','34 trussiicx'),
('D09','Department 9',null,'03','75 truasjjcmsa')

INSERT INTO EMP VALUES
('NV01','Quang','Trung','D01','Manager',10000,2000,1),
('NV02','Hoang','Gia','D02','thu ky',20000,300,2),
('NV03','Quach','Tuyen','D03','bao ve',17000,200,1),
('NV04','Ly','Hoang','D04','ngoi choi',18000,900,2),
('NV05','Quang','Trung','D01','hoang',5200,800,2),
('NV06','Nhan','Ngu','D01','an choi',42032,500,3),
('NV07','Kiem','Hoan','D03','cai bd',54000,2000,1),
('NV08','Cha','Ngu','D04','teacher',12000,4000,2),
('NV09','Trung','Qua','D02','teacher',32000,1000,3),
('NV10','Hoan','Emap','D03','mentor',21000,22000,1),
('NV11','Ngu','Hoc','D02','manager',32000,5000,3),
('NV12','Chac','Qua','D04','doctor',213400,2000,2),
('NV13','Hod','R','D02','blah',1231000,2000,1);

INSERT INTO EMPMAJOR VALUES
('NV01','MJ1','Lanh dao'),
('NV02','MJ1','Choi '),
('NV01','MJ2','Mua duong dai'),
('NV03','MJ3','Unknonw'),
('NV04','MJ4','What the hell'),
('NV05','MJ5','Whap sup'),
('NV06','MJ5','leu leu'),
('NV07','MJ1','ahihi'),
('NV02','MAT','Math'),
('NV02','CSI','Computer Science'),
('NV04','CSI','Computer Science');


INSERT INTO ACT VALUES
(1,'Ke toan'),
(2,'Ngoi choi'),
(3,'Bao ve'),
(4,'Bao ke'),
(5,'Chi dao'),
(6,'Hoang can'),
(7,'Tinh toan'),
(8,'Thu Ngan')

INSERT INTO EMPPROJACT VALUES
('NV01','PJ01',2),
('NV02','PJ01',3),
('NV01','PJ02',1),
('NV03','PJ03',3),
('NV04','PJ04',4),
('NV05','MJ05',5),
('NV06','MJ05',1),
('NV07','MJ06',4),
('NV01','MJ07',2),
('NV02','MJ08',4),
('NV01','MJ01',2),
('NV03','MJ04',1),
('NV04','MJ05',1),
('NV05','MJ02',3),
('NV06','MJ07',6),
('NV07','MJ06',7)

-- Câu 2 Find employees who are currently working on a project or projects. Employees working on projects will have a row(s) on the EMPPROJACT table.

SELECT DISTINCT e.* FROM EMP e
JOIN EMPPROJACT ep ON e.emp_no=ep.emp_no

-- Câu 3 Find all employees who major in math (MAT) and computer science (CSI).
SELECT* FROM EMP
WHERE emp_no IN (
SELECT e.emp_no  FROM EMP e
JOIN EMPMAJOR em ON e.emp_no=em.emp_no where em.major ='MAT' or em.major = 'CSI' 
GROUP BY e.emp_no
HAVING count(distinct em.major_name) = 2
)

-- Câu 4 d.	Find employees who work on all activities between 90 and 110.

--


