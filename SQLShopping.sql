create database shopping;
use shopping;
create table Customers(
 customerId int identity(1,1) primary key,
 address nvarchar(100),
 phone nvarchar(15),
 name nvarchar(100) not null,
 email varchar(100) unique,
);
insert into Customers(address , name , email)values
('qqqqq' , 'omer' , 'omer1@gmail.com'),
('qwqw' , 'ali' , 'ali2@gmail.com'),
('wewew' , 'hady' , 'hady4@gmail.com'),
('erer' , 'mohammed' , 'moh@gmail.com');
select * from Customers

create table Orderss(
 orderId int identity(1,1) primary key,
 custId int not null,
 totalAmount decimal(8,2) not null,
 date datetime,
 status nvarchar(10),
 foreign key (custId) references Customers(customerId),
);
insert into Orderss(custId ,totalAmount) values
(2 , 33.4),
(3 , 233.32),
(4 , 1.23)
select * from Orderss;

create table supplies(
 suppId int identity(1,1) primary key,
 contentInfo nvarchar(100),
 name nvarchar(100) not null,
);
insert into supplies(name)values
('asas'),
('qqq');
select * from supplies;

create table products(
 productId int identity(1,1) primary key,
 supplyId int not null,
 category nvarchar(100) unique not null ,
 name nvarchar(100) not null,
 describtion nvarchar(100),
 foreign key (supplyId) references supplies(suppId),
);
insert into products(supplyId , category , name)values
(1 , 'aaa' , 'nnn'),
(2 , 'ewew' , 'qwqw');
select * from products

create table orderDetails(
 ODID int identity(1,1) primary key,
 productID int not null,
 orderId int not null,
 quantity decimal(8,2) not null,
 price decimal(8,2) not null,
 foreign key (productID) references products(productId),
 foreign key (orderId) references Orderss (orderId),
);
insert into orderDetails(productID , orderId ,quantity , price)values
(4,1,1,44.5),
(4,3,3,232),
(3,3,4,12.8);

select * from orderDetails;

create table orderProduct(
 orderid int not null,
 productid int not null,
 name nvarchar(100) not null,
 content nvarchar(100),
 foreign key (orderid) references Orderss(orderId),
 foreign key (productid) references products(productId),
);
insert into orderProduct(orderid , productid , name)values
(3 ,4 , 'qwqw'),
(1 , 3 , 'wewe'),
(3 , 3 , 'ddd');
select * from orderProduct;

ALTER TABLE Products 
ADD rating INT DEFAULT 0

ALTER TABLE Products  
ADD CONSTRAINT category DEFAULT 'new' FOR category;

alter table products
drop column rating

alter table assignment.social_media.Users
drop constraint userId ;

drop table assignment.social_media.Users
select * from products;
drop database assignment


UPDATE Orderss  
SET date = GETDATE()  
WHERE orderId > 0;


DELETE FROM products  
WHERE name IS NOT NULL  
AND name <> 'Null';
