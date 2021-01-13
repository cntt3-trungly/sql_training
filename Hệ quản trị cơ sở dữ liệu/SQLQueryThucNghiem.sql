/*--------------- Insert Dish to Database----------------*/

/*First insert Knot TYP_type*/

select * from dbo.TYP_Type



insert into dbo.TYP_Type(TYP_ID,TYP_Type,Metadata_TYP) values (1,'appetizer',1)
insert into dbo.TYP_Type(TYP_ID,TYP_Type,Metadata_TYP) values (2,'main',2)
insert into dbo.TYP_Type(TYP_ID,TYP_Type,Metadata_TYP) values (3,'dessert',3)

/*Insert dish*/
select * from lDI_Dish

insert into lDI_Dish (Metadata_DI,DI_NAM_Dish_Name,DI_PRI_Dish_Price,DI_TYP_TYP_ID)
values 
(1,'Phở',22,2),
(2,'Bánh canh',33,1),
(3,'Corsica',12,2),
(4,'Burgundy',12,1),
(5,'Franche-Comté',13,3),
(6,'Poitou-Charentes',27,2),
(7,'Limousin',25,1),
(8,'Salade niçoise',28,1),
(9,'Bourride de fruits de mer',20,3),
(10,'Pieds paquets',51,1)

--Thay đổi giá của món ăn theo ngày 
insert into dbo.lDI_Dish (DI_ID,Metadata_DI,DI_PRI_ChangedAt,DI_PRI_Dish_Price) values (2,2,'2020-7-16',100)

select * from dbo.lDI_Dish where DI_NAM_Dish_Name like '%Canh%'




--xem lịch sử thay đổi giá 
select *from dbo.pDI_Dish ('2020-7-15') where  DI_NAM_Dish_Name like '%Canh%'

select *from dbo.rDI_PRI_Dish_Price('2020-7-15') 

select *from dbo.dDI_Dish('2020-7-10','2020-7-15','DI_PRI_Dish_Price') where  DI_NAM_Dish_Name like '%Canh%'






/*test Database*/
insert into lDI_Dish (DI_ID,Metadata_DI,DI_PRI_Dish_Price,DI_PRI_ChangedAt)
values (9,2,39,'2022-2-11')

select * from dbo.pDI_Dish('2022-2-10')

select * from dbo.rDI_PRI_Dish_Price('2022-2-10')
/*--------------------------------------*/

/*---------------Insert Restaurant to Database -------------*/

/*First insert Knot CUI_Cuisine*/

select * from dbo.CUI_Cuisine 

Insert into dbo.CUI_Cuisine values 
(1,'French cuisine',1),
(2,'American cuisine',2),
(3,'VietNam cuisine',3),
(4,'Chinese cuisine',4),
(5,'Mexico cuisine',5)

/*Insert restaurant*/

select * from dbo.lRE_Restaurant 

Insert into dbo.lRE_Restaurant (Metadata_RE,RE_PHO_Restaurant_Phone,RE_ADD_Restaurant_Address,RE_NAM_Restaurant_Name,RE_CUI_CUI_ID) values
(1,'0905306110','170 Rogue Street','Mechain Restaurant',1),
(2,'7575757572','26 Knight downtown','Hightland way',3),
(3,'0903123413','39 Tôn Đức Thắng','Intercontinental',4),
(4,'1110987844','95 Huỳnh Ngọc Huệ','Nhà hàng Hải Sản',5),
(5,'9176461621','14 Trường Chinh','Discovery restaurant',1),
(6,'1189880112','26 Trần Phú','Ngon và Sạch',3),
(7,'2791111911','75 Huỳnh Ngọc Huệ','Đặc Sản Trần',2),
(8,'1239918838','26 Hải Phòng','Ông Mè',3)

/*------------------------------------------ */

/*------------------Insert Guest to Database---------------------*/
Select * from dbo.lGU_Guest

Insert into dbo.lGU_Guest (Metadata_GU,GU_NAM_Guest_Name,GU_AGE_Guest_Age,GU_ADD_Guest_Address) values 
(1,'Ly Van Quang Trung',20,'170 Huynh Ngoc Hue'),
(2,'Dinh Thi Phuong',21,'340 Ton Duc Thang'),
(3,'Huynh Thi My Kieu',22,'120 Ngo Thi Nham'),
(4,'Truong Thi Le',22,'30 Hai Phong'),
(5,'Nguyen Thi Nhat',22,'70 Be Van  Dan'),
(6,'Tran Van Anh Son',22,'25 Hoang Hoa Tham')

/*------------------Insert Consumtion To Database-----------------*/
select * from dbo.lOR_Order 

