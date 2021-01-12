use master
go

CREATE DATABASE QUANLIDUAN

use QUANLIDUAN
go

CREATE TABLE MEMBER (
member_id Nvarchar(10) NOT NULL,
last_name Nvarchar(30) NOT NULL,
first_name Nvarchar(50) NOT NULL,
phone_number Nvarchar(10) NOT NULL,
birthday date NOT NULL,
email Nvarchar(50) NOT NULL,
CONSTRAINT pk_member_id PRIMARY KEY (member_id),
CONSTRAINT ck_phone_number
check (phone_number not like '%[^0-9]%'),
CONSTRAINT ch_birthday
check (DATEDIFF(DAY,birthday,getdate())>=18*365)--ràng buộc ngày sinh phải thỏa mản đủ 18 tuổi
)

CREATE TABLE Projects(
project_id Nvarchar(10) NOT NULL,
project_name Nvarchar(50) NOT NULL,
starts_date date NOT NULL,
end_date  date NOT NULL,
descriptions Nvarchar(200) NOT NULL,
CONSTRAINT pk_project_id PRIMARY KEY(project_id),
CONSTRAINT ck_end_date
check(end_date>starts_date)
)

CREATE TABLE roles(
role_id Nvarchar(10) NOT NULL,
role_name Nvarchar(30) NOT NULL,
CONSTRAINT pk_role_id PRIMARY KEY(role_id)
)

CREATE TABLE project_members(
id Nvarchar(10) NOT NULL,
project_id Nvarchar(10) NOT NUll,
member_id Nvarchar(10) NOT NULL,
role_id Nvarchar(10) NOT NULL,
join_date date NOT NULL,
leave_date date NOT NULL,
CONSTRAINT pk_id PRIMARY KEY(id),
CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES projects(project_id),
CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES member(member_id),
CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES roles(role_id),
CONSTRAINT ch check(leave_date>join_date)
)

INSERT MEMBER
values
('M001',N'Nguyễn Văn',N'An','1234567890','1998-10-2','nguyenvanan@gmail.com'),
('M002',N'Võ Văn',N'Bình','0912345679','1997-05-27','vovanbinh@gmail.com'),
('M003',N'Bùi Văn',N'Kiên','0912345680','2000-08-19','buivanki@gmail.com'),
('M004',N'Nguyễn Ngọc',N'Trâm','0912345681','1997-11-14','nguyenngoctram@gmail.com'),
('M005',N'Huỳnh Bảo',N'Ngọc','0912345682','1999-03-30','huynhbaongoc@gmail.com')
select*from MEMBER
INSERT Projects
values 
('P001',N'GAMES','2015-05-11','2015-12-12',N'Hoàn thành'),
('P002',N'PHOTOSHOP','2016-10-13','2017-06-14',N'Hoàn thành'),
('P003',N'WEB','2018-02-13','2019-12-13',N'chưa hoàn thành'),
('P004',N'PHẦN MỀM','2017-01-05','2018-05-20',N'chưa hoàn thành'),
('P005',N'HỆ ĐIỀU HÀNH','2017-02-16','2017-09-20',N'Hoàn thành')
SELECT *FROM Projects

INSERT ROLES
values 
('R001','Developer'),
('R002','Manager'),
('R003','Tester'),
('R004','Programer'),
('R005','Worker')
select *from roles
INSERT project_members
values
('PM001','P002','M003','R001','2015-05-11','2015-08-12'),
('PM002','P001','M005','R003','2016-01-11','2016-05-12'),
('PM003','P003','M002','R005','2018-02-14','2019-11-13'),
('PM004','P004','M001','R003','2017-02-15','2017-04-15'),
('PM005','P001','M002','R004','2017-04-16','2017-08-20')
select *from project_members
--Câu 1: Hiển thị danh sách thông tin của các thành
--viên có tham gia ít nhất 1 dự án

select*
from MEMBER
where member_id in (select member_id
                    from project_members
					);
--Câu 2: Hiển thị danh sách thông tin của thành viên
--không tham gia bất kì dự án nào
select*
from MEMBER
where member_id not in (select member_id
                    from project_members
					);

--Câu 3: Thống kê số lượng của từng vị trí các dự án
--trong 2 năm trước
select project_id as MaDA,COUNT(project_id) as 'So luong'
from Projects
where (DATEDIFF(DAY,end_date,GetDATe())>=2*365)
Group by project_id
order by 'So luong' DESC

--Câu 4: Hiển thị ra những dự án sẽ kết thúc trong vòng 1 năm tới
select *
from Projects
where (DATEDIFF(DAY,GETDATE(),end_date)>=365)

--Câu 5: Hiển thị ra những dự án có thời gian bắt đầu và kết thúc không quá 2 năm
select *
from Projects
where (DATEDIFF(DAY,end_date,starts_date)<=2*365)

