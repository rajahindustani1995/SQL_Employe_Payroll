---------Employee Payroll DataBase------------
---------UC1-Create Payroll Database----------
create database Payroll_Service;

use Payroll_Service;

----------UC2-Create a Table Employee_Payroll-------
Create Table Employee_Payroll (
	Id int identity(1,1) primary key,
	Name varchar(200), 
	Salary float,
	StartDate datetime, 
);

--UC3-insert into database
INSERT INTO employee_payroll(Name,Salary,startDate)
VALUES ('Gitesh', 38000,'2010-05-08'),
('Ashish', 34000,'2004-02-05'),
('Vikram', 50000, '2020-07-09'),
('Pooja', 45000, '2021-04-05'),
('Archana', 49000, '2019-04-05');