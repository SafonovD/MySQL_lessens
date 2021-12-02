Create database Publishing;
use Publishing;

create table book
(
    book_id int primary key auto_increment not null,
    NameBook varchar(30) not null,
    NameTheme varchar(30) not null,
    Autor_id int not null,
    foreign key(Autor_id) references Autor(Autor_id)
);

create table bookDetails
(
    bookDetails_id int not null,
    PriceOfBook int not null,
    DrawingOfBook int not null,
    Pages int not null,
    foreign key(bookDetails_id) references book(book_id)
);

create table orderDetails
(
    orderDetails_id int not null auto_increment primary key,
    book_id int not null,
    Autor_id int not null,
    Price int not null,
    Quantity int not null,
    Shop_id int not null,
    foreign key(book_id) references book(book_id),
    foreign key(Autor_id) references Autor(Autor_id),
    foreign key(Shop_id) references Shop(Shop_id)
);

create table shop
(
    Shop_id int not null primary key auto_increment,
    NameShop varchar(30) not null,
    NameCountry varchar(30) not null
);

create table Autor
(
    Autor_id int not null primary key auto_increment,
    FirstName varchar(30) not null,
    LastName varchar(30) not null,
    NameCountry varchar(30) not null
);
