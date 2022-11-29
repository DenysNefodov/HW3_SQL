select * from employees;
select * from salary_first;
select * from employee_salary_first;

select sum(monthly_salary) from salary;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами

select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_id 
join salary on salary.id = salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employees
join employee_salary on employees.id = employee_id 
join salary on salary.id = salary_id 
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary from salary
full join employee_salary on salary.id = salary_id 
where salary_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary from salary
full join employee_salary on salary.id = salary_id 
where salary_id is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП

select employee_name from employees
full join employee_salary on employees.id = employee_id 
where salary_id is null;


-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id;

-- 7. Вывести имена и должность только Java разработчиков

select employee_name, role_name from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%Java developer';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%Manual QA%'

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id 
where role_name like '%Automation QA%'

-- 12. Вывести имена и зарплаты Junior специалистов

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like 'Junior%';

 -- 13. Вывести имена и зарплаты Middle специалистов

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like 'Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like 'Senior%';

-- 15. Вывести зарплаты Java разработчиков

select role_name, monthly_salary from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like '%Java developer';

-- 16. Вывести зарплаты Python разработчиков

select role_name, monthly_salary from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like 'Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like 'Middle JavaScript developer'; --пустой, ибо нет мидлов JS

--  19. Вывести имена и зарплаты Senior Java разработчиков

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name like 'Senior Java%';

 -- 20. Вывести зарплаты Junior QA инженеров

select role_name, monthly_salary, employee_name from roles
join roles_employee on roles.id = employee_id 
join employees on employee_id = employees.id
join employee_salary on employee_salary.id = employees.id
join salary on employee_salary.salary_id = salary.id 
where role_name = 'Junior Automation QA engineer' or role_name = 'Junior Manual QA engineer';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary), role_name, employee_name from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like 'Junior%'
group by role_name, monthly_salary, employee_name;

select sum(monthly_salary) from salary

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id
join employees on employee_salary.employee_id = employees.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(*) from employees
join roles_employee on employees.id = employee_id 
join roles on roles.id = role_id where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(*) from roles
join roles_employee on roles.id = roles_employee.role_id  
where role_name like 'Middle%';

-- 27. Вывести количество разработчиков

select count(*) from employees
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) from salary
join employee_salary on salary.id = employee_salary.salary_id 
join employees on employee_salary.employee_id = employees.id

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 
 select employee_name, role_name, monthly_salary from employees
 join roles_employee on employees.id = roles_employee.employee_id 
 join roles on roles_employee.role_id = roles.id 
 join employee_salary on employee_salary.id = employees.id 
 join salary on employee_salary.salary_id = salary.id 
 order by monthly_salary;

 -- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

 select employee_name, role_name, monthly_salary from employees
 join roles_employee on employees.id = roles_employee.employee_id 
 join roles on roles_employee.role_id = roles.id 
 join employee_salary on employee_salary.id = employees.id 
 join salary on employee_salary.salary_id = salary.id
 where monthly_salary between 1700 and 2300
 order by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from employees
 join roles_employee on employees.id = roles_employee.employee_id 
 join roles on roles_employee.role_id = roles.id 
 join employee_salary on employee_salary.id = employees.id 
 join salary on employee_salary.salary_id = salary.id
 where monthly_salary < 2300
 order by monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from employees
 join roles_employee on employees.id = roles_employee.employee_id 
 join roles on roles_employee.role_id = roles.id 
 join employee_salary on employee_salary.id = employees.id 
 join salary on employee_salary.salary_id = salary.id
 where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
 order by monthly_salary;










