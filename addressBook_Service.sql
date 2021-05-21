show databases;

#UC1 creqte database for addressbook
create database Addressbook_Service;

#UC2 create address book table with its attributes
create table addressbook 
(
	FirstName varchar(20) not null, 
    LastName varchar(20) not null, 
	Address varchar(50) not null, 
    City varchar(20) not null, 
    State varchar(20) not null, 
	Zip varchar(6) not null, 
    PhoneNo varchar(12) not null, 
    Email_ID char(50) not null
);
describe addressbook;
					