-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- Retrieve the title, from_date, and to_date columns from the Titles table.
-- Create a new table using the INTO clause.
-- Join both tables on the primary key.
-- Filter the data on the birth_date column to retrieve the employees 
-- who were born between 1952 and 1955. Then, order by the employee number.

SELECT em.emp_no, 
	em.first_name, 
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS em
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC; 

SELECT * FROM retirement_titles;

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- Use Dictinct with Orderby to remove duplicate rows
-- Create a Unique Titles table using the INTO clause.
-- Sort the Unique Titles table in ascending order by the employee number and descending order by the 
-- last date (i.e. to_date) of the most recent title.

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.

Select COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- Retrieve the from_date and to_date columns from the Department Employee table.
-- Retrieve the title column from the Titles table.
-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each 
-- set of rows defined by the ON () clause.
-- Create a new table using the INTO clause.
-- Join the Employees and the Department Employee tables on the primary key.
-- Join the Employees and the Titles tables on the primary key.
-- Filter the data on the to_date column to get current employees whose birth dates are between 
-- January 1, 1965 and December 31, 1965.
-- Order the table by the employee number.

SELECT DISTINCT ON (em.emp_no) em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees AS em
	INNER JOIN dept_emp AS de
		ON (em.emp_no = de.emp_no)
	INNER JOIN titles AS ti
		ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (ti.to_date = '9999-01-01')
ORDER BY emp_no;

 SELECT * FROM mentorship_eligibilty;