--Створи файл init_db.sql, у якому змоделюй структуру бази даних для компанії MegaSoft згідно брифінгу. Мають бути наступні таблиці:
--
--worker - таблиця для працівників. У таблиці мають бути наступні поля:
--ID - ідентифікатор працівника, ціле число, сурогатний первинний ключ.
--NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.
--BIRTHDAY - дата народження. Рік у цій даті має бути більшим за 1900
--LEVEL - рівень технічного розвитку працівника. Має бути обмеження - це поле не може бути NULL, значення поля може бути одним з - Trainee, Junior, Middle, Senior
--SALARY - заробітна плата працівника за 1 місяць. Обмеження - ціле число, не менше 100 і не більше 100 000

--client - таблиця для клієнтів. Мають бути наступні поля:
--ID - ідентифікатор клієнта, ціле число, сурогатний первинний ключ.
--NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.

--project - таблиця для проєктів. Мають бути наступні поля:
--ID - ідентифікатор проєкту, ціле число, сурогатний первинний ключ.
--CLIENT_ID - ідентифікатор клієнта, що замовив цей проєкт
--START_DATE - дата початку виконання проєкту
--FINISH_DATE - дата кінця виконання проєкту

--project_worker - таблиця, що показує, які працівники над якими проєктами працюють. Поля таблиці:
--PROJECT_ID - ідентифікатор проєкту. Зовнішній ключ для таблиці project(id)
--WORKER_ID - ідентифікатор клієнту. Зовнішній ключ для таблиці worker(id)
--первинний ключ для цієї таблиці - складений, пара (PROJECT_ID, WORKER_ID)

create table worker (
	ID SERIAL primary key,
	NAME VARCHAR(1000) CHECK(LENGTH(NAME) >= 2 AND LENGTH(NAME) <= 1000),
	BIRTHDAY DATE CHECK(BIRTHDAY >'1900-01-01'),
	LEVEL VARCHAR CHECK(LEVEL in ('Trainee','Junior','Middle','Senior')),
	SALARY INTEGER CHECK(SALARY>100 and SALARY<100000)
);

create table client (
	ID SERIAL primary key,
	NAME VARCHAR(1000) CHECK(LENGTH(NAME) >= 2 AND LENGTH(NAME) <= 1000)
);

create table project(
	ID SERIAL primary key,
	CLIENT_ID INTEGER,
	START_DATE DATE,
	FINISH_DATE DATE
);

create table project_worker(
	PROJECT_ID INTEGER,
	WORKER_ID INTEGER,
 	primary key(PROJECT_ID,WORKER_ID),
 	foreign key (PROJECT_ID)references project(id),
 	foreign key (WORKER_ID)references worker(id)
);
