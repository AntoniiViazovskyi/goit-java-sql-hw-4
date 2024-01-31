--Створи файл find_max_projects_client.sql. 
--У ньому напиши SQL, який виведе клієнта з найбільшою кількістю проєктів. 
--Якщо таких клієнтів декілька - потрібно вивести всіх.

select name, count(*) as count
from client c join project p  on (c.id = p.client_id)
group by name 
having count(*) = (
	select max(count) 
	from (
		select name,count(*) as count
		from client c join project p  on (c.id = p.client_id)
		group by name
		) as counting_projects_by_id
);