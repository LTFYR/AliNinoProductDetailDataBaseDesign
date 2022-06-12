create database BooksDB

use BooksDB

create table Books
(
Id int primary key identity,
Name nvarchar(50) not null,
PublishedBy nvarchar(90),
Genre nvarchar(40),
Price decimal(6,2),
DiscountedPrice decimal(6,2),
[Description] nvarchar(max),
Rate tinyint,
[PageCount] int,
isAvailable bit,
CampaignId int foreign key references Campaigns(Id)
)

alter table Books
add BookDetailId int foreign key references BookDetails(Id)

select * from Books

alter table Books
drop column PublishedBy

alter table Books
drop column Genre

alter table Books
drop column Author

alter table Books
drop column PageCount


create table BookDetails
(
Id int primary key identity,
Article int,
Label nvarchar(30),
Genre nvarchar(50),
PublishedBy nvarchar(90),
Pages smallint,
Series nvarchar(50),
Auhtor nvarchar(100)
)

create table Bindings
(
Id int primary key identity,
[Name] nvarchar(100)
)

create table Languages
(
Id int primary key identity,
[Name] nvarchar(100)
)

create table BooksBindings
(
Id int primary key identity,
LanguageId int foreign key references Languages(Id),
BooksId int foreign key references Books(Id)
)

alter table BooksBindings
drop column LanguageId

create table BooksLanguages
(
Id int primary key identity,
LanguageId int foreign key references Languages(Id),
BooksId int foreign key references Books(Id)
)

insert into Books
values('İnsan nə ilə yaşayır','Qanun Nəşriyyatı','Mini Klassika',2.79,NULL,'Lev Tolstoy bu əsəri İncildən götürülmüş sitatlar əsasında yazıb. Burada günah işlətmiş mələyin "İnsan nə ilə yaşayır?" sualına cavab tapmalı olmasından danışılır. O, sualın cavabını tapmasa, səmaya qayıda bilməyəcək. İnsanlar arasında yaşayıb, insan həyatının həqiqi mənasını anlamağa çalışacaq. Sualın cavabı isə çoх sadədir: Sevgi! İnsan sevgi ilə yaşayır.',5,280,Null,Null,'Lev Nikolayeviç Tolstoy','C:Myfiles/TestImage')

alter table Books
add Author nvarchar(50)

alter table Books
add Image nvarchar(100)

create table Campaigns
(
Id int primary key identity,
Sale tinyint
)

create table OrderBooks
(
Id int primary key identity,
BooksId int foreign key references Books(Id),
OrderId int foreign key references Orders(Id)
)


create table Comments
(
Id int primary key identity,
[Message] text,
[Date] smalldatetime,
Rate tinyint,
UserId int foreign key references Users(Id),
BookId int foreign key references Books(Id)
)

create table Users
(
Id int primary key identity,
Username nvarchar(50),
Email nvarchar(50) unique,
[Name] nvarchar(50),
Surname nvarchar(50),
Thumb nvarchar(50)
)

create table Orders
(
Id int primary key identity,
ProductDetailId int foreign key references ProductDetail(Id),
Amount tinyint,
[Date] smalldatetime,
Price decimal(6,2),
Total decimal(7,2),
UserId int foreign key references Users(Id)
)

create table ProductDetail
(
Id int primary key identity,
[Name] nvarchar(50) not null,
[Image] nvarchar(100),
Amount tinyint,
Total decimal(6,2)
)

create table Settings
(
Id int primary key identity,
Logo nvarchar(100),
FBUrl nvarchar(100),
IGUrl nvarchar(100),
YbUrl nvarchar(100),
TwtUrl nvarchar(100),
TelegramUrl nvarchar(100),
Telephones int,
WpUrl nvarchar(100)
)


insert into Settings
values('AliNino','facebook.com','instagram.com','youtube.com','twitter.com','telegram.com',(99412 + '' + 431 + '' + 40 + '' + 67),'whatsapp.com')