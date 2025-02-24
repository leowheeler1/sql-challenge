-- Analysis

-- 1. All employees
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
inner join salaries s
on (e.emp_no = s.emp_no);

--2. Employees hired in 1986
select first_name, last_name, hire_date as hire_date 
from employees
where cast(hire_date as date) < '1987-01-01' 
and cast(hire_date as date) > '1986-01-01';

--3. Managers
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from dept_manager m
inner join departments d 
on (m.dept_no = d.dept_no)
inner join employees e
on (e.emp_no = m.emp_no)

--4. Employees by department
select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de on (e.emp_no = de.emp_no)
inner join departments d on (de.dept_no = d.dept_no) 

--5. All 'Hercules B' employees, male and female
select first_name, last_name, sex from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6. Sales employees
select e.emp_no, e.last_name, e.first_name
from employees e
inner join dept_emp de on (e.emp_no = de.emp_no)
where dept_no = 'd007'

--7. Sales and Development employees
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de on (e.emp_no = de.emp_no)
inner join departments d on (d.dept_no = de.dept_no)
where dept_name like '%Sales%' or dept_name like '%Development%'

--8. freqency counts of employee last names
select last_name, count(*) from employees
group by last_name
order by count(*) desc;