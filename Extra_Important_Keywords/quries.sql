--ASC (Ascending Order)
--Purpose: Used to sort the result set in ascending order (smallest to largest).
-- Default: If no sorting order is specified, ASC is the default.

--Usage:

SELECT column_name
FROM table_name
ORDER BY column_name ASC;

--DESC (Descending Order)
--Purpose: Used to sort the result set in descending order (largest to smallest).
--Usage:

SELECT column_name
FROM table_name
ORDER BY column_name DESC;

--LIMIT
--Purpose: Limits the number of rows returned in the result set.
--Usage:

SELECT column_name
FROM table_name
LIMIT number;

--Combined with OFFSET: Used to skip a specific number of rows before starting to return the rows.

SELECT column_name
FROM table_name
LIMIT number OFFSET number;