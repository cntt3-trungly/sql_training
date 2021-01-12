use master
go
create database PMS
use PMS
go

CREATE TABLE MEMBERS(
        member_id nvarchar (10) NOT NULL,
		last_name nvarchar(30) NOT NULL,
		first_name nvarchar(50) NOT NULL,
		phone_number nvarchar(10) NOT NULL,
		birthday date NOT NULL,
		email nvarchar (50) NOT NULL,
constraint pk_member_id PRIMARY KEY (member_id),
constraint ck_phone_number check(phone_number not like '%[^0-9]%'),
constraint ck_birthday check(datediff(year,birthday,getdate())>=18)
                    )
CREATE TABLE PROJECTS(
        projects_id nvarchar (10) NOT NULL,
		projects_name nvarchar(50) NOT NULL,
		start_date date NOT NULL,
		end_date date  NOT NULL,
		description nvarchar(200) NOT NULL,
constraint pk_projects_id PRIMARY KEY (projects_id),
constraint ck_end_date check(datediff(day,start_date,end_date)>0)
                    )
CREATE TABLE ROLES(
        roles_id nvarchar (10) NOT NULL,
		roles_name nvarchar(30) NOT NULL,
constraint pk_roles_id PRIMARY KEY (roles_id)
                    )
CREATE TABLE PROJECT_MEMBERS(
		id varchar(10) NOT NULL,
		projects_id nvarchar(10) NOT NULL,
		member_id nvarchar(10) NOT NULL,
		roles_id nvarchar(10) NOT NULL,
		join_date date NOT NULL,
		leave_date date NOT NULL,
constraint pk_id PRIMARY KEY (id),
constraint fk_projects_id Foreign key (projects_id) References PROJECTS(projects_id),
constraint fk_member_id Foreign key (member_id) REFERENCES MEMBERS (member_id),
CONSTRAINT fk_roles_id foreign key (roles_id) REFERENCES ROLES (roles_id),
constraint ck_leave_date check(datediff(day,join_date,leave_date)>0)
         )

Insert MEMBERS
values
('MID01',N'Nguyễn Thị',N'Lan','0123456789','1997-1-1','nguyenlan11@gmail.com'),
('MID02',N'Huỳnh Thị',N'Vân','0123456788','1994-11-10','huynhvan1110@gmail.com'),
('MID03',N'Nguyễn Văn',N'Nam','0123456787','1996-8-16','nguyennam168@gmail.com'),
('MID04',N'Nguyễn Thị',N'Hòa','0123456786','1993-12-1','nguyenhoa112@gmail.com'),
('MID05',N'Trần Thị',N'Thảo','0123456784','1992-6-26','tranthao266@gmail.com')
select * from MEMBERS
insert PROJECTS
values 
('PID01',N'Đồ họa','2015-4-6','2015-11-2',N'Thành công'),
('PID02',N'Thiết kế wed','2016-10-26','2016-12-12',N'Thành công'),
('PID03',N'Đồ họa photoshop','2014-5-6','2015-11-20',N'Chưa Thành công'),
('PID04',N'Quản trị mảng','2018-4-16','2019-8-10',N'Thành công'),
('PID05',N'Phát triển game','2017-4-6','2018-3-28',N'Chưa Thành công')
select *from PROJECTS
insert ROLES
values
('RID01','Developer'),
('RID02','Tester'),
('RID03','Manager'),
('RID04',N'Lập trình viên'),
('RID05',N'Thành viên')
select *from ROLES
insert PROJECT_MEMBERS
values
('ID01','PID02','MID01','RID02','2016-10-30','2016-12-31'),
('ID02','PID01','MID03','RID01','2015-5-2','2015-10-25'),
('ID03','PID04','MID02','RID03','2018-4-24','2019-8-1'),
('ID04','PID03','MID05','RID04','2014-5-30','2015-10-10'),
('ID05','PID05','MID04','RID05','2017-4-25','2018-2-26')
select*from PROJECT_MEMBERS
--câu1:Hiển thị danh sách thông tin của các thành viên có tham gia ít nhất 1 dự án
select *
from MEMBERS
where member_id in(select member_id from PROJECT_MEMBERS)
--câu2:Hiển thị danh sách thông tin của thành viên không tham gia bất kì dự án nào
select *
from MEMBERS
where member_id  not in(select member_id from PROJECT_MEMBERS)
--câu3:Thống kê số lượng của từng vị trí các dự án trong 2 năm trước
select projects_id as DA,COUNT(projects_id) as 'So luong'
from PROJECTS
WHERE DATEDIFF(YEAR,end_date,GETDATE())=2
group by projects_id
order by 'So luong' DESC
--câu4:Hiển thị ra những dự án sẽ kết thúc trong vòng 1 năm tới
select*from PROJECTS
where DATEDIFF(YEAR,GETDATE(),end_date)=1
--câu5:Hiển thị ra những dự án có thời gian bắt đầu và kết thúc không quá 2 năm
select*From PROJECTS
Where DATEDIFF(Day,start_date,end_date)<=2*365
--câu6:Hiển thị danh sách thông tin của các thành viên có tham gia ít nhất 1 dự án, sắp xếp danh sách theo alphabet tăng dần. Trong đó cột Name (tên) sẽ được ghép bởi họ (last name) và tên (first name). Ví dụ: First name là “Nam”, last name là “Nguyễn” thì cột Name sẽ hiển thị: “Nam Nguyễn”
select *
from MEMBERS
where member_id in(select member_id from PROJECT_MEMBERS)
order by first_name,last_name
--câu7:Cho biết mã và tên các dự án được bắt đầu trong năm nay và có số lượng thành viên tham gia nhiều hơn 3 người.
select projects_id as N'Mã dự án',projects_name as N'Tên dự án'
from Projects
where projects_id in 
		  ( select projects_id 
			from project_members
			where projects_id in(select projects_id
								from Projects
								where YEAR(start_date) = YEAR(GETDATE())
								) 
			group by projects_id
			having COUNT(projects_id)>=3
			)
--câu8:Cho biết thông tin của những thành viên đã từng làm các dự án ở vai trò Manager
select *from ROLES
WHERE roles_name in (select roles_name from ROLES
					where roles_name='Manager'
					)
--câu9:Cho biết mã và tên của các dự án được hoàn thành trong thời gian không quá 2 năm
 select projects_id as N'Mã dự án',projects_name as N'Tên dự án'
from Projects
where projects_id in(select projects_id
				from Projects
				where DATEDIFF(Day,end_date,start_date)<=2*365
					)
--câu10:Cho biết số người tham gia của từng dự án
select projects_id ,COUNT (projects_id)
from PROJECT_MEMBERS
GROUP BY projects_id
--caau11-Thực hiện thêm vào mô tả dòng “ Đã Hoàn Thành” của những dự án có end_date nhỏ hơn ngày hiện tại	        
--cau12: Cho biết mã và tên của dự án nào có số lượng thành viên tham gia nhiều nhất
select projects_id as N'Mã dự án',projects_name as N'Tên dự án'
from Projects
where projects_id in 
		  ( select  projects_id 
			from PROJECT_MEMBERS
			group by projects_id
			having count(projects_id)=(select Top(1) count(projects_id)
			from PROJECT_MEMBERS
			group by projects_id
			order by 
			[projects_id] desc
			)
		 )
--Câu 13: Cho biết thông tin của nhân viên nào có tổng số lượng ngày làm lớn nhất của tất cả các dự án

      select member_id,projects_id
	  from PROJECT_MEMBERS 
	  
			
			
					    
