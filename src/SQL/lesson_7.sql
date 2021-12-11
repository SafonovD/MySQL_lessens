use publishing;


-- 1 Создать хранимую процедуру, которая возвращает максимальное из двух чисел.
Delimiter |
Create procedure maxVal ( IN val1 int, in val2 int )
begin
declare result int default val2;

  IF (val1 > val2)
    THEN
        SET result = val1;
END IF;

select result;
end;
|

call maxVal(2,6); |

drop procedure getMaxValue; |
-- 2. Написать хранимую процедуру, которое будет отображать информацию
-- обо всех авторах из определенной страны, название которой передается в процедуру при вызове.

Create procedure getInfoAuthor (in Country varchar(40))
begin
select concat(FirstName,' ',LastName) as fulName from authors as a
                                                          join country as c
                                                               on c.ID_COUNTRY = a.ID_COUNTRY
WHERE c.NameCountry = Country;
end;
|
call getInfoAuthor('USA'); |
drop procedure getInfoAuthor;|


-- 3. Написать процедуру, позволяющую просмотреть все книги определенного
-- автора, при этом его имя передается при вызове.
Create procedure infoBookFromAuthor(in name varchar(30))
begin
select NameBook from books as b
                         join authors as a on a.ID_AUTHOR= b.ID_AUTHOR
where a.FirstName = name;
end;
|
call infoBookFromAuthor('Sam');|

-- 4. Функцию, которая возвращает самую дорогую книгу указанной тематики.
CREATE FUNCTION expensiveBook(themeName varchar(30))
    returns int
    DETERMINISTIC
begin
return (select max(b.Price) from books as b
                                     join themes as t on t.ID_THEME = b.ID_THEME
        where t.NameTheme = themeName);
end;
|

select NameBook from books
where Price = expensiveBook('Database theory'); |

-- 5.Написать функцию, которая выводит информацию о количестве авторов,
-- живущих в разных странах (название страны передается в качестве параметра). !!!!

CREATE FUNCTION numberByAuthor(countryName varchar(30))
    returns int
    DETERMINISTIC
begin
return (select count(*) as numbers from authors as a
                                            join country as c on a.ID_COUNTRY = c.ID_COUNTRY
        where c.NameCountry = countryName );
end;
|

select numberByAuthor('USA') from authors; |

-- 6 Функцию, которая возвращает количество магазинов, которые не продали ни одной книги
-- издательства.

CREATE FUNCTION salesBookbyShop(bookName varchar(30))
    returns int
    DETERMINISTIC
begin
return (select sh.NameShop from sales as s
                                    join books as b on s.ID_BOOK = b.ID_BOOK
                                    join shops as sh on sh.ID_SHOP = s.ID_SHOP
        where s.Quantity = 0 and b.NameBook = bookName);
end;
|

select salesBookbyShop('MS SQL 2017') from sales;