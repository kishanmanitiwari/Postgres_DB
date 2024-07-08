--Employee Table

--Here is the structure for the employees table where all the operations are performed:

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC,
    age INTEGER
);

--Updating Records

-- 1. Basic Update

UPDATE employees
SET salary = 50000
WHERE id = 1;

-- 2. Update Multiple Columns

UPDATE employees
SET department = 'Marketing', salary = 55000
WHERE id = 2;

-- 3. Conditional Update

UPDATE employees
SET salary = CASE
    WHEN department = 'HR' THEN salary * 1.05
    WHEN department = 'Engineering' THEN salary * 1.10
    ELSE salary
END;

-- 4. Returning Updated Records

UPDATE employees
SET salary = 60000
WHERE id = 3
RETURNING *;


--------------------------------------------------------------------------

-- Updating Table Structure

-- 1. Add a Column

--Purposefully input wrong name 

ALTER TABLE employees
ADD COLUMN female VARCHAR(6);

-- 2. Modify a Column

ALTER TABLE employees
ALTER COLUMN gender TYPE VARCHAR(11);

-- 3. Rename a Column

ALTER TABLE employees
RENAME COLUMN female TO gender;

-- 4. Drop a Column

ALTER TABLE employees
DROP COLUMN gender;
