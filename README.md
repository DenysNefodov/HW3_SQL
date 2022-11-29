# HW3_SQL-DDL_Operation

**Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.**
```SQL
select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_id
join salary on salary.id = salary_id;
```
**Вывести всех работников у которых ЗП меньше 2000.**
```SQL
select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_id
join salary on salary.id = salary_id
where monthly_salary < 2000;
```
**Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)**
```SQL
select monthly_salary from salary
full join employee_salary on salary.id = salary_id
where salary_id is null;
```
**Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)**
```SQL
select monthly_salary from salary
full join employee_salary on salary.id = salary_id
where salary_id is null and monthly_salary < 2000;
```
**Найти всех работников кому не начислена ЗП.**
```SQL
select employee_name from employees
full join employee_salary on employees.id = employee_id
where salary_id is null;
```
**Вывести всех работников с названиями их должности.**
```SQL
select employee_name, role_name from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id;
```
**Вывести имена и должность только Java разработчиков.**
```SQL
select employee_name, role_name from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Java developer';
```
**Вывести имена и должность только Python разработчиков.**
```SQL
select employee_name, role_name from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Python%';
```
**Вывести имена и должность всех QA инженеров.**
```SQL
select employee_name, role_name from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%QA%';
```
**Вывести имена и должность ручных QA инженеров.**
```SQL
select employee_name, role_name from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Manual QA%'
```
**Вывести имена и должность автоматизаторов QA**
```SQL
select employee_name, role_name from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Automation QA%'
```
**Вывести имена и зарплаты Junior специалистов**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like 'Junior%';
```
**Вывести имена и зарплаты Middle специалистов**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like 'Middle%';
```
**Вывести имена и зарплаты Senior специалистов**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like 'Senior%';
```
**Вывести зарплаты Java разработчиков**
```SQL
select role_name, monthly_salary from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Java developer';
```
**Вывести зарплаты Python разработчиков**
```SQL
select role_name, monthly_salary from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Python%';
```
**Вывести имена и зарплаты Junior Python разработчиков**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like 'Junior Python%';
```
**Вывести имена и зарплаты Middle JS разработчиков**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like 'Middle JavaScript developer'; --пустой, ибо нет мидлов JS
```
**Вывести имена и зарплаты Senior Java разработчиков**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name like 'Senior Java%';
```
**Вывести зарплаты Junior QA инженеров**
```SQL
select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where role_name = 'Junior Automation QA engineer' or role_name = 'Junior Manual QA engineer';
```
**Вывести среднюю зарплату всех Junior специалистов**
```SQL
select avg(monthly_salary), role_name, employee_name from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like 'Junior%'
group by role_name, monthly_salary, employee_name;
```
**Вывести сумму зарплат JS разработчиков**
```SQL
select sum(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%JavaScript%';
```
**Вывести минимальную ЗП QA инженеров**
```SQL
select min(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';
```
**Вывести максимальную ЗП QA инженеров**
```SQL
select max(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';
```
**Вывести количество QA инженеров**
```SQL
select count(*) from employees
join roles_employee on employees.id = employee_id
join roles on roles.id = role_id where role_name like '%QA%';
```
**Вывести количество Middle специалистов.**
```SQL
select count(*) from roles
join roles_employee on roles.id = roles_employee.role_id
where role_name like 'Middle%';
```
**Вывести количество разработчиков**
```SQL
select count(*) from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
```
**Вывести фонд (сумму) зарплаты разработчиков.**
```SQL
select sum(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
```
**Вывести имена, должности и ЗП всех специалистов по возрастанию**
```SQL
select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
order by monthly_salary;
```
**Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300**
```SQL
select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary;
```
**Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300**
```SQL
select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary;
```
**Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000**
```SQL
select employee_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by monthly_salary;
```
