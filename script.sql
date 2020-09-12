drop schema business;
CREATE DATABASE business CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use business;
create table Staff(
    id int not null auto_increment primary key,
    first_name varchar(255),
    last_name varchar(255),
    age varchar(255),
    staff_id char(9) unique
);

create table Customers(
    id int not null auto_increment primary key,
    first_name varchar(255),
    last_name varchar(255),
    address varchar(255),
    phone_number char(12) unique
);

create table Stores(
    id int not null auto_increment primary key,
    store_name varchar(255),
    phone_number char(12),
    location varchar(255)
);

create table Products(
    id int not null auto_increment primary key,
    name varchar(255),
    country_of_origin varchar(255)
);

create table Orders(
    id int not null auto_increment primary key,
    num_of_orders int,
    products int not null,
    date_of_production datetime,
    expiration_date datetime,
    stores int not null
);

insert into Staff (first_name, last_name, age,staff_id) values
('Ivko','Ivkić',20,555543890),
('Stipo','Stipić',23,666643890),
('Adrijan','Adrijanski',21,666643891),
('Ana','Anić',20,555543891),
('Ema','Emić',23,555543892),
('Ivo','Ivković',25,555543895),
('Darko','Darkić',35,555543899),
('Leon','Lenić',30,555543995),
('Janko','Jankic',30,555563995),
('Marko','Markić',41,555576905),
('Kristijan','Lenić',30,555545999),
('Dodo','Donić',28,555543898);
select *from Staff;

insert into Customers (first_name, last_name, address,phone_number) values
('John','Braham','1153 Haven Lane','801-335-5811'),
('Liz','Stofus','1207 August Lane','801-301-7472'),
('Justin','Rosser','2713 Glendale Avenue','303-682-1230'),
('William','Sheard','1800 Harley Vincent Drive','641-861-1013'),
('Jonathon','Rogers','2518 Hart Ridge Road','734-462-6666'),
('Doris','Cannon','4892 Corbin Branch Road','734-748-2286'),
('Emily','Curcy','2620 Walton Street','617-905-4299');


insert into Stores(store_name,phone_number,location) values
('Cheese Relish','631-682-8709','731 Charter Street'),
('Cheesebea','516-954-4174','4929 Elliot Avenue'),
('Cheeseistic','509-663-3261','4565 Boone Crockett Lane'),
('Cheese Stand','509-669-0510','1062 Court Street'),
('Cheese Roll','606-301-6603','3561 Snowbird Lane'),
('Cheese Crisp','606-336-8075','4159 Willow Greene Drive'),
('Cheesevio','913-795-4409','3642 Chicago Avenue');

insert into Orders(num_of_orders,products,stores,date_of_production,expiration_date) values
(25,1,1,'2020-07-15 15:36:30','2020-10-22 16:30:22'),
(30,1,2,'2020-08-10 12:25:10','2020-12-15 17:20:33'),
(14,7,2,'2020-08-10 12:25:10','2021-01-15 14:11:25'),
(22,6,5,'2020-09-10 16:20:13','2021-02-08 09:15:30'),
(30,3,3,'2020-06-10 12:25:10', '2021-01-12 15:20:30'),
(50,4,3,'2020-06-10 12:25:10','2020-09-12 13:15:27'),
(26,5,5,'2020-05-07 14:28:12','2020-10-15 16:08:14'),
(15,2,4,'2020-06-10 12:25:10','2020-11-15 14:06:05');

insert into Products(name,country_of_origin) values
('Havarti','Denmark'),
('Trappist','Denmark'),
('Cheddar','England'),
('Feta','Greece'),
('Grana','Italy'),
('Gorgonzola','Italy'),
('Parmigiano-Reggiano','Italy'),
('Paški','Croatia'),
('Škripavac','Croatia'),
('Gouda','Italy');

create table Stores_staff(
    id int not null auto_increment primary key,
    stores int,
    staff int unique,
    foreign key (stores) references Stores(id),
    foreign key (staff) references Staff(id)
    on delete cascade
);

create table Customer_Orders(
  id int not null auto_increment primary key,
  customers int,
  products int,
  quantity int,
  foreign key (customers) references Customers(id),
  foreign key (products) references  Products(id)
  on delete cascade
);
create table Stores_Managers(
    id int not null auto_increment primary key,
    first_name varchar(255),
    last_name varchar(255),
    stores int,
    foreign key (stores) references Stores(id)
    on delete cascade
);
insert into Stores_staff(stores,staff) values
(1,1),
(1,2),
(3,5),
(4,4),
(5,6),
(6,7),
(6,8),
(7,12),
(7,11),
(6,9),
(2,10),
(2,3);



insert into Customer_Orders(customers, products, quantity) values
(1,2,3),
(2,4,2),
(2,3,5),
(2,6,2),
(1,3,5),
(1,3,6),
(4,3,3),
(3,3,4);

insert into Stores_Managers(first_name, last_name, stores) values
('Mary','Lowery',2),
('Velma','Weathers',1),
('Francis','Reed',3),
('Page','James',5),
('Brian','Jackson',6),
('Tracy','Lorenzo',4),
('Timothy','Green',7);

select * from Stores;

select Orders.num_of_orders,Stores.store_name, Products.name from (
(Orders inner join Stores on Orders.stores = Stores.id)
inner join Products on Orders.products = Products.id);


select Stores.store_name,COUNT(Staff.first_name) as  num_of_staff from (
(Stores_staff inner join Stores on Stores_staff.stores = Stores.id)
inner join Staff on Stores_staff.staff=Staff.id) group by Stores_staff.stores;

select CONCAT(Customers.first_name,' ',Customers.last_name) as Customer_name,Customers.address,Products.name,Customer_Orders.quantity from (
(Customers inner join Products on Customers.id=Products.id)
inner join  Customer_Orders on Customers.id=Customer_Orders.id);

delete from Stores_staff where staff=2;
select * from Stores_staff;


delete from Products where name='Gouda';
select * from Products;

delete from Products where country_of_origin='Croatia';
select * from Products;

delete from Customer_Orders where customers=2 and products=3;
select * from Customer_Orders;

delete from Staff where staff_id=555576905;
select * from Staff;

update Orders set num_of_orders=35 where stores=3 and products=3;
update Orders set num_of_orders=55 where stores=2 and products=1;
update Customer_Orders set quantity=5 where customers=3 and products=3;
update Products set country_of_origin='Bosnia and Herzegovina' where name='Havarti';
update Stores_Managers set first_name='Louisa', last_name='Naquin' where stores=4;

select FLOOR(AVG(age)) as Average_age_of_staff from Staff;
select first_name,last_name,MAX(age) as Age from Staff;
select first_name,last_name,MIN(age) as Age from Staff;
select SUM(num_of_orders) as Total_number_of_orders from Orders;


select Stores_Managers.first_name,Stores_Managers.last_name,Stores.store_name from (Stores_Managers inner join Stores on Stores_Managers.id=Stores.id);

select Orders.num_of_orders,Stores.store_name, Products.name from (
(Orders inner join Stores on Orders.stores = Stores.id)
inner join Products on Orders.products = Products.id);
