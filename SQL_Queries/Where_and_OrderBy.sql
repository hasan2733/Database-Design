-- Order By

select name, basic_salary from employee order by name;
select name, basic_salary from employee order by name desc;

select name, basic_salary from employee order by basic_salary;
select name, basic_salary from employee order by basic_salary desc;

-- Test how Database maintains the constraints

INSERT INTO Employee 
(Ids, Name, Gender, Date_of_Birth, Date_of_Join, Permanent_Address, Current_Address, Phone, Type, Basic_salary, Others, Dept_Id, Desig_Id)
VALUES
(8, 'Tamal', 'M', '1979-01-17', '2001-01-01', 'Magura', 'Dhaka', '01730016854', 'O', 15000.00, 5000.00, 1, 3);

select name, basic_salary from employee order by name desc, basic_salary;

-- Where

select * from Employee
where Gender='M';

select * from Employee
where Gender='F';

select * from Employee
where Type='T';

select * from Employee
where Type='O';

select * from Employee
where Basic_salary>30000;

select * from Employee
where Permanent_address='Khulna';

select * from Employee
where Permanent_address='Khulna' and Basic_salary>20000;

-- Check more combinations

select * from Employee
where Permanent_address='Khulna' and Dept_ID = 1

select * from Employee
where Permanent_address='Khulna' or Dept_ID = 1 order by basic_salary;

select * from Employee
where Permanent_address='Khulna' or Dept_ID = 1 order by basic_salary; --desc;

SELECT * FROM Employee
WHERE Permanent_address = 'Magura'
OR Permanent_address = 'Khulna'
OR Permanent_address = 'Sylhet';

SELECT * FROM Employee
WHERE Permanent_address in ('Magura','Khulna', 'Sylhet');

SELECT * FROM Employee
WHERE Permanent_address <> 'Magura'
and Permanent_address <> 'Khulna'
and Permanent_address <> 'Sylhet';

SELECT * FROM Employee
WHERE Permanent_address not in ('Magura','Khulna', 'Sylhet');

SELECT * FROM Employee
WHERE Type in ('T','O');

SELECT * FROM Employee
WHERE Type not in ('T');

SELECT * FROM Employee
WHERE Type not in ('O');

SELECT * FROM Employee where Name like 'N%';
SELECT * FROM Employee where Name not like 'N%';
SELECT * FROM Employee where Name like '%n%';
SELECT * FROM Employee where Name not like '%n%';

SELECT * FROM Employee
WHERE Permanent_address like 'Kh__na';

SELECT * FROM Employee
WHERE upper(Permanent_address) = 'KHULNA';

SELECT * FROM Employee
WHERE lower(Permanent_address) = 'khulna';

SELECT * FROM Employee
WHERE upper(Permanent_address) like 'KH%';

SELECT * FROM Employee
WHERE lower(Permanent_address) like 'kh%';

SELECT * FROM Employee
WHERE Basic_salary >=12000 and Basic_salary <=60000;

SELECT * FROM Employee
WHERE Basic_salary between 12000 and 60000;

SELECT * FROM Employee
WHERE Basic_salary not between 12000 and 60000;

-- Write in another way

Select * from Employee
where Date_of_Join between '1903/12/31' and '2003/01/01';
