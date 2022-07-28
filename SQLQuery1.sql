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

 -------UC5-Retrieve Salary and Date ------------
select Salary from employee_payroll where Name='Vikram' or Id='3';
--------Retrieve records based on date range-------
select * from Employee_Payroll where StartDate between cast ('2019-01-01' as date) and GETDATE();

--------UC6-Add gender Table in Employee_Payroll 
alter table Employee_Payroll add Gender char(1);
update Employee_Payroll set Gender = 'M' where Id in (1,2,3);
update Employee_Payroll set Gender = 'F' where Id in (4,5);
select * from Employee_Payroll;

---------UC7-Find sum, average, min, max of salary and number of male and female of employees-------

select Gender, sum(Salary) as "Sum_Salary" from Employee_Payroll group by Gender;

select Gender, avg(Salary) as "Average_Salary" from Employee_Payroll group by Gender;

select Gender, min(Salary) as "Lowest_Salary" from Employee_Payroll group by Gender;

select Gender, max(Salary) as "Highest_Salary" from Employee_Payroll group by Gender;

select Gender, count(*) as "Count" from Employee_Payroll group by Gender;

---------UC8- Extend Employee_Payroll to Phone, Address and Department-------
alter table Employee_Payroll add Phone bigint;

alter table Employee_Payroll add Address varchar(300) default 'Mumbai';

alter table Employee_Payroll add Department varchar(100) not null default 'Testing';

update Employee_Payroll
set Phone = 9876542336, Address = 'Bangaluru', Department = 'HR'
where name = 'Gitesh';

update Employee_Payroll
set Phone = 9875915873, Address = 'Pune', Department = 'IT'
where name = 'Ashish';

update Employee_Payroll
set Phone = 9875945610, Address = 'Pune', Department = 'IT'
where name = 'Pooja';

update Employee_Payroll
set Phone = 9875913329, Address = 'Mumbai', Department = 'Marketing'
where name = 'Vikram';

update Employee_Payroll
set Phone = 9874114536, Address = 'Bangaluru'
where name = 'Archana';

select * from Employee_Payroll;

------UC9-Extend table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay------
exec sp_rename 'Employee_Payroll.Salary','Basic_pay','column';
alter table Employee_Payroll add Deductions float, Taxable_Pay float ,Net_pay float ,Income_Tax float
update Employee_Payroll set Deductions = 100, Taxable_Pay = 1000, Income_Tax = (0.12)*Basic_pay where name = 'Gitesh';

update Employee_Payroll set Deductions = 100, Taxable_Pay = 1000, Income_Tax = (0.14)*Basic_pay where name = 'Ashish';

update Employee_Payroll set Deductions = 100, Taxable_Pay = 1000, Income_Tax = (0.15)*Basic_pay where name = 'Vikram';

update Employee_Payroll set Deductions = 100, Taxable_Pay = 1000, Income_Tax = (0.14)*Basic_pay where name = 'Pooja';

update Employee_Payroll set Deductions = 100, Taxable_Pay = 1000, Income_Tax = (0.16)*Basic_pay where name = 'Archana';

update Employee_Payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
select * from Employee_Payroll;

--------UC10-One employee works in two different departments --------
insert into Employee_Payroll (Name, Basic_Pay, StartDate, Gender, Phone, Address, Department, Deductions, Taxable_Pay, Income_Tax,Net_Pay)
values ('Vikram', 50000, '2020-07-09', 'M', 9875913329, 'Bangalore', 'IT',100.00, 1000.00, 7500.00,00.00);
update employee_payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax); 
