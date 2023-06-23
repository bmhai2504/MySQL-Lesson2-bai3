create database lesson2_bai3;

use lesson2_bai3;

create table class(
	classID int not null primary key auto_increment,
    className varchar(60) not null,
    startDate datetime not null,
    statusClass bit
);

create table student(
	studentID int not null primary key auto_increment,
    studentName varchar(30) not null,
    address varchar (50),
    phoneNumber varchar(20),
    statusStudent bit,
    classID int not null,
    foreign key(classID) references class(classID)
);

create table subject(
	subID int not null primary key auto_increment,
    subName varchar(30) not null,
    credit tinyint not null default 1 check ( credit >= 1),
    statuSubj bit default 1
);

create table mark(
	markID int not null primary key auto_increment,
    subID int not null,
    studentID int not null,
    mark float default 0 check ( mark between 0 and 100),
    unique key( subID, studentID ),
    foreign key ( subID ) references subject(subID),
    foreign key ( studentID ) references student(studentID)
);