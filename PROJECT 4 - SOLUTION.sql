CREATE DATABASE PROJECT4

create table Department
(
DepID int Primary Key,
DepName varchar(25) Not Null Default 'Department')
SELECT* FROM Department

Create table Employee (
EmpId int Primary Key,
EmpName varchar(100),
StartYear int,
EndYear int,
StartSalary Float,
CurrentSalary Float,
EndSalary Float,
DepId int Not Null,
FOREIGN KEY (DepID) REFERENCES Department(DepID )
)

Insert into Department values (1,'Department' ),
(2,'HR' ), (3 ,'IT' ),(4 ,'Sales' );

INSERT INTO Employee (EmpId, DepId, EmpName, StartYear, EndYear, StartSalary, 
CurrentSalary, EndSalary )
VALUES
(1,1,'Bill Gates', 2000,NULL, 310000.00, 310000.00,NULL),
(2,1,'John Lenon', 2000,NULL, 110000.00,110000.00,NULL),
(3,2,'Haily Anderson', 2010,NULL, 90000.00, 90000.00,NULL),
(4,2,'Nicolaus Michelson', 2009,NULL, 95000.00, 95000.00,NULL),
(5,2,'Rebecca Michelson', 2010,NULL, 85000.00, 85000.00,NULL),
(6,3,'Elena Gilbert', 2010,NULL, 55000.00, 55000.00,NULL),
(7,3,'John Smith', 2010,NULL, 65000.00, 65000.00,NULL),
(8,3,'Alex Red', 20013,NULL, 68000.00, 68000.00,NULL),
(9,3,'Richard Blue', 2013,NULL, 1198000.00, 1198000.00,NULL),
(10,3,'Edward Cullen', 2013,NULL, 1298000.00, 1298000.00,NULL)

SELECT*FROM Employee
SELECT*FROM Department

--TASK 1
--1. To show the names of the employees whose name starts with 'B'. 

SELECT EmpName
FROM Employee
WHERE EmpName LIKE 'B%';

--2. To show the names of the employees belonging to the department having department id 

SELECT E.EmpName, D.DepName, D.DepID
FROM Employee E INNER JOIN Department D ON E.DepId=D.DepID
GROUP BY D.DepName, E.EmpName, D.DepID
ORDER BY D.DepID

--3.To calculate the number of records in the Employee table

SELECT COUNT(*) FROM Employee

--4. . To calculate maximum StartSalary for the StartYear 2010.

SELECT MAX(StartSalary) AS MAXIMUM_START_SALARY
FROM Employee
WHERE  YEAR(STARTYEAR)= 2010

--5.To show names of the employees and their starting salary sorted by StartSalary (from 
--higher to lower) who joined after 2010 (Your output must include the employees who 
--joined in 2010 as well).

SELECT E.EmpName, E.StartSalary
FROM Employee E
WHERE StartYear> '2010'
ORDER BY E.StartSalary DESC

--6. To show a summarized StartSalary for each DepID.

SELECT  D.DepID, MAX(STARTSALARY) AS MAX_START_SALARY, MIN(STARTSALARY) AS MIN_STARTSALARY, AVG(STARTSALARY) AS AVG_STARTSALARY, SUM(STARTSALARY) AS AVG_STARTSALARY
FROM Employee E INNER JOIN Department D ON E.DepId=D.DepID
GROUP BY D.DEPID

--7. To show department names and employee names belonging in each department.

SELECT D.DepName, E.EmpName
FROM Employee E INNER JOIN Department D ON E.DepId=D.DepID
GROUP BY D.DepName, E.EmpName

--8. To show names of the employee in the following departments: HR, Sales, and IT

SELECT D.DepName , E.EmpName
FROM Employee E INNER JOIN Department D ON E.DepId=D.DepID
WHERE D.DepName IN ('HR','SALES','IT')
GROUP BY D.DepName, E.EmpName

--TASK 2

--1.Write an insert query for the following case:
--A new department "Accounting" is to be created in the department table

INSERT INTO Department VALUES ('5', 'Accounting');

--2.Write an insert query for the following case:
--New Employee "Brian Latona" joined "Sales" in 2014 with starting salary of 120000.00

INSERT INTO Employee VALUES (11, 'Brian Latona', 2014, null, 120000.00, 120000.00 ,null, 4) 

--3.Write an insert query for the following case:
--Meredith Whitney and Mario Gabelli started in 2011 with a starting salary of 350000.00 and 
--420000.00 in the department Accounting

INSERT INTO Employee VALUES (12, 'Meredith Whitney', 2011, null, 350000.00, 350000.00, null, 5), (13, 'Mario Gabelli', 2011, null, 350000.00, 350000.00, null, 5)

--4.Write an update query for the following case:
--Ms. Haily Anderson left in 2013 with an EndSalary 3000.00 greater than the CurrentSalary

UPDATE Employee
SET EndYear = 2013, EndSalary = 93000
WHERE EmpId = 3;

--5.Display Total (Summary) CurrentSalary for the department HR. Your output must include 
--existing employees only

SELECT SUM(E.CurrentSalary) AS TOTAL_HR_SALARY
FROM Employee E INNER JOIN Department D ON E.DepId=D.DepID
WHERE E.EndSalary IS NULL AND D.DepName='HR'                       

--6.Write an update query for the following case:
--6% increment is to be made to current salary for all existing employees in the department with 
--department id ‘2’

UPDATE Employee
SET CurrentSalary= CurrentSalary*1.06
WHERE DepId=2 AND EndSalary IS NULL

--7.Write SQL to create a single View, ‘Week3_DepartmentEmployee_vi’, that displays the 
--following:
--DEpartment ID, DepartmentName, EmployeeID, EmployeeName, StartSalary, CurrentSalary,
--Difference between StartSalary and CurrentSalary as Promoted, EndSalary

CREATE VIEW Week3_DepartmentEmployee_vi AS
SELECT D.DepID,D.DepName,E.EmpId,E.EmpName,E.StartSalary,E.CurrentSalary,(E.CurrentSalary-E.StartSalary) AS PROMOTED, E.ENDSALARY
FROM Employee E INNER JOIN Department D ON E.DepId=D.DepID


SELECT * FROM Week3_DepartmentEmployee_vi