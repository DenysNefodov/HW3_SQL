-- Таблица employees

-- Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null
-- Наполнить таблицу employee 70 строками.

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees (employee_name)
values ('Ivan_Ivanov'),
	   ('Petr Perov'),
	   ('Brice George'),
	   ('Darren Gilmore'),
	   ('Duane Chandler'),
	   ('Zach Edwards'),
	   ('Gordon Fox'),
	   ('Clement Wheeler'),
	   ('Randell Ryan'),
	   ('Nigel Chapman'),
	   ('Elwin Cole'),
	   ('Cecil Heath'),
	   ('Garry Black'),
	   ('Prosper Lane'),
	   ('Shanon Conley'),
	   ('Cornelius Kelley'),
	   ('Donald Mosley'),
	   ('Tyrone Baldwin'),
	   ('Baldwin Bradford'),
	   ('August Parker'),
	   ('Erick Cannon'),
	   ('Edwin Patrick'),
	   ('Mervin O’neal'),
	   ('Byron Dickerson'),
	   ('Virgil Poole'),
	   ('Spencer Shelton'),
	   ('Nelson Payne'),
	   ('Jeremy Dorsey'),
	   ('Ralf Henry'),
	   ('Todd Mills'),
	   ('Dylan Barnett'),
	   ('Steven Kennedy'),
	   ('Thomas Walsh'),
	   ('Godwin Cook'),
	   ('Reynard Wood'),
	   ('Hester George'),
	   ('Patience Beasley'),
	   ('Molly Floyd'),
	   ('Dulcie Wilkinson'),
	   ('Annabelle Kelly'),
	   ('Rosanna Wells'),
	   ('Joanna Stewart'),
	   ('Matilda Morrison'),
	   ('Shauna Thomas'),
	   ('Belinda Roberts'),
	   ('Evangeline Casey'),
	   ('Madlyn Hubbard'),
	   ('Beatrice Jordan'),
	   ('Madlyn Kelly'),
	   ('Charlene Holland'),
	   ('Lesley Woods'),
	   ('Daisy Chase'),
	   ('Hope Peters'),
	   ('Geraldine White'),
	   ('Cleopatra Lawrence'),
	   ('Amy Arnold'),
	   ('Lorena Cooper'),
	   ('Tracey Richard'),
	   ('Isabel Johns'),
	   ('Amberly Newman'),
	   ('Marjory Hodge'),
	   ('Audra Townsend'),
	   ('Bernice Singleton'),
	   ('Marilynn Hood'),
	   ('Blanche Newton'),
	   ('Arleen Richardson'),
	   ('Tamsyn May'),
	   ('Susanna Daniels'),
	   ('Marion Leonard'),
	   ('Berniece Thompson');
	   
select * from employees;

-- Таблица salary

-- Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
-- Наполнить таблицу salary 15 строками:
-- - 1000
-- - 1100
-- - 1200
-- - 1300
-- - 1400
-- - 1500
-- - 1600
-- - 1700
-- - 1800
-- - 1900
-- - 2000
-- - 2100
-- - 2200
-- - 2300
-- - 2400
-- - 2500

create table salary(
	id serial primary key,
	monthly_salary int not null
);

insert into salary (monthly_salary)
values (1000),
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

select * from salary;

-- Таблица employee_salary

-- Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
-- Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id


create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

select * from employee_salary;

insert into employee_salary (employee_id, salary_id)
	values (3, 7),
		   (1, 4),
		   (5, 9),
		   (40, 13),
		   (23, 4),
		   (11, 2),
		   (52, 10),
		   (15, 13),
		   (26, 4),
		   (16, 3),
		   (33, 7),
		   (27, 7),
		   (29, 9),
		   (30, 4),
		   (31, 6),
		   (32, 14),
		   (35, 11),
		   (48, 10),
		   (49, 11),
		   (50, 2),
		   (51, 4),
		   (53, 3),
		   (54, 9),
		   (55, 6),
		   (56, 8),
		   (57, 4),
		   (58, 2),
		   (59, 8),
		   (60, 5),
		   (61, 3),
		   (71, 4),
		   (72, 5),
		   (73, 1),
		   (74, 2),
		   (75, 6),
		   (76, 7),
		   (77, 8),
		   (78, 9),
		   (79, 10),
		   (80, 11);
		  
select * from employee_salary;
		  


-- Таблица roles
-- 
-- Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
-- Поменять тип столба role_name с int на varchar(30)
-- Наполнить таблицу roles 20 строками:


create table roles (
	id serial primary key,
	role_name int not null unique
);

alter table roles alter column role_name type varchar(30);

insert into roles (role_name)
values ('Junior Python developer'),
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
	   
select * from roles;

-- Таблица roles_employee
-- 
-- Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- Наполнить таблицу roles_employee 40 строками:

create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

insert into roles_employee (employee_id, role_id)
values (7, 2),
	  (20, 4),
	  (3, 9),
	  (5, 13),
	  (28, 4),
	  (11, 2),
	  (10, 9),
	  (22, 13),
	  (21, 3),
	  (34, 4),
	  (6, 7),
	  (4, 13),
	  (64, 6),
	  (17, 11),
	  (12, 20),
	  (23, 20),
	  (24, 9),
	  (33, 17),
	  (37, 13),
	  (45, 11),
	  (40, 17),
	  (41, 7),
	  (42, 11),
	  (61, 19),
	  (67, 20),
	  (66, 3),
	  (56, 4),
	  (30, 10),
	  (31, 12),
	  (38, 8),
	  (65, 1),
	  (49, 10),
	  (62, 11),
	  (1, 3),
	  (53, 19),
	  (58, 1),
	  (59, 9),
	  (55, 2),
	  (44, 10),
	  (63, 1);
	 
	 
select * from employees;  
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

drop table employees;
drop table salary;
drop table employee_salary;
drop table roles;
drop table roles_employee;