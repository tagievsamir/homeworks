--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами
select employee_name, monthly_salary  from employees as e 
join employee_salary as es on e.id = es.employee_id
join salary on salary.id = es.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000
select employee_name from employees as e 
join employee_salary as es on e.id = es.employee_id
join salary as s  on s.id = es.salary_id 
where s.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. 
-- (ЗП есть, но не понятно кто её получает)
insert into salary(monthly_salary)
values(2600);

select  monthly_salary  from salary as s left join employee_salary as es on s.id = es.salary_id 
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
select employee_name, monthly_salary from employees 
left join employee_salary on employee_id = employees.id
left join salary on salary_id = salary.id
left join roles_employee on roles_employee.employee_id = employees.id 
left join roles on roles.id = roles_employee.role_id 
where roles.role_name like '%Junior%';

 --13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary_id = salary.id
left join roles_employee on roles_employee.employee_id = employees.id 
left join roles on roles.id = roles_employee.role_id 
where role_name like '%Middle%';


-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary from employees 
join employee_salary on employee_id = employees.id
join salary on salary_id = salary.id
join roles_employee on roles_employee.employee_id = employees.id 
right join roles on roles.id = roles_employee.role_id 
where roles.role_name like '%Senior%' and employees.employee_name is not null;

 --15. Вывести зарплаты Java разработчиков
select monthly_salary from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Java_dev%';

-- 16. Вывести зарплаты Python разработчиков
select monthly_salary from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Python_dev%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary from salary
join employee_salary on employee_salary.salary_id = salary.id
right join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Junior_Python_dev%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary from salary 
join employee_salary on employee_salary.salary_id = salary.id 
right join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Middle_JavaScript_dev%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary  from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
right join roles on roles.id = roles_employee.role_id 
where role_name like '%Senior_Java_dev%';

-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
right join roles on roles.id = roles_employee.role_id 
where role_name like '%Junior%QA%eng%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary)  from salary 
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
right join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Junior%' ; 

 --22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
right join roles on roles_employee.role_id = roles.id
where roles.role_name like '%JavaScrip%' ;

-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
right join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA%' ;

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
right join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA%' ;

--25. Вывести количество QA инженеров
select count(role_name) from roles
left outer join roles_employee on role_id = roles.id 
left join employees on employee_id = employees.id 
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов
select count(role_name) from roles
left outer join roles_employee on role_id = roles.id 
left join employees on employee_id = employees.id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(role_name) from roles
left outer join roles_employee on role_id = roles.id 
left join employees on employee_id = employees.id 
where role_name like '%dev%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков
select sum(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employee_salary.employee_id = employees.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%dev%' ;

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join employee_salary on employee_salary.employee_id =  employees.id
join salary on salary.id = employee_salary.salary_id
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join employee_salary on employee_salary.employee_id =  employees.id
join salary on salary.id = employee_salary.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию 
--у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join employee_salary on employee_salary.employee_id =  employees.id
join salary on salary.id = employee_salary.salary_id
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию
--у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join employee_salary on employee_salary.employee_id =  employees.id
join salary on salary.id = employee_salary.salary_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;

