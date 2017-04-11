create database FunlerO ;
create table Teachers
(
name VARCHAR(50) NOT NULL, 
password VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
gender char,

PRIMARY KEY (email)
);

create table Courses 
(
name VARCHAR(20) NOT NULL, 
description  VARCHAR (500), 
crsCode VARCHAR (50),
teacherEmail  varchar(50)  ,

PRIMARY KEY (crsCode),
 Foreign Key(teacherEmail)References teachers (email)
);


create table Games 
(
gameName VARCHAR(50) NOT NULL, 
description  VARCHAR (500), 
diffcultyLevel varchar (10),
Newschema varchar (100),
crsCode varchar (50),

PRIMARY KEY (crsCode,gameName),
Foreign Key(crsCode) References Courses(crsCode)
);

create table Students 
(
name VARCHAR(50) NOT NULL, 
password VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
gender char,
coins int,
gameName varchar(50),
crsCode VARCHAR (50),

PRIMARY KEY (email), 
FOREIGN KEY (crsCode) REFERENCES Courses (crsCode),
Foreign Key(crsCode,gameName) References Games(crsCode,gameName)
);

create table Levels 
(
levelNum int ,
gameName VARCHAR(50) NOT NULL,  
crsCode varchar (50) NOT NULL,

PRIMARY KEY (crsCode,gameName,levelNum ),
Foreign Key(crsCode,gameName) References Games(crsCode,gameName)
);


create table Questions 
(
crsCode varchar (50),
gameName varchar (50),
levelNum int ,
questionNum int,
question VARCHAR(100) NOT NULL, 
correctAnswer  char, 
Newtime int,
answer1 varchar(50),
answer2 varchar(50),
answer3 varchar(50),
answer4 varchar(50),

PRIMARY KEY (crsCode,gameName,levelNum ,questionNum ),
Foreign Key(crsCode,gameName,levelNum) References Levels(crsCode,gameName,levelNum)
);


create table Achivements 
(
score int ,
gameName varchar(50),
crsCode varchar(50),
email varchar(50),

primary key (gameName),
foreign key(email) References Students(email) 
);



insert into Teachers values ("Randa","Randa.6111@hotmail.com","123456" , 'f');
select * from teachers;
insert into Courses values("course1", "crs1 description" , "crs1", "123456");

    select * from games ;
    select * from questions ;
    select * from levels ;
    select * from Students;
