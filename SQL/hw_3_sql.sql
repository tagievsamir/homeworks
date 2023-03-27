select * from roles_employee;
select * from employees;
select * from roles;
select * from employee_salary;
select * from salary;

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами
select employee_name, monthly_salary  from employees e 
join employee_salary es on e.id = es.employee_id
join salary on salary.id = es.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000
select employee_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id
join salary s  on s.id = es.salary_id 
where s.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. 
-- (ЗП есть, но не понятно кто её получает)
insert into salary(monthly_salary)
values(2600);

select  monthly_salary  from salary s left join employee_salary es on s.id = es.salary_id 
where es.employee_id is null ;

select monthly_salary from salary where id not in (select salary_id from employee_salary);

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен.
--(ЗП есть, но не понятно кто её получает.)
insert into salary(monthly_salary)
values(700);

select monthly_salary from salary where monthly_salary < 2000 
and id not in (select salary_id from employee_salary);

--5. Найти всех работников кому не начислена ЗП.
select employee_name  from employees where id not in(select employee_id from employee_salary);

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees 
join roles_employee on employee_id = employees.id 
join roles on role_id = roles.id ;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees 
join roles_employee on employee_id = employees.id 
join roles on role_id = roles.id 
where role_name like '%Java_developer%';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees 
join roles_employee on employee_id = employees.id 
join roles on role_id = roles.id 
where role_name like '%Python_developer%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees 
join roles_employee on  employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%QA_engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees 
join roles_employee on  employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%Manual_QA_engineer%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees 
join roles_employee on  employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%Automation_QA_engineer%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_id = employees.id
left join salary on salary_id = salary.id
left join roles_employee on roles_employee.employee_id = employees.id 
left join roles on roles.id = roles_employee.role_id 
where roles.role_name like '%Junior%';

 --13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary_id = salary.id
left join roles_employee on roles_employee.employee_id = employees.id 
left join roles on roles.id = roles_employee.role_id 
where role_name like '%Middle%';


-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name from employees 
full outer join employee_salary on employee_id = employees.id
full outer join salary on salary_id = salary.id
full outer join roles_employee on roles_employee.employee_id = employees.id 
full outer join roles on roles.id = roles_employee.role_id 
where roles.role_name like '%Senior%' and employees.employee_name is not null;

 --15. Вывести зарплаты Java разработчиков
select monthly_salary, role_name, employee_name from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Java_dev%';

-- 16. Вывести зарплаты Python разработчиков
select monthly_salary, role_name, employee_name from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Python_dev%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select monthly_salary, role_name, employee_name from salary
join employee_salary on employee_salary.salary_id = salary.id
right join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Junior_Python_dev%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select monthly_salary, employee_name, role_name from salary 
join employee_salary on employee_salary.salary_id = salary.id 
right join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Middle_JavaScript_dev%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select monthly_salary, role_name, employee_name from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
right join roles on roles.id = roles_employee.role_id 
where role_name like '%Senior_Java_dev%';

-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary, role_name, employee_name from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
right join roles on roles.id = roles_employee.role_id 
where role_name like '%Junior%QA%eng%';



