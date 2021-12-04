use publishing;
-- 1
select concat(a.FirstName,a.LastName) as Author,b.NameBook from Books as b
                                                                    join Authors as a
                                                                         on a.ID_AUTHOR = b.ID_AUTHOR;
-- 2
select NameBook, Pages From Books
where Pages >500 and Pages < 650;
-- 3
select NameBook From Books
where NameBook LIKE  'C%'  or 'A%';
-- 4
select b.NameBook from Books as b
                           join Themes as t
                                on b.ID_THEME = t.ID_THEME
where NameTheme <> 'Programming' and DravingOfBook > 20;

-- 5
select NameBook,Price from Books
where Price < 30;

-- 6
select NameBook from Books
where NameBook like 'C++%' and NameBook <> '%PC';

-- 7
select b.NameBook,t.NameTheme,concat(a.FirstName, a.LastName) as Author from Books as b
                                                                                 join Themes as t
                                                                                      on t.ID_THEME = b.ID_THEME
                                                                                 join Authors as a
                                                                                      on b.ID_AUTHOR = a.ID_AUTHOR
where (b.Price / b.Pages) < 10;

-- 8
select s.NameShop from Shops as s
                           join Country as c
                                on s.ID_COUNTRY = c.ID_COUNTRY
where c.NameCountry = 'Ukraine';