insert into dbo.lOR_Order (Metadata_OR,OR_DAT_Order_Date,OR_AMT_Order_Amount) values
(1,'2020-6-7',3),
(2,'2020-6-10',4),
(3,'2020-6-15',1),
(4,'2020-7-2',1),
(5,'2020-7-5',2),
(6,'2020-7-9',1),
(7,'2020-7-11',2),
(8,'2020-7-12',2),
(9,'2020-7-12',1),
(10,'2020-7-13',1),
(11,'2020-7-14',1),
(12,'2020-7-14',2),
(13,'2020-7-15',2),
(14,'2020-7-16',2),
(15,'2020-7-16',1),
(16,'2020-7-16',3),
(17,'2020-7-17',1),
(18,'2020-7-18',2),
(19,'2020-7-19',2),
(20,'2020-7-20',1),
(21,'2020-7-21',2),
(22,'2020-7-21',3),
(23,'2020-7-22',1),
(24,'2020-7-22',5),
(25,'2020-7-22',1),
(26,'2020-7-24',2)

/* insert tie IDI_eaten_CO_in */

select * from dbo.lDI_Dish
select * from dbo.lOR_Order

select * from dbo.lDI_eaten_OR_in

insert into lDI_eaten_OR_in  values 
(1,1,12),
(2,9,11),
(3,2,1),
(4,6,2),
(5,8,3),
(6,7,4),
(7,10,5),
(8,9,6),
(9,1,7),
(10,3,8),
(11,8,9),
(12,8,13),
(13,6,14),
(14,7,15),
(15,9,16),
(16,10,17),
(17,4,18),
(18,8,19),
(19,6,20),
(20,7,21),
(21,8,22),
(22,4,23),
(23,9,24),
(24,7,25),
(25,3,26)

select * from dbo.lOR_Order
select * from dbo.lGU_Guest
 select * from dbo.lOr_in_GU_whoate


insert into dbo.lOr_in_GU_whoate values
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,3),
(8,8,2),
(9,9,4),
(10,10,2),
(11,11,1),
(12,12,2),
(13,13,3),
(14,14,4),
(15,15,2),
(16,16,3),
(17,17,5),
(18,18,1),
(19,19,6),
(20,20,2),
(21,21,1),
(22,22,2),
(23,23,3),
(24,24,4),
(25,25,2),
(26,26,6)

select * from dbo.lRE_Restaurant
select * from dbo.lRE_location_OR_isTookat

insert into dbo.lRE_location_OR_isTookat values
(1,1,10),
(2,8,11),
(3,2,1),
(4,6,2),
(5,8,3),
(6,7,4),
(7,4,5),
(8,5,6),
(9,1,7),
(10,3,8),
(11,5,9),
(12,8,13),
(13,6,14),
(14,7,15),
(15,5,16),
(16,2,17),
(17,4,18),
(18,8,19),
(19,6,20),
(20,7,21),
(21,8,22),
(22,4,23),
(23,5,24),
(24,7,25),
(25,3,26),
(26,6,12)

select * from dbo.EXP_Expired

insert into dbo.EXP_Expired values
(1,1,1),
(0,0,2)

select * from dbo.RE_Restaurant
select * from dbo.lDI_Dish
select * from dbo.lRE_at_DI_isServed_EXP_until

insert into dbo.lRE_at_DI_isServed_EXP_until (Metadata_RE_at_DI_isServed_EXP_until,RE_ID_at,DI_ID_isServed,EXP_ID_until) values

(1,8,10,1),
(2,7,9,0),
(3,6,8,1),
(4,6,7,0),
(5,5,6,1),
(6,4,5,0),
(7,3,4,0),
(8,2,3,1),
(9,1,2,1),
(10,2,1,1),
(11,3,2,0),
(12,4,3,0),
(13,5,4,1),
(14,6,5,1),
(15,7,6,0),
(16,8,7,0),
(17,7,8,1),
(18,6,10,1),
(19,5,9,1),
(20,4,4,1),
(21,3,6,1),
(22,6,7,0),
(23,7,8,1),
(24,4,9,0),
(25,1,10,0)


select * from dbo.lRE_at_DI_isServed_EXP_until

insert into dbo.lRE_at_DI_isServed_EXP_until (Metadata_RE_at_DI_isServed_EXP_until,RE_ID_at,DI_ID_isServed,RE_at_DI_isServed_EXP_until_ChangedAt,EXP_ID_until) values
(1,8,10,'2020-07-16',0)

select * from dbo.pRE_at_DI_isServed_EXP_until('2020-07-14') WHERE Metadata_RE_at_DI_isServed_EXP_until=1

-- Trình loại bỏ bảng

select * from dbo.lDI_Dish

select DI_PRI_Dish_Price from dbo.lDI_Dish