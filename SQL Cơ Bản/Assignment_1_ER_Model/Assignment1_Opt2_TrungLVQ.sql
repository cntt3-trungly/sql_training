CREATE DATABASE EmployeeManagementSystem;
USE EmployeeManagementSystem
CREATE TABLE EMPLOYEE(
EmpNo int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
EmpName varchar(50),
BirthDay date,
DeptNO int NOT NULL,
--CONSTRAINT FK_EmpDept FOREIGN KEY (DeptNo)REFERENCES DEPARTMENT(DeptNo),
MgrNo int NOT NULL,
StartDate datetime,
Salary money,
Level int , CONSTRAINT Level CHECK (Level BETWEEN 1 AND 7),
Status int,CONSTRAINT Status CHECK (Status BETWEEN 0 AND 2),
Note text
);

 

CREATE TABLE SKILL(
SkillNo int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
SkillName varchar(50),
Note text
);
CREATE TABLE DEPARTMENT(
DeptNo int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
DeptName varchar(50),
Note text
);
CREATE TABLE EMP_SKILL(
SkillNo int NOT NULL,
CONSTRAINT FK_SkillNo FOREIGN KEY (SkillNo)REFERENCES SKILL(SkillNo),
EmpNo int NOT NUll,
CONSTRAINT FK_EmpNo FOREIGN KEY (EmpNo)REFERENCES EMPLOYEE(EmpNo),
SkillLevel int,
CONSTRAINT Skilllevel CHECK (SkillLevel BETWEEN 1 AND 3),
RegDate datetime,
Description text,
PRIMARY KEY( SkillNo , EmpNo)
);
ALTER TABLE EMPLOYEE
ADD Email varchar(255) UNIQUE;

 

ALTER TABLE EMPLOYEE
ADD CONSTRAINT emp
DEFAULT '0' FOR MgrNo;

 

ALTER TABLE EMPLOYEE
ADD CONSTRAINT empstatus
DEFAULT '0' FOR Status;

 

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EmpDept FOREIGN KEY (DeptNo)REFERENCES DEPARTMENT(DeptNo);

 

ALTER TABLE EMP_SKILL
DROP COLUMN Description ;

 

INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,StartDate,Salary,Level,Note,Email)
VALUES ('Van A', '12-30-1997', '5', '12-30-2020', '100000', '7','', 'value1'),
        ('Van B', '12-30-1997', '4', '10-30-2020', '200000', '5','', 'value2'),
        ('Van C', '12-30-1997', '3', '11-30-2020', '3000000', '4','', 'value3'),
        ('Van D', '12-30-1997', '2', '12-13-2020', '8000000', '3', '','value4'),
        ('Van E', '12-30-1997', '1', '12-15-2020', '999999', '1', '','value5')
;

 

INSERT INTO SKILL (SkillName,Note)
VALUES ('JAVA', ''),
        ('PHP', ''),
        ('C#', '' ),
        ('C++', '' ),
        ('HTML/CSS', '' )
;

 

INSERT INTO DEPARTMENT(DeptName,Note)
VALUES ('BAN A', 'value1'),
        ('BAN B', 'value2'),
        ('BAN C', 'value2' ),
        ('BAN D', 'value2' ),
        ('BAN E', 'value2' )
;
INSERT INTO EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate)
VALUES ('1', '1','3', '12-30-2018'),
        ('2', '1','3', '12-30-2018'),
        ('3', '2','2', '12-30-2019'),
        ('4', '3','2', '12-30-2019'),
        ('5', '4','1', '10-30-2020')
;

 

CREATE VIEW [EMPLOYEE_TRACKING] AS
SELECT EmpNo, EmpName AS Emp_Name, Level
FROM EMPLOYEE
WHERE Level<='5' AND Level >='3'
 ;