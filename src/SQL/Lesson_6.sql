use publishing;
-- 1.Создайте кластеризованный индекс по имени автора для таблицы Authors.
select*
from authors;
create index FirstName on authors (FirstName);

-- 2.Создайте кластеризованный составной индекс, содержащий цену и название каждой книги.
select*
from books;
create index books
    on books (Price, NameBook);

-- 3.Создайте представление, в котором выберите из таблицы продажи все книг, стоимостью больше 55 грн.
CREATE VIEW Booksales
AS
select b.NameBook, s.Price
from books as b
         join sales as s on b.ID_BOOK = s.ID_BOOK
where s.Price > 55;

select*
from Booksales;
drop view Booksales;

-- 4.Для таблицы «Авторы» отключить кластеризированный индекс. Проверить возможность выбора данных из таблицы. Подключить обратно индекс.
DROP Index FirstName on authors;

insert
authors
(FirstName,LastName,ID_COUNTRY)
value('Aaaa','bbb',3);

create index FirstName on authors (FirstName);

-- 5.Написать представление, которое будет отображать информацию о книгах, которые имели тираж более 10 экземпляров.
CREATE VIEW Bookinfo
AS
select *
from books
where DravingOfBook > 5000;

-- 6. Написать представление, которое содержит информацию о суммах, на которые были проданы книги каждым магазином
CREATE VIEW BookSalesSum
as
select b.NameBook, sh.NameShop, sum(s.Price * s.Quantity) as totalSum
from sales as s
         join shops as sh on sh.ID_SHOP = s.ID_SHOP
         join books as b on s.ID_BOOK = b.ID_BOOK
group by sh.NameShop;

select *
from BookSaleSsum;

-- 7. Показать на экран среднее количество страниц по каждой из тематик, при этом показать только тематики, в которых среднее количество более 400.
CREATE VIEW AvgPagesThemes AS
SELECT NameTheme, AVG(Pages) as avgPages
FROM Books
         JOIN Themes T ON T.ID_THEME = Books.ID_THEME
GROUP BY NameTheme
having avgPages > 400;

SELECT *
FROM AvgPagesThemes;
