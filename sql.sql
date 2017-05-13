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
teacherEmail varchar(50),
deleted bool,

PRIMARY KEY (crsCode,gameName),
Foreign Key(crsCode) References Courses(crsCode),
foreign key(teacherEmail) References Teachers(email) 

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

create table Comments 
(
	commentText varchar(200),
    gameName varchar(50),
    crsCode varchar(50),
    userEmail varChar(50),
  Foreign Key(crsCode,gameName) References Games(crsCode,gameName)
);

create table Collaborators
(
	gameName varchar(50),
    crsCode varchar(50),
    email varChar(50),
    primary key (gameName , crsCode , email),
Foreign Key(crsCode,gameName) References Games(crsCode,gameName),
    foreign key(email) References teachers(email) 

);

create table StudentCrs
(
	crsCode varchar(50),
    email varChar(50),
	foreign key(crsCode) references Courses(crsCode),
    foreign key(email) References students(email),
    primary key (email, crsCode) 
);

create table Notifications
(	
	notificationText varchar(200),
    gameName varchar(50),
    crsCode varchar(50),
   Foreign Key(crsCode,gameName) References Games(crsCode,gameName)
);


/*
create table StudentNotifications
(	
	email varchar(50),
	notificationText varchar(200),
    gameName varchar(50),
    crsCode varchar(50),
   Foreign Key(crsCode,gameName) References Games(crsCode,gameName),
       foreign key(email) References students(email)

);
create table TeacherNotifications
(	
	email varchar(50),
	notificationText varchar(200),
    gameName varchar(50),
    crsCode varchar(50),
   Foreign Key(crsCode,gameName) References Games(crsCode,gameName),
       foreign key(email) References Teachers(email)

);
*/

create table Commands   
(
	changeType	varchar(20),	/* execute/ undo */
	commandType varchar(20),       /* addCollaborator / Cancel */
    gameName varchar(50),
    crsCode varchar(50),
    
    email varchar (50),
    changeID int auto_increment ,
    primary key(changeID),
    Foreign Key(crsCode,gameName) References Games(crsCode,gameName),
	foreign key(email) References teachers(email) 
);


select * from students;
select * from Teachers;
select * from Courses;
select * from Games;

select * from commands;

