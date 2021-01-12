CREATE DATABASE MovieCollection;
--create table

 USE MovieCollection

CREATE TABLE Movie(
Id_movie nvarchar(50) primary key not null,
Movie_name varchar(50),
Duration decimal(5,2),
Gerne int, check (Gerne BETWEEN 1 and 8),
Director varchar(50),
Money decimal(19,4),
Comment text
);

 

CREATE TABLE Actor(
Id_actor nvarchar(50) primary key not null,
Actor_name varchar(50),
Age int,
Avr_salary decimal(19,4),
Nationality nvarchar(50)
);

 

CREATE TABLE ActedIn(
Id_movie nvarchar(50),
Id_actor nvarchar(50),
Comment text,
Primary Key(Id_movie,Id_actor),
Constraint fk_Mov Foreign Key(Id_movie) References Movie(Id_movie),
Constraint fk_Act Foreign Key(Id_actor) References Actor(Id_actor)
);

 
--Add an ImageLink field
ALTER TABLE Movie
ADD Imagelink varchar(255) UNIQUE;


--INSERT statement


INSERT INTO Movie(Id_movie,Movie_name,Duration,Gerne,Director,Money,Comment,Imagelink)
VALUES('01','Phim A','180','1','MR. A','50000','','a'),
        ('02','Phim B','120','4','MR. B','25000','','b'),
        ('03','Phim C','90','3','MR. C','15000','','c'),
        ('04','Phim D','180','5','MR. D','40000','','d'),
        ('05','Phim E','180','7','MR. E','54000','','e');

 

INSERT INTO Actor
VALUES('01','Nguyen a','20','5000','vietnam'),
    ('02','Nguyen b','22','4000','vietnam'),
    ('03','Nguyen r','23','5400','vietnam'),
    ('04','Nguyen e','25','3500','vietnam'),
    ('05','Nguyen d','51','2900','vietnam');

 

INSERT INTO ActedIn
VALUES
('01','02',''),
('02','01',''),
('04','01',''),
('03','05',''),
('05','04',''),
('01','03',''),
('01','04',''),
('01','05','');
 

--UPDATE statement
UPDATE Actor
SET Actor_name='Nguyen z'
WHERE Id_actor='03';

 

--the Actor table for actors that are older than 50
SELECT * FROM Actor
WHERE Age>50;

 

--actor names and average salaries from ACTOR and sort the results by average salary.
SELECT Actor_name, Avr_salary
FROM Actor 
ORDER BY Avr_salary;

 

--retrieve the names of all the movies that the actor has acted in.
SELECT m.Movie_name as movie_nguyena
FROM Movie m 
JOIN ActedIn ae
ON m.Id_movie=ae.Id_movie 
JOIN Actor a
ON a.Id_actor=ae.Id_actor
WHERE a.Actor_name like N'Tô %'
;

 

 --the names of all the action movies that amount of actor be greater than 3
SELECT m.Movie_name
FROM Movie m JOIN ActedIn ae ON m.Id_movie=ae.Id_movie
WHERE m.Gerne='1'
GROUP BY m.Movie_name
HAVING COUNT(ae.Id_actor)>3;
 