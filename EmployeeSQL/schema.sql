drop table if exists titles;
drop table if exists employees;
drop table if exists salaries;
drop table if exists departments;
drop table if exists dept_emp;
drop table if exists dept_manager;

create table titles (
	title_id varchar(5) primary key not null,
	title varchar(25) not null
);

create table employees (
	emp_no int primary key not null,
	emp_title_id varchar(5) not null,
	foreign key (emp_title_id) references titles(title_id),
	birth_date varchar(8) not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	sex varchar(1),
	hire_date varchar(8) not null
);

create table salaries (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	salary int not null
);

create table departments (
	dept_no varchar(4) primary key not null,
	dept_name varchar(25) not null
);

create table dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(4) not null,
	foreign key (dept_no) references departments(dept_no)
);

create table dept_manager (
	dept_no varchar(4) not null,
	foreign key (dept_no) references departments(dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no)
); 

alter table salaries
add id serial primary key;

alter table dept_emp
add id serial primary key;

alter table dept_manager
add id serial primary key;