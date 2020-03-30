create database travel;
use travel;

create table `City`
(
    id              int not null primary key,
    `NameOfCity` varchar(255)
);

create table `Address`
(
    id               int          not null primary key,
    `name of address`   varchar(255) not null,
    `Review`          varchar(255) not null,
    `Price` int          not null,
    `City_id`   int,
    foreign key (`City_id`) references `City` (id)
);

create table `Customers`
(
    id             int          not null primary key,
    `Name`          varchar(255) not null,
    `My Number`  int          not null,
    `BirthYear`     int          not null,
    `City_id` int,
    foreign key (`City_id`) references `City` (id)
);

create table tour
(
    id                    int  not null primary key,
    `tour code`             int  not null,
    `type of tour_id`        int  not null,
    foreign key (`type of tour_id`) references `tour type` (id),
    `address_id` int  not null,
    foreign key (`address_id`) references `Address` (id),
    `day to start`        date not null,
    `day to end`       date not null
);

create table `tour type`
(
    id         int          not null primary key,
    `type code`  int          not null,
    `type name` varchar(255) not null
);

create table `Bill`
(
    tour_id         int not null,
    foreign key (tour_id) references tour (id),
    `Customers_id` int not null,
    foreign key (`Customers_id`) references `Customers` (id),
    `Status`    varchar(255)
);


insert into `City`
values (1, 'Hà Nội'),
       (2, 'Nghệ An'),
       (3, 'Đà Nẵng'),
       (4, 'Đà Lạt'),
       (5, 'Cà Mau');
select *
from `City`;

insert into `Address`
values (1, 'Nhà tôi', 'Đẹp', 200000, 1),
       (2, 'Chợ Đồng Xuân  ', 'Đắt', 300000, 1),
       (3, 'Quê bác Hồ', 'rộng', 500000, 2),
       (4, 'Sapa', 'Lạnh', 1500000, 1),
       (5, 'Đà Lạt', 'Đẹp', 500000, 4);

select *
from `Address`;

insert into `Customers`
values (1, 'Long', 123, 1999, 1),
       (2, 'Hiền', 234, 2000, 2),
       (3, 'Kiều Anh ', 456, 1992, 1),
       (4, 'Dũng1', 567, 1995, 2),
       (5, 'Dũng2', 678, 1995, 1),
       (6, 'Kế Anh', 789, 2001, 1),
       (7, 'Thế Anh', 901, 2000, 2),
       (8, 'Đoán', 112, 1993, 3),
       (9, 'Thơ', 211, 1994, 5),
       (10, 'Phong', 212, 1997, 1);

select *
from `Customers`;

insert into `tour type`
values (1, 6397, 'person'),
       (2, 22298, 'Company');

select *
from `tour type`;

insert into tour
values (1, 23213, 2, 1, '2020-03-23', '2020-04-23'),
       (2, 23553, 2, 2, '2020-03-23', '2020-04-23'),
       (3, 54644, 2, 3, '2020-03-23', '2020-04-23'),
       (4, 12013, 2, 5, '2020-03-23', '2020-04-23'),
       (5, 34346, 2, 5, '2020-03-23', '2020-04-24'),
       (6, 93533, 2, 3, '2020-03-23', '2020-04-24'),
       (7, 34765, 2, 2, '2020-03-23', '2020-04-24'),
       (8, 55657, 2, 1, '2020-03-23', '2020-04-24'),
       (9, 23424, 1, 1, '2020-03-23', '2020-04-24'),
       (10, 74576, 1, 2, '2020-03-23', '2020-04-24'),
       (11, 6755, 1, 3, '2020-03-23', '2020-04-24'),
       (12, 4534, 1, 5, '2020-03-23', '2020-04-25'),
       (13, 9787, 1, 5, '2020-03-23', '2020-04-25'),
       (14, 3543, 1, 3, '2020-03-23', '2020-04-25'),
       (15, 5355, 1, 2, '2020-03-23', '2020-04-25');

select *
from tour;

insert into `Bill`
values (3, 1, 'Paid'),
       (1, 3, 'Paid'),
       (5, 2, 'Paid'),
       (8, 4, 'Paid'),
       (3, 5, 'Not pay yet'),
       (9, 6, 'Not pay yet'),
       (13, 8, 'not pay yet'),
       (4, 7, 'not pay yet'),
       (7, 9, 'nt pay yet'),
       (11, 10, 'paid');

select *
from `Bill`;

select `NameOfCity`, count(`NameOfCity`) AS 'Count tour'
from tour
         join `Address` `A` on tour.`address_id` = `A`.id
         join `City` `t p` on `A`.`City_id` = `t p`.id
group by `NameOfCity`;

select count(`day to start`) 'the tour be started in march'
from tour
where (month(`day to start`) = '03');

select count(`day to end`) 'The tour be ended in april'
from tour
where (month(`day to end`) = '04');
