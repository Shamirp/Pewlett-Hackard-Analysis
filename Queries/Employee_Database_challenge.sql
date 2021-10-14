--Deliverable 1

-- retirement_titles
SELECT e.emp_no,
    e.first_name,
e.last_name,
  ti.title,
  ti.from_date,
  ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- unique_titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
-- INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no ASC, to_date DESC;

-- Retiring Titles
SELECT COUNT(emp_no),
title
-- INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC; 


--Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
-- INTO mentorship_eligibilty
FROM employees as e
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01')
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;