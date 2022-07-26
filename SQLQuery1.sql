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

--------UC3-Insert into Database------------------
INSERT INTO employee_payroll(Name,Salary,startDate)
VALUES ('Gitesh', 38000,'2010-05-08'),
('Ashish', 34000,'2004-02-05'),
('Vikram', 50000, '2020-07-09'),
('Pooja', 45000, '2021-04-05'),
('Archana', 49000, '2019-04-05');

--------UC4-Retrieve all the Data from the Table---------
select * from Employee_Payroll;
select Id,Name from Employee_Payroll;

 -------UC5-Retrieve Sallary and Date ------------
select Salary from employee_payroll where Name='Vikram' or Id='3';
--------Retrieve records based on date range-------
select * from Employee_Payroll where StartDate between cast ('2019-01-01' as date) and GETDATE();

--------UC6-Add gender Table in Employee_Payroll 
alter table Employee_Payroll add Gender char(1);
update Employee_Payroll set Gender = 'M' where Id in (1,2,3);
update Employee_Payroll set Gender = 'F' where Id in (4,5);
select * from Employee_Payroll;