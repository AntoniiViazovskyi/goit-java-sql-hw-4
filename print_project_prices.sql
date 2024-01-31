--Створи файл print_project_prices.sql. У ньому напиши SQL, який виведе список проєктів та вартість кожного проєкту.
--Вартість проєкту - це сума заробітних плат працівників, що працюють над цим проєктом, помножених на тривалість у місяцях проєкту.
--Наприклад, над проєктом Project A працюють працівники Max (заробітна плата 1000) та Joe (заробітна плата 1500). 
--Проєкт триває 17 місяців. Тоді вартість проєкту Project A = 17 * (1000 + 1500) = 42500
--Відсортуй проєкти по спаданню - спочатку виведи найдорожчі проєкти.

select p.id, 
	(
	max((DATE_PART('year', finish_date) - DATE_PART('year', start_date)) * 12 +
    (DATE_PART('month', finish_date) - DATE_PART('month', start_date))) * (
    	select SUM from
			(
				select p2.id,sum(salary) from worker w  
				join project_worker pw on (w.id = pw.worker_id)
				join project p2 on (p2.id = pw.project_id)
				group by p2.id
			) as SUM
			where id = p.id
		)
	) as PRICE
from project p  
group by p.id
order by PRICE desc;