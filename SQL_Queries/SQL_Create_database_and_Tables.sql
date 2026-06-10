-- create a new database
create database practiceDB;
-- make it default schema
use practiceDB;

CREATE TABLE Employee (
    Ids INT(5),
    Name VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Date_of_Join DATE NOT NULL,
    Permanent_Address VARCHAR(255) NOT NULL,
    Current_Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Type CHAR(1) NOT NULL,
    Basic_salary DECIMAL(7,2),
    Others DECIMAL(7,2),

    CONSTRAINT Pk_Ids_Employee PRIMARY KEY (Ids),
    CONSTRAINT Nn_Name_Employee CHECK (Name IS NOT NULL),
    CONSTRAINT Chk_Gender CHECK (Gender IN ('M','F')),
    CONSTRAINT Chk_Type CHECK (Type IN ('T','O','S')),
    CONSTRAINT Chk_BasicSalary CHECK (Basic_salary >= 5000),
    CONSTRAINT Chk_Others CHECK (Others >= 1500)
);

CREATE TABLE Teacher_Details (
    Ids INT(5),
    E_mail VARCHAR(25),
    Papers INT(4),
   
    CONSTRAINT Pk_Ids_Teacher_Details PRIMARY KEY (Ids),
    CONSTRAINT chk_papers CHECK (Papers >= 0)
);

-- Add constraints in the Table

ALTER TABLE Teacher_Details
ADD CONSTRAINT Fk_Teacher_Details_IDS
FOREIGN KEY (Ids)
REFERENCES Employee(Ids);


-- Create Department Table

CREATE TABLE Department (
    Dept_Id INT(5),
    Name VARCHAR(10) NOT NULL,
    CONSTRAINT Pk_Ids_Department PRIMARY KEY (Dept_Id)
);

-- Create Designation Table

CREATE TABLE Designation (
    Desig_Id INT(5),
    Name VARCHAR(20) NOT NULL,
    CONSTRAINT Pk_Ids_Designation PRIMARY KEY (Desig_Id)
);

-- Alter Employee Table to add Dept_Id column

ALTER TABLE Employee
ADD COLUMN Dept_Id INT(5) NOT NULL;

-- Add foreign key in the Employee Table from the Department Table

ALTER TABLE Employee
ADD CONSTRAINT Fk_DeptID_Employee
FOREIGN KEY (Dept_Id)
REFERENCES Department(Dept_Id);

-- Alter Employee table to add Desig_Id column

ALTER TABLE Employee
ADD COLUMN Desig_Id INT(5) NOT NULL;

-- Add foreign key in the Employee Table from the Department Table

ALTER TABLE Employee
ADD CONSTRAINT Fk_DesigID_Employee
FOREIGN KEY (Desig_Id)
REFERENCES Designation(Desig_Id);

-- Create Officer_Details table

CREATE TABLE Officer_Details (
    Ids INT(5),
    Desk_No INT(3) UNIQUE,
    Association_Member CHAR(1) NOT NULL,
   
    CONSTRAINT Pk_Ids_Officer_Details PRIMARY KEY (Ids),
    CONSTRAINT chk_association_member CHECK (Association_Member IN ('Y','N'))
);

-- Add foreign key constraint linking Officer_Details to Employee

ALTER TABLE Officer_Details
ADD CONSTRAINT Fk_Officer_Details_IDS
FOREIGN KEY (Ids)
REFERENCES Employee(Ids);

-- Insert Fresh data

insert into Department values(1,'CSE');
insert into Department values(2,'BBA');
insert into Department values(3,'ETE');

insert into Designation values(1,'Professor');
insert into Designation values(2,'Associate Professor');
insert into Designation values(3,'Assistant Professor');
insert into Designation values(4,'Lecturer');
insert into Designation values(5,'Officer');
insert into Designation values(6,'Assistant Officer');

INSERT INTO Employee
(Ids, Name, Gender, Date_of_Birth, Date_of_Join, Permanent_Address, Current_Address, Phone, Type, Basic_salary, Others, Dept_Id, Desig_Id)
VALUES
(1, 'Nasim', 'M', '1979-12-17', '2001-01-01', 'Magura', 'Dhaka', '01730016854', 'T', 15000.00, 5000.00, 1, 3),

(2, 'Arshad', 'M', '1979-01-01', '2005-01-01', 'Khulna', 'Dhaka', '01191540540', 'T', 12000.00, 3000.00, 2, 4),

(3, 'Fahima', 'F', '1975-01-01', '1999-01-01', 'Sylhet', 'Dhaka', '01819750750', 'T', 12000.00, 3500.00, 3, 2),

(4, 'Nowrin', 'F', '1982-09-01', '2002-01-01', 'Rangpur', 'Dhaka', '01679750750', 'O', 10000.00, 2500.00, 1, 5),

(5, 'Rafiq', 'M', '1950-12-01', '1991-01-01', 'Khulna', 'Dhaka', '01914684384', 'T', 45000.00, 15000.00, 1, 1),

(6, 'Salam', 'M', '1970-04-15', '1995-01-01', 'Jessore', 'Dhaka', '01715420420', 'T', 20000.00, 5000.00, 2, 2),

(7, 'Zia', 'M', '1980-07-25', '1999-01-01', 'Comilla', 'Dhaka', '01914789789', 'T', 15000.00, 1700.00, 3, 3);

insert into Teacher_Details values(1,'nasim_1547@yahoo.co.uk',5);
insert into Teacher_Details values(2,'arshad_parvez@yahoo.com',4);
insert into Teacher_Details values(3,'fahima_noor@abc.ac.bd',2);
insert into Teacher_Details values(5,'rafiq@abc.ac.bd',20);
insert into Teacher_Details values(6,'salam@abc.ac.bd',9);
insert into Teacher_Details values(7,'zia_arman@abc.ac.bd',2);

-- insert into Officer_details values(4,1,'Y');