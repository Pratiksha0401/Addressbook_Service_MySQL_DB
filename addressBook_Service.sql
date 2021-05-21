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

#UC3 Ability to insert new Contact to Addressbook
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
	VALUES ('Mayuri', 'Makadey', 'Dalal Complex', 'Bhandara', 'Maharashtra', '441904', '2135469787', 'mayuri10@gmail.com');
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
	VALUES ('Nikita', 'Takhare', 'Javaharnagar', 'Bhandara', 'Maharashtra', '441904', '2135469787', 'nikitatakhre@gmail.com');
select * from addressbook;    

#UC4 Ability to edit contact using first name    
update addressbook set
					Address='Keshav Nagar',
                    City='Lakhani',
                    Zip='489750',
                    PhoneNo='5468971321',
                    Email_ID='mayuri@gmail.com'
				where FirstName='Mayuri';
select * from addressbook;

#UC5 Ability to delete contact using person's name
delete from addressbook where FirstName='Mayuri';
select * from addressbook;

INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
	VALUES ('Mayuri', 'Makadey', 'Dalal Complex', 'Bhandara', 'Maharashtra', '441904', '2135469787', 'mayuri10@gmail.com');

#UC6 ability to retrive person belonging to city or state from addressbook
select * from addressbook where City = 'Bhandara';
 select * from addressbook where State = 'Maharashtra';		
 
#UC7
#getting the count in addressbook by  city name
 select City,count(*) from addressbook where City = 'Bhandara';
 
  #getting the count in addressbook by  state name
 select State,count(*) from addressbook where State = 'Maharashtra'; 
 