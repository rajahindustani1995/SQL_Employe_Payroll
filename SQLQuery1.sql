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