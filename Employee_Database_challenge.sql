SELECT e.emp_no
	, first_name
	, last_name
	, title
	, from_date
	, to_date
--INTO retirement_titles
FROM employees e
JOIN titles t
	ON t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1/1/1952'
		AND '12/31/1955'
ORDER BY e.emp_no
	, from_date DESC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT
	ON (emp_no) emp_no
		, first_name
		, last_name
		, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no
	, to_date DESC;

SELECT COUNT(*)
	, title
INTO retiring_titles
FROM unique_titles ut
GROUP BY title
ORDER BY count(*) DESC

SELECT DISTINCT ON (e.emp_no) e.emp_no
	, first_name
	, last_name
	, birth_date
	, title
	, de.from_date
	, de.to_date
INTO mentorship_eligibilty
FROM employees e
JOIN dept_emp de
	ON e.emp_no = de.emp_no
JOIN titles t
	ON t.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1/1/1965'
		AND '12/31/1965'
ORDER BY e.emp_no
	, from_date DESC;