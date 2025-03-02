create database assignment;
create schema social_media;

use assignment;

create table social_media.Users(
  userId int identity(1,1) primary key,
  userName nvarchar(100),
  email varchar(100),
  BOD datetime,
  joinDate datetime default getutcdate(),
  gender nvarchar(10),
);

insert into social_media.Users(userName , email ,BOD , gender) values
('rawan' , 'rawan111@gmail.com' , 16/11/2003 ,'femal'),
('ali' , 'ali111@gmail.com' , 22/1/2000 ,'male'),
('ahmed' , 'ahmed111@gmail.com' , 16/6/1988 ,'male'),
('heba' , 'heba111@gmail.com' , 1/1/2005 ,'femal');

select * from social_media.Users ;

create table social_media.Posts(
  postId int identity(1,1) primary key,
  userId int not null,
  visibility nvarchar(10) check (visibility in
  ('visible' , 'hidden'))
  default 'visible',
  postDate datetime default getutcdate(),
  content nvarchar(200),
  foreign key (userId) references social_media.Users(userId),
);
insert into social_media.Posts(userId , visibility ) values
(1 , 'visible'),
(2 , 'hidden');
select * from social_media.Posts;

create table social_media.interaction(
  ineractionID int identity(1,1) primary key,
  userid int not null,
  type nvarchar(100),
  postId int not null,
  date datetime default getdate(),
  foreign key (userId) references social_media.Users(userId),
  foreign key (postId) references social_media.Posts(postId),
);
insert into social_media.interaction(userid , postId, type)values
(1 ,3 ,  'www'),
(3 ,4 ,'ccc');

select * from social_media.interaction;

create table social_media.interact(
  userId int not null,
  postId int not null,
  foreign key (userId) references social_media.Users(userId),
  foreign key (postId) references social_media.Posts(postId),
  CONSTRAINT pk PRIMARY KEY (userId, postId),
  );
  insert into social_media.interact(userId , postId)values
  (1 , 3),
  (2 , 4);
  select * from social_media.interact
