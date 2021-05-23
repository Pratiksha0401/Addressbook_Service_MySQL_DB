show databases;

#UC1 creqte database for addressbook
create database Addressbook_Service;
use Addressbook_service;

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
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
	VALUES ('Pranali', 'Badole', 'Sakoli', 'Bhandara', 'Maharashtra', '478904', '2546009787', 'pranali@gmail.com');
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
	VALUES ('Soniya', 'Mesharam', 'Tumser', 'Gondia', 'Utterpradesh', '563214', '7135669787', 'soniya@gmail.com');
INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID)
				VALUES ('Shital', 'Negi', 'Kota', 'Dehradun', 'Utterpradesh', '563200', '3335669787', 'negia@yahoo.com'),    
						('Minal', 'Rawat', 'Bajaj Complex', 'Bangalore', 'Karnataka', '500214', '9135688787', 'minal@rediffmail.com');    
select * from addressbook;  
alter table addressbook add ID int(3) not null auto_increment primary key first;  

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
select City,count(*) from addressbook where City = 'Bhandara';   #count 3
 
#getting the count in addressbook by  state name
select State,count(*) from addressbook where State = 'Maharashtra';   # count 3
 
#UC8 showing addressbook sorted alphabeticaly by name
select * from addressbook where city = 'Bhandara' order by FirstName;
select * from addressbook  order by FirstName;
 
#UC9 identify each addressbook with its name and type
Alter table AddressBook add AddressBookName varchar(45) Not Null after Email_Id;
Alter table AddressBook add AddressBookType varchar(45) Not Null after AddressBookName; 
 
Update AddressBook set AddressBookName= 'AddressBook1' where FirstName  = 'Minal' or FirstName  = 'Pranali';
Update AddressBook set AddressBookName ='AddressBook2' where FirstName  = 'Soniya' or FirstName  = 'Mayuri';
Update AddressBook set AddressBookName = 'AddressBook3' where FirstName  = 'Nikita' or FirstName  = 'Shital';
Update AddressBook set AddressBookType = 'Family' where FirstName  = 'Nikita'  or FirstName  = 'Pranali';
Update AddressBook set AddressBookType = 'Friends' where FirstName  = 'Mayuri' or FirstName  = 'Shital' ;
Update AddressBook set AddressBookType = 'Profession' where FirstName  = 'Minal' or FirstName  = 'Soniya';   
select * from addressbook; 

#UC 10 Ability to get count by type
Select Count(FirstName) From AddressBook where AddressBookType = 'Family' order by FirstName;		#Count 2
Select Count(FirstName) From AddressBook where AddressBookType = 'Friends' order by FirstName;		#Count 2
Select Count(FirstName) From AddressBook where AddressBookType = 'Profession' order by FirstName;	#Count 2


#creating different address books as family , friends amd profession ,all having reference of addressbook

 CREATE table FriendsAddressbook(
Friend_ID     int Not Null auto_increment,
AddressbookID int ,
Primary key (Friend_ID) ,
FOREIGN KEY (AddressbookID) REFERENCES AddressBook(ID) ON DELETE CASCADE
 );
insert into FriendsAddressbook (AddressbookID) values ('5'),('7');
select * from FriendsAddressbook;
 

CREATE table FamilyAddressbook(
Family_ID     int Not Null auto_increment,
AddressbookID int ,
Primary key (Family_ID) ,
FOREIGN KEY (AddressbookID) REFERENCES AddressBook(ID) ON DELETE CASCADE
 ); 
insert into FamilyAddressbook (AddressbookID) values ('2'),('3'); 
select * from FamilyAddressbook;
 

CREATE table ProfessionalAddressbook(
Profession_ID     int Not Null auto_increment,
AddressbookID int ,
Primary key (Profession_ID) ,
FOREIGN KEY (AddressbookID) REFERENCES AddressBook(ID) ON DELETE CASCADE
 );  
insert into ProfessionalAddressbook (AddressbookID) values ('4'),('6'); 
select * from ProfessionalAddressbook; 


#UC11 insert contact in familyaddressbook by using addressbook class
 INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID,AddressBookName,addressBookType)
					VALUES ('Rupali', 'Takhare', 'Paris Complex', 'Nagpur', 'Maharashtra', '481204', '9935009787', 'mayuri10@gmail.com', 'Addressbook1', 'Family');
select @@last_insert_id ;
insert into familyaddressbook (AddressbookID) values (@@last_insert_id);
select * from FamilyAddressbook;
select * from addressbook;


#UC 11 insert contact in friendsaddressbook by using addressbook class
 INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID,AddressBookName,addressBookType)
					VALUES ('Dipali', 'Shahare', 'Mahda Colony', 'Chandrapur', 'Maharashtra', '400204', '9555009787', 'shaharedipali@gmail.com', 'Addressbook3', 'Friend');
select @@last_insert_id ;
insert into friendsaddressbook (AddressbookID) values (@@last_insert_id);
select * from friendsaddressbook;
select * from Addressbook;