--Câu 6: Hiển thị danh sách thông tin của các thành viên có tham gia ít nhất 1 dự án, sắp xếp danh sách 
--theo alphabet tăng dần. Trong đó cột Name (tên) sẽ được ghép bởi họ (last name) và tên (first name). Ví
--dụ: First name là “Nam”, last name là “Nguyễn” thì cột Name sẽ hiển thị: “Nam Nguyễn”
select member_id,first_name+' '+ last_name as 'Name',phone_number,birthday
from MEMBER
where member_id in (select member_id
                    from project_members)
order by 'Name' ASC

--Câu 7: Cho biết mã và tên các dự án được bắt đầu trong năm nay và có số lượng thành viên tham gia nhiều hơn 3 người.
INSERT project_members
values
('PM006','P003','M003','R001','2018-05-11','2019-08-12'),
('PM007','P003','M002','R005','2018-02-14','2019-11-13'),
('PM008','P003','M002','R005','2018-02-14','2018-05-12')
select project_id as N'Mã đề án',project_name as N'Tên đề án'
from Projects
where project_id in 
		  ( select project_id 
			from project_members
			where project_id in(select project_id
								from Projects
								where YEAR(starts_date) = YEAR(GETDATE())
								) 
			group by project_id
			having COUNT(project_id)>=3
			)

--Câu 8:Cho biết thông tin của những thành viên đã từng làm các dự án ở vai trò Manager
select *
from MEMBER
where member_id in (select member_id
                    from project_members
					where role_id in (select role_id
					                  from roles
									  where role_name like 'Manager'
									  )
					)

--Câu 9:Cho biết mã và tên của các dự án được hoàn thành trong thời gian không quá 2 năm
select project_id as N'Mã DA',project_name as N'Tên DA'
from Projects
where project_id in ( select project_id
                      from project_members
					  where (DATEDIFF(DAY,join_date,leave_date)<=2*365)
					  )	
					  
--Câu 10: Cho biết số người tham gia của từng dự án	

   select project_id as N'Mã DA',COUNT(project_id) as N'Số người tham gia'
   from project_members
   group by project_id

--Câu 11: Thực hiện thêm vào mô tả dòng “ Đã Hoàn Thành” của những dự án có end_date nhỏ hơn ngày hiện tại	
   update Projects
   set 	descriptions = N'Đã hoàn thành'
   where project_id in (select p.project_id
                        from Projects p
						where end_date < getdate()
						);
   
--Câu 12: Cho biết mã và tên của dự án nào có số lượng thành viên tham gia nhiều nhất
	select project_id as N'Mã DA',project_name as N'Tên DA'
	from Projects
	where project_id in (
	     select project_id
		 from project_members
		 group by project_id
		 having count(project_id)=( 
			   select top(1) COUNT(project_id) as SoluongTV
			   from project_members
			   group by project_id
			   order by SoluongTV DESC
			   )
		)

--Câu 13: Cho biết thông tin của nhân viên nào có tổng số lượng ngày làm lớn nhất của tất cả các dự án
select *
from MEMBER
where member_id in(
	select member_id
	from project_members
	group by member_id
	having SUM(DATEDIFF(DAY,join_date,leave_date)) = (
		select top(1) SUM(DATEDIFF(DAY,join_date,leave_date)) as SoNgay
		from project_members
		group by member_id
		order by COUNT(member_id) DESC
		)
		)


--Câu 14: Cho biết thông tin của nhân viên nào đã tham gia từ 2 dự án trở lên
select *
from MEMBER
where member_id in(	
	select member_id
	from project_members
	group by member_id
	having COUNT(member_id)>=2
	)


--Câu 15: Cho biết thông tin của những dự án có start_date trong năm ngoái
select*
from Projects 
where YEAR(starts_date)=2017 

--Câu 16:Cho biết có bao nhiêu dự án có start_date nằm trong quý 2
select COUNT(project_id) as N'So DA Quý 2'
from Projects
group by starts_date
having DATEPART(QUARTER,starts_date)=2;

--Câu 17: Cho biết số lượng các dự án đc bắt đầu trong từng quý

select DATEPART(QUARTER,starts_date) as N'Quý',COUNT(DATEPART(QUARTER,starts_date)) as N'Số DA'
from Projects
group by DATEPART(QUARTER,starts_date)

--Câu 18: Cho biết số lượng các quý mà có ngày sinh của nhân viên nằm trong quý đó
select DATEPART(QUARTER,birthday) as N'Quý',COUNT(member_id) as N'Số NV'
from MEMBER
group by DATEPART(QUARTER,birthday)
order by Quý ASC
	
--Câu 19: Cho biết số dự án kết thúc của từng quý
select DATEPART(QUARTER,end_date) as N'Quý',COUNT(DATEPART(QUARTER,end_date)) as N'Số DA'
from Projects
where end_date<getdate()
group by DATEPART(QUARTER,end_date)

--Câu 20:Thống kê số lượng dự án của từng quý được khởi công trong năm ngoái
select DATEPART(QUARTER,starts_date) as N'Quý',COUNT(DATEPART(QUARTER,starts_date)) as N'Số DA'
from Projects
where YEAR(starts_date)=2017
group by DATEPART(QUARTER,starts_date)	