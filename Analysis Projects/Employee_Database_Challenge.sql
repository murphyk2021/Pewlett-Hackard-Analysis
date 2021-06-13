--DELIVERABLES 1
-- a. Create a table called "retirement_titles" which includes the employee number, name, title, and dates of employment which are eligible for retirement.
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- b. Create a new table called "unique_titles" which uses Dictinct with Orderby to remove duplicate rows in the new retirement_titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- c. Create a third table called "retiring_titles" that stores the number of employees eligible for retirement with each job title
SELECT COUNT (unique_titles.emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


--DELIVERABLE 2
--Create a table called "mentorship_eligibility" which includes the employee number, name, birth date, employment dates, and title of all employees who are approaching retirement and eligible for the mentorship program.
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY emp_no;