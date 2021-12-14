use publishing;


-- 1. Используя транзакцию добавьте несколько записей в любую из таблиц.
Start transaction;

insert into country
(NameCountry) value ('Germag'),('Russia');

insert into authors
(FirstName,LastName,ID_COUNRTY)
    value('привет','Мир',10),('hello','World',11);

commit;
-- 2. Используя транзакцию добавьте несколько записей в любую из таблиц, а потом откатите ее.
Start transaction;

insert into shops
(NameShop,ID_COUNTRY)
    value('OZON',12),('ebay',1);

INSERT INTO books
(NameBook, Price, DravingOfBook, Pages, Id_Theme, Id_Author)
VALUES ('First steps on PC', 59.99, 10000, 345, 1, 10),
       ('PC it is pro100', 29.99, 5000, 444, 1, 10),
       ('C++ for newbies', 35.99, 15000, 542, 2, 3),
       ('C++ for professional', 39.99, 25000, 245, 2, 3),
       ('Hacking on networks', 87.95, 27000, 454, 5, 10);

rollback;

-- 3. Используя транзакцию создайте точку, к кторой необходимо будет откатить транзакцию,
-- добавьте несколько записей в любую из таблиц, а потом откатите ее до этой точки.
Start transaction;

INSERT INTO themes
(NameTheme)VALUES
               ('Computer science'),
               ('Programming'),
               ('Web Development'),
               ('Database theory');
SAVEPOINT SavePointTran;

insert INTO books
(NameBook, Price, DravingOfBook, Pages, Id_Theme, Id_Author)
VALUES ('First steps on PC', 59.99, 10000, 345, 1, 10),
       ('PC it is pro100', 29.99, 5000, 444, 1, 10);

ROLLBACK TO SAVEPOINT SavePointTran;

COMMIT;

-- 4. Создайте триггер, который при удалении книги, копирует данные о ней в отдельную
-- таблицу "DeletedBooks".

Create table DeletedBooks
(id int not null  auto_increment primary key,
 BookName varchar(30)
);


DELIMITER |

CREATE TRIGGER delete_books
    before delete on books
    FOR EACH ROW
BEGIN
    insert into DeletedBooks
    ( BookName) select NameBook from books where id_book = old.ID_BOOK;
END;
|

DELETE FROM books WHERE ID_BOOK = 20;

select * from DeletedBooks;



