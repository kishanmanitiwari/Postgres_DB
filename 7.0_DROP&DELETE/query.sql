-- PostgreSQL Notes (DELETE)

-- 1. Deleting Records

--To delete records from a table, use the `DELETE` statement.

--# 1.1 Syntax

DELETE FROM employees
WHERE id = 1;

--# 1.2 Example
--Delete a employee with the id `1` from the `employee` table:

DELETE FROM students
WHERE id = 123;

--# 1.3 Delete All Records

--Delete all records from the `employees` table without deleting the table itself:

DELETE FROM employees


-- 2. Dropping a Table

--To drop a table, use the `DROP TABLE` statement.

--# 2.1 Syntax

DROP TABLE table_name; 

--# 2.2 Example

--Drop a table named `employees`: (Omit the WHERE clause)

DROP TABLE employees;

--# 2.3 Drop Table If Exists

--Drop a table named `courses` only if it exists: (To avoid errors)

DROP TABLE IF EXISTS courses;


-- 3. Dropping a Database

--To drop a database, use the `DROP DATABASE` statement.

--# 3.1 Syntax

DROP DATABASE database_name;

--# 3.2 Example

--Drop a database named `school_db`:

DROP DATABASE school_db;

--# 3.3 Drop Database If Exists

--Drop a database named `school_db` only if it exists:

DROP DATABASE IF EXISTS school_db;


-- Important Notes

1. --Deleting Records: Always use the `WHERE` clause to specify which records to delete. Omitting the `WHERE` clause will delete all records in the table.

2. --Dropping a Table: Dropping a table deletes the table and all the data within it permanently. This action cannot be undone.

3. --Dropping a Database: Dropping a database deletes the database and all its objects (tables, indexes, etc.) permanently. This action cannot be undone.