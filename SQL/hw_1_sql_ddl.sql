/*Таблица employees

Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.*/

create table employees (
	id serial primary key,
	employee_name Varchar(50) not null
);


insert into employees(employee_name)
values	  ('India Oneil'),
		  ('Hunter Rodgers'),
		  ('Sydnee Alvarado'),
		  ('Lance Hampton'),
		  ('Austin Sims'),
		  ('Valentine Cruz'),
		  ('Adena Stafford'),
		  ('Russell Valentine'),
		  ('Asher Yang'),
		  ('Neville Jefferson'),
		  ('Valentine Simmons'),
		  ('Drake Hill'),
		  ('Warren Ortiz'),
		  ('Malachi Alvarez'),
		  ('Jackson Rich'),
		  ('Tanek Farrell'),
		  ('Stephen Curtis'),
		  ('Sopoline Donovan'),
		  ('Norman Hughes'),
		  ('Nathaniel Horton'),
		  ('Debra Gilmore'),
		  ('Aladdin Gardner'),
		  ('Adara Frederick'),
		  ('Lawrence Branch'),
		  ('Skyler Kirby'),
		  ('Kaitlin Vasquez'),
		  ('Haley Patterson'),
		  ('Ingrid Golden'),
		  ('Hiram Chang'),
		  ('Francis Gomez'),
		  ('Jocelyn Simon'),
		  ('Phelan Coleman'),
		  ('Eric Hampton'),
		  ('Hilel Hicks'),
		  ('Dylan Strong'),
		  ('Mark Chandler'),
		  ('Rudyard Powell'),
		  ('Kameko Cook'),
		  ('Kylan Everett'),
		  ('Brenna Foley'),
		  ('Elton Macias'),
		  ('Sydnee Travis'),
		  ('Curran Grant'),
		  ('Carson Patton'),
		  ('Graham Lopez'),
		  ('Mufutau Dominguez'),
		  ('Adrienne Donovan'),
		  ('Robin Cervantes'),
		  ('Timon Hicks'),
		  ('Hayes Dale'),
		  ('Sylvester Cochran'),
		  ('Carter Johnson'),
		  ('Elvis Graham'),
		  ('Yen Benjamin'),
		  ('Ross Perez'),
		  ('Kitra Lawson'),
		  ('Hadley Faulkner'),
		  ('Yeo Barrett'),
		  ('Lareina Dunlap'),
		  ('Palmer Franco'),
		  ('Ariel Crosby'),
		  ('Kasimir Blanchard'),
		  ('Aaron Brooks'),
		  ('Hilary Bullock'),
		  ('Bevis Hawkins'),
		  ('Rosalyn Farmer'),
		  ('Whilemina Cobb'),
		  ('Shelley Tucker'),
		  ('Mechelle Cooper'),
		  ('Jordan Delgado');
		 
/*Таблица salary

Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500*/
create table salary (
	id serial primary key,
	monthly_salary int not null
);
select * from salary ;
select * from employees;

insert into salary(monthly_salary)
values 	(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	
/*Таблица employee_salary

Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
*/

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

insert into employee_salary (employee_id, salary_id)
values(1,4),
	  (2,9),
	  (3,11),
	  (4,12),
	  (5,4),
	  (6,7),
	  (7,3),
	  (8,16),
	  (9,8),
	  (10,13),
	  (11,11),
	  (12,8),
	  (13,3),
	  (14,7),
	  (15,16),
	  (16,14),
	  (17,4),
	  (18,5),
	  (19,12),
	  (20,2),
	  (21,7),
	  (22,16),
	  (23,13),
	  (24,11),
	  (25,7),
	  (26,4),
	  (27,5),
	  (28,3),
	  (29,1),
	  (30,8),
	  (96,15),
	  (78,13),
	  (366,9),
	  (88,8),
	  (89,6),
	  (257,11),
	  (577,2),
	  (147,15),
	  (72,10),
	  (71,1);

/*Таблица roles

Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:

id role_name
1  Junior Python developer
2  Middle Python developer
3  Senior Python developer
4  Junior Java developer
5  Middle Java developer
6  Senior Java developer
7  Junior JavaScript developer
8  Middle JavaScript developer
9  Senior JavaScript developer
10 Junior Manual QA engineer
11 Middle Manual QA engineer
12 Senior Manual QA engineer
13 Project Manager
14 Designer
15 HR
16 CEO
17 Sales manager
18 Junior Automation QA engineer
19 Middle Automation QA engineer
20 Senior Automation QA engineer
*/
	 
create table roles(
	id serial primary key,
	role_name int not null unique
);
alter table roles 
alter column role_name type varchar(30);

insert into roles (role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
	
/*Таблица roles

Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками
*/
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id) references employees (id),
	foreign key(role_id) references roles(id)
);

insert into roles_employee (employee_id, role_id)
values  (1,4),
		(2,4),
		(3,4),
		(4,4),
		(5,4),
		(6,4),
		(7,4),
		(8,4),
		(9,8),
		(10,13),
		(11,4),
		(12,8),
		(13,3),
		(14,7),
		(15,20),
		(16,19),
		(17,7),
		(18,7),
		(19,7),
		(20,7),
		(21,7),
		(22,7),
		(23,7),
		(24,7),
		(25,7),
		(26,8),
		(27,8),
		(28,8),
		(29,8),
		(30,8),
		(31,16),
		(32,1),
		(33,2),
		(34,16),
		(35,7),
		(36,17),
		(37,11),
		(38,8),
		(39,15),
		(40,5);