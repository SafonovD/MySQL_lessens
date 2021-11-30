Create DATABASE warehouse;

USE warehouse;

create table suppliers
(
    id int auto_increment not null,
    name varchar(20) not null,
    adress varchar(20) not null,
    primary key(id)
);

insert into suppliers
(name,adress)
values
    ("Apple","USA"),
    ("AliExpress","China"),
    ("Ozon","Russia");

create table staff
(
    id int auto_increment not null,
    name varchar(20) not null,
    age varchar(20) not null,
    phone varchar(25) DEFAULT 'Unknown',
    primary key(id)
);

insert into staff
(name,age,phone)
values
    ('Aleksey','54','89521548'),
    ('Boris','28','86715488'),
    ('Vasiliy','36','78521548');


create table Customers
(
    id int auto_increment not null,
    name varchar(20) not null,
    phone varchar(25) DEFAULT 'Unknown',
    primary key(id)
);

insert into Customers
(name,phone)
values
    ('Aleksey','89521548'),
    ('Boris','86715488'),
    ('Vasiliy','78521548');


create table warehouse_id
(
    suppliers_id int not null,
    Staff_id int not null,
    Customers_id int not null,
    Primary key(suppliers_id,Staff_id,Customers_id),
    foreign key(suppliers_id) references suppliers(id),
    foreign key(Staff_id) references Staff(id),
    foreign key(Customers_id) references Customers(id)
);

insert into warehouse_id
(suppliers_id,Staff_id,Customers_id)
values
    (1,1,1),
    (2,1,1),
    (2,1,3),
    (3,2,1);

select * from suppliers;
select * from staff;
select * from Customers;
select * from warehouse_id;

create table parashute
(
    id int auto_increment primary key not null,
    Staff_id int not null unique,
    serial int not null,
    foreign key(Staff_id) references Staff(id)
);

-- 1 к 1

insert into parashute
(Staff_id,serial)
    value
    (1,234567),
(2,8746598);

select * from parashute;
select*from staff;

create table product
(
    id int auto_increment primary key not null,
    suppliers_id int not null,
    Product_Name varchar(30) not null,
    serial_number int not null,
    foreign key(suppliers_id) references suppliers(id)
);

insert into product
(suppliers_id,Product_Name,serial_number)
    value
    (1,'Nokia',59874698),
(1,'Samsung',945699),
(2,'Simens',945699),
(3,'Samsung',945699);

select * from product;
select * from suppliers;




