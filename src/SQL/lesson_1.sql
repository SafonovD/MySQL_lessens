create database Cars_1;

use cars_1;

create table Car
(
    id int auto_increment primary key not null,
    mark varchar(20) not null,
    model varchar(20) not null,
    engine int not null,
    price int not null,
    max_speed int not null
);

insert into car
(mark,model,engine,price,max_speed)
values
    ('Audi', 'Q3', 1.8 , 20000, 200),
    ('Audi', 'Q5', 2.5 , 25000, 220),
    ('Audi', 'Q6', 3.0 , 40000, 250),
    ('BMW', '325', 2.4 , 24000, 220),
    ('BMW', '525', 2.4 , 30000, 220),
    ('Porsche', '911', 4.0, 100000,300);

select mark,model,max_speed from car;

select * from car
where mark = 'Audi';

select * from car
where mark = 'Audi' or mark = 'BMW';

select * from car
where max_speed in(200,300);

select * from car
where mark = 'Audi' and engine > 1.5;

select * from car
where mark like 'h%';

select * from car
where price in(20000, 25000 ,30000);

select * from car order by mark;

select * from car order by price;

select * from car order by price,engine;

SELECT * FROM car ORDER BY max_speed DESC;

select mark, SUM(price) as Coast from car
where mark = 'Audi'
group by mark;

select count(*) as total_count
from car where mark = 'BMW'
group by model
having model = 525;

select mark,max_speed as speed, price as total,count(*) as total
from car where mark = 'Audi'
group by mark
having speed < 230 ;

SELECT mark, avg(max_speed) AS AVERAGE_SPEED
from car where mark = 'Porsche'
group by mark;

Update car
set max_speed = 500
where mark = 'Audi';

delete from car where price = '20000';
