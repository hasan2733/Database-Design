-- Joins

select ids from employee;
select ids from teacher_details;

select ids from employee
union
select ids from officer_details;

-- Cannot be done in MySQL (can be done in Oracle)

select ids from employee
minus
select ids from teacher_details;

select ids from employee
intersect
select ids from teacher_details;

--Inner Join (Simple Join)

select * from Employee, Teacher_Details; -- Cartesian Product

select * from Employee, Teacher_Details where 
Employee.IDS=Teacher_Details.IDS;

select * from Employee E, Teacher_Details TD where E.ids=TD.ids;

select E.*,TD.* from Employee E, Teacher_Details TD where E.ids=TD.ids;

select E.* from Employee E, Teacher_Details TD where E.IDs=TD.IDs;

select E.Name as NAME , E.Date_of_Birth as Date_of_Birth, E.Date_of_Join as Date_of_Join,
E.Permanent_Address as Permanent_Address, E.Current_Address as Current_Address, E.Phone as Phone,
TD.E_Mail as E_Mail, TD.Papers as Papers
from Employee E, Teacher_Details TD where E.ids=TD.ids;

select E.Name as NAME , E.Date_of_Birth as Date_of_Birth, E.Date_of_Join as Date_of_Join,
E.Permanent_Address as Permanent_Address, E.Current_Address as Current_Address, E.Phone as Phone,
D.Name as Department, DG.Name as Designation, TD.E_Mail as E_Mail, TD.Papers as Papers
from Employee E, Department D, Designation DG, Teacher_Details TD
where E.Dept_id=D.dept_id and E.Desig_Id=DG.Desig_Id and E.ids=TD.ids;

select E.Name as NAME , E.Date_of_Birth as Date_of_Birth, E.Date_of_Join as Date_of_Join,
E.Permanent_Address as Permanent_Address, E.Current_Address as Current_Address, E.Phone as Phone,
D.Name as Department, DG.Name as Designation, E.Type as Type
from Employee E, Department D, Designation DG
where E.Dept_id=D.dept_id and E.Desig_Id=DG.Desig_Id
order by E.Type desc;

select E.Name as NAME , E.Date_of_Birth as Date_of_Birth, E.Date_of_Join as Date_of_Join,
E.Permanent_Address as Permanent_Address, E.Current_Address as Current_Address, E.Phone as Phone,
D.Name as Department, DG.Name as Designation, (E.basic_salary+E.others) as Total_Salary, E.Type as Type
from Employee E, Department D, Designation DG
where (E.basic_salary+E.others)>15000 and E.Dept_id=D.dept_id and E.Desig_Id=DG.Desig_Id
order by E.Type desc;

select E.Name as NAME , E.Date_of_Birth as Date_of_Birth, E.Date_of_Join as Date_of_Join,
E.Permanent_Address as Permanent_Address, E.Current_Address as Current_Address, E.Phone as Phone,
D.Name as Department, DG.Name as Designation, E.Basic_salary as Basic_salary, E.Type as Type
from Employee E, Department D, Designation DG
where E.Basic_salary>10000 and E.Name like '%a%' and E.Dept_id=D.dept_id and E.Desig_Id=DG.Desig_Id
order by E.Basic_salary;

-- Joins (Main)

CREATE TABLE Manager (
    Ids INT(5),
    Name VARCHAR(10) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Permanent_Address VARCHAR(255) NOT NULL,
    Current_Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(50),
    Type CHAR(1) NOT NULL,
    Managerial_Allowance DECIMAL(7,2)
);

-- Alter Manager Table to add Dept_Id column

ALTER TABLE Manager
ADD COLUMN Dept_Id INT(5) NOT NULL;

-- Add foreign key in the Manager Table from the Department Table

ALTER TABLE Manager
ADD CONSTRAINT Fk_DeptID_Employee1
FOREIGN KEY (Dept_Id)
REFERENCES Department(Dept_Id);

SET SQL_SAFE_UPDATES = 0;

Delete from Manager;

INSERT INTO Manager 
(Ids, Name, Gender, Permanent_Address, Current_Address, Phone, Type, Managerial_Allowance, Dept_Id)
VALUES
(1, 'Nasim', 'M', 'Magura', 'Dhaka', '01730016854', 'T', 20000.00, 1),

(2, 'Arshad', 'M', 'Khulna', 'Dhaka', '01191540540', 'T', 25000.00, 2),

(4, 'Nowrin', 'F', 'Rangpur', 'Dhaka', '01679750750', 'O', 20000.00, 3),

(8, 'Aslam', 'M', 'Khulna', 'Dhaka', '01914684384', 'T', 50000.00, 1),

(9, 'Tasmia', 'F', 'Jessore', 'Dhaka', '01715420420', 'O', 70000.00, 2),

(10, 'Samara', 'F', 'Magura', 'Dhaka', '01715420420', 'O', 60000.00, 3);

-- Left Join

SELECT * FROM Employee E
LEFT JOIN Manager M
ON E.Ids = M.Ids;

-- Right Join

SELECT * FROM Employee E
RIGHT JOIN Manager M
ON E.Ids = M.Ids;

-- Full Join: Cannot be done in MySQL (can be done in Oracle)

SELECT * FROM Employee E
FULL JOIN Manager M
ON E.Ids = M.Ids;

-- Corresponding MySQL Syntax 

SELECT * FROM Employee E
LEFT JOIN Manager M
ON E.Ids = M.Ids
UNION
SELECT * FROM Employee E
RIGHT JOIN Manager M
ON E.Ids = M.Ids;
