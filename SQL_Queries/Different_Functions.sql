-- Date Arithmetic:

SELECT NOW();               -- Current date and time
SELECT CURDATE();           -- Current date
SELECT DATE_ADD(NOW(), INTERVAL 7 DAY);  -- Add 7 days
SELECT DATEDIFF('2026-03-31', '2026-03-16'); -- Result: 15

-- Add 7 days to Date_of_Birth
SELECT DATE_ADD(Date_of_Birth, INTERVAL 7 DAY) AS dob_plus_7
FROM Employee;

-- Number of weeks since Date_of_Join
SELECT TIMESTAMPDIFF(DAY, Date_of_Join, CURDATE())/7 AS weeks_since_join
FROM Employee;

-- Add 6 months to Date_of_Join
SELECT DATE_ADD(Date_of_Join, INTERVAL 6 MONTH) AS join_plus_6_months
FROM Employee;

-- Months between today and Date_of_Join
SELECT TIMESTAMPDIFF(MONTH, Date_of_Join, CURDATE()) AS total_months
FROM Employee;

-- Next Friday after Date_of_Join
SELECT DATE_ADD(Date_of_Join, INTERVAL (7 + (5 - DAYOFWEEK(Date_of_Join))) % 7 DAY) AS next_friday
FROM Employee;

-- Last day of the month of Date_of_Join
SELECT LAST_DAY(Date_of_Join) AS last_day_of_month
FROM Employee;

-- Formatting Dates

SELECT DATE_FORMAT(Date_of_Join, '%d %M %Y') AS formatted_date1
FROM Employee;

SELECT DATE_FORMAT(Date_of_Join, '%d %M %Y') AS formatted_date2
FROM Employee;

SELECT DATE_FORMAT(Date_of_Join, '%m/%y') AS month_hired
FROM Employee;

-- Formatting Numbers

-- Format salary as $99,999.00
SELECT CONCAT('$', FORMAT(Basic_salary, 2)) AS salary
FROM Employee;

-- Sum Basic_salary + Others, treating Others as 0 if NULL
SELECT Basic_salary + COALESCE(Others,0) AS total_salary
FROM Employee;

-- Rounding and Truncation

SELECT ROUND(12.345, 2);    -- Result: 12.35
SELECT CEIL(4.2);           -- Result: 5
SELECT FLOOR(4.7);          -- Result: 4

-- Round and truncate numbers
SELECT ROUND(45.928,2) AS rounded_val, TRUNCATE(45.928,2) AS truncated_val;

-- Round to nearest thousand
SELECT ROUND(57445.923,-3) AS rounded_thousand;

-- Modulo operation
SELECT MOD(1600,300) AS mod_result;
SELECT MOD(1600,300) AS MMM;

-- Simple arithmetic
SELECT 5+4 AS sum_result;


-- String Functions

SELECT UPPER('hello');      -- Result: 'HELLO'
SELECT CONCAT('Hi', ' ', 'Bob'); -- Result: 'Hi Bob'
SELECT LENGTH('MySQL');     -- Result

-- Substring
SELECT SUBSTRING('MD. NASIM ADNAN', 5, 15) AS substr_val;

-- Length of string
SELECT CHAR_LENGTH('MD. NASIM ADNAN') AS str_length;

-- Left trim (remove leading spaces)
SELECT LTRIM('  MD. NASIM ADNAN') AS ltrim_val;

-- Left pad with '*'
SELECT LPAD('MD. NASIM ADNAN', 40, '*') AS lpad_val;

-- Some Applications

SELECT 
    Name,
    FLOOR(TIMESTAMPDIFF(MONTH, Date_of_Birth, CURDATE()) / 12) AS `Year`,
    MOD(TIMESTAMPDIFF(MONTH, Date_of_Birth, CURDATE()), 12) AS `Month`
FROM Employee;

-- select max(length(name)) from employee;  -- Not worked in MySQL