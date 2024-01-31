--Створи файл find_max_salary_worker.sql. 
--У ньому напиши SQL, який виведе працівника з найбільшою заробітною платою. 
--Якщо таких працівників декілька - потрібно вивести всіх.

select name,salary
from worker
where salary in (
	select max(salary) 
	from worker
);