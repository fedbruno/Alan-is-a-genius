-----------------------------------------------------------------------------------
-- Postgres pgAdmin IV create, load, and query script for Fictional Database System
-- SQL statements for the Girl Scouts Database
-- Developer: Federica Bruno
-- Assignment: Database Mangement 308 Final Project
-- Tested on Postgres 9.3.2
------------------------------------------------------------------------------------
-------------------
--Drop Statements--
-------------------

DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Council;
DROP TABLE IF EXISTS Council_President;
DROP TABLE IF EXISTS Council_Treasurer;
DROP TABLE IF EXISTS ServiceUnit;
DROP TABLE IF EXISTS SU_Manager;
DROP TABLE IF EXISTS SU_ActivityConsultant;
DROP TABLE IF EXISTS SU_CookieCoordinator;
DROP TABLE IF EXISTS SU_Registrar;
DROP TABLE IF EXISTS Troop;
DROP TABLE IF EXISTS Troop_Volunteers;
DROP TABLE IF EXISTS Troop_Leader;
DROP TABLE IF EXISTS Troop_CoLeader;
DROP TABLE IF EXISTS Scout;
DROP TABLE IF EXISTS Girls;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS Events_Attended;
DROP TABLE IF EXISTS Badges;
DROP TABLE IF EXISTS Badges_Earned;

---------------------
--Create Statements--
---------------------

--People--
CREATE TABLE People(
    PID char(8) NOT NULL,
    First_Name text NOT NULL,
    Last_Name text NOT NULL,
    Gender char(1) NOT NULL,
    Yrs_of_Membership int,
    DOB date NOT NULL,
   CONSTRAINT check_gender CHECK (gender = 'M' or gender = 'F'),
   primary key(PID)
);


--Council--
CREATE TABLE Council(
    Council_Name text NOT NULL, 
    State text, 
    Headquarters text NOT NULL,
   primary key (Council_Name)
);

--Council President--
CREATE TABLE Council_President(
    PID char(8) NOT NULL references People(PID),
    Council_Name text NOT NULL references Council(Council_Name),
   primary key(PID, Council_Name)
);

--Council Treasurer--
CREATE TABLE Council_Treasurer(
    PID char(8) NOT NULL references People(PID),
    Council_Name text NOT NULL references Council(Council_Name),
   primary key(PID, Council_Name)
);

--ServiceUnit--
CREATE TABLE ServiceUnit(
	ServiceUnitID int NOT NULL,
	Council_Name text NOT NULL references Council(Council_Name),
	ServiceUnit_Name text NOT NULL,
   primary key(ServiceUnitID)
);

--SU_Manager--
CREATE TABLE SU_Manager(
    PID char(8) NOT NULL references People(PID),
    ServiceUnitID int NOT NULL references ServiceUnit(ServiceUnitID),
   primary key(PID, ServiceUnitID)
);

--SU_ActivityConsultant--
CREATE TABLE SU_ActivityConsultant(
    PID char(8) NOT NULL references People(PID),
    ServiceUnitID int NOT NULL references ServiceUnit(ServiceUnitID),
   primary key(PID, ServiceUnitID)
);

--SU_CookieCoordinator--
CREATE TABLE SU_CookieCoordinator(
    PID char(8) NOT NULL references People(PID),
    ServiceUnitID int NOT NULL references ServiceUnit(ServiceUnitID),
   primary key(PID, ServiceUnitID)
);

--SU_Registrar--

CREATE TABLE SU_Registrar(
    PID char(8) NOT NULL references People(PID),
    ServiceUnitID int NOT NULL references ServiceUnit(ServiceUnitID),
   primary key(PID, ServiceUnitID)
);

--Troop--
CREATE TABLE Troop(
	TroopID int NOT NULL,
	ServiceUnitID int NOT NULL references ServiceUnit(ServiceUnitID),
   primary key(TroopID)
);

--Troop_Leader--
CREATE TABLE Troop_Leader(
    PID char(8) NOT NULL references People(PID),
   	TroopID int NOT NULL references Troop(TroopID),
   primary key(PID, TroopID)
);

--Troop_CoLeader--
CREATE TABLE Troop_CoLeader(
    PID char(8) NOT NULL references People(PID),
   	TroopID int NOT NULL references Troop(TroopID),
   primary key(PID, TroopID)
);

--Troop_Volunteers--
CREATE TABLE Troop_Volunteers(
    PID char(8) NOT NULL references People(PID),
   	TroopID int NOT NULL references Troop(TroopID),
   primary key(PID, TroopID)
);

--Staff--
CREATE TABLE Staff(
    PID char(8) NOT NULL references People(PID),
    Position_Title text NOT NULL,
   primary key (PID)
);


--Scout--
CREATE TABLE Scout(
	Scout_Level text NOT NULL,
	Start_Age int NOT NULL,
	End_Age int NOT NULL,
   primary key(Scout_Level)
);

--Girls--
CREATE TABLE Girls(
	PID char(8) NOT NULL references People(PID),
	TroopID int NOT NULL references Troop(TroopID),
	Scout_Level text NOT NULL references Scout(Scout_Level),
   	Bridging_Memeber boolean,
   primary key(PID, TroopID)
);

--Events--
CREATE TABLE Events(
	Event_Category text NOT NULL,
	Description text, 
   primary key(Event_Category)
);

--Events_Attended--
CREATE TABLE Events_Attended(
	PID char(8) NOT NULL references People(PID),
	Event_Category text NOT NULL references Events(Event_Category),
   primary key(PID, Event_Category)
);

--Badges--
CREATE TABLE Badges(
	Badge_Name text NOT NULL,
	Event_Category text NOT NULL references Events(Event_Category),
	Scout_Level text NOT NULL references Scout(Scout_Level),
   primary key(Badge_Name)
);


--Badged_Earned--
CREATE TABLE Badges_Earned(
	PID char(8) NOT NULL references People(PID),
	Badge_Name text NOT NULL references Badges(Badge_Name),
   primary key(PID, Badge_Name)	
); 

--------------------
--Insert Statements--
--------------------

--People--
INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P100', 'Monica', 'MacClery', 'F', '8', '2004-02-07'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P111', 'Cathleen', 'Whitaker', 'F', '3', '2009-09-12'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P112', 'Corinne', 'Peterson', 'F', '1', '2011-08-11'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P113', 'Sunny', 'Walsh', 'F', '2', '2005-11-03'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P114', 'Ariel', 'Parks', 'F', '1', '2012-02-22'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P115', 'Faith', 'Hunt', 'F', '1', '2011-05-10'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P116', 'Lila', 'Morris', 'F', '10', '2002-10-28'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P117', 'Frances', 'May', 'F', '4', '2008-12-03'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P118', 'Larissa', 'Cooke', 'F', '1', '2001-02-14'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P119', 'Bailey', 'Ackerman', 'F', '3', '2006-04-20'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P120', 'Christina', 'Cullen', 'F', '6', '2003-01-09'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P121', 'Elena', 'Lowry', 'F', '2', '2009-08-14'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P122', 'Tiffany', 'Mathews', 'F', '4', '2008-03-16'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P123', 'Claire', 'Pierson', 'F', '1', '2012-03-29'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P124', 'Beatrix', 'Hobson', 'F', '5', '2007-09-26'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P125', 'Casey', 'Arnold', 'F', '1', '2010-10-15'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P126', 'Zoe', 'Murphy', 'F', '9', '2000-04-09'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P127', 'Penelope', 'Potter', 'F', '3', '2006-10-07'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES	('P128', 'Alan', 'Labouseur', 'F', '7', '2005-03-10'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P129', 'Brandie', 'Vincent', 'F', '9', '2001-04-08'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P130', 'Melissa', 'Tuft', 'F', '12', '1973-03-26'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P131', 'Sophie', 'Williams', 'F', '3', '1972-07-28'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P132', 'Kylie', 'Stone', 'F', '4', '1986-06-11'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P133', 'Kasandra', 'Devin', 'F', '11', '1978-01-10'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P134', 'Alexa', 'Boyle', 'F', '14', '1975-10-31'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P135', 'Miranda', 'Rounds', 'F', '8', '1973-10-11'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P136', 'Erica', 'Garnet', 'F', '4', '1976-09-02'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P137', 'Autumn', 'Pearson', 'F', '9', '1971-03-22'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P138', 'Brooke', 'Clark', 'F', '2', '1987-01-26'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P139', 'Kerrie', 'Herbert', 'F', '7', '1981-06-19'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P140', 'David', 'Washington', 'M', '5', '1983-08-20'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P141', 'Michael', 'Sterling', 'F', '9', '1985-12-31'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P142', 'Evan', 'Fletcher', 'F', '13', '1968-02-25'
	);
	
INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P143', 'Dona', 'Tate', 'F', '12', '1979-11-20'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P144', 'Jeffery', 'Thomas', 'F', '3', '1978-05-21'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P145', 'Adele', 'Rakes', 'F', '4', '1967-04-18'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P146', 'Angela', 'Fairfield', 'F', '11', '1973-07-05'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P147', 'Mitch', 'Bourne', 'M', '14', '1972-02-14'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P148', 'Richard', 'Darwin', 'M', '8', '1970-06-19'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P149', 'Victoria', 'Hawkins', 'F', '10', '1967-05-11'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P150', 'Toby', 'Beckham', 'M', '9', '1973-12-14'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P151', 'Ken', 'Nielson', 'M', '2', '1977-01-24'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P152', 'Lauren', 'Clark', 'F', '7', '1969-05-16'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P153', 'Jolie', 'Noel', 'F', '5', '1972-04-23'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P154', 'Jake', 'Robin', 'M', '9', '1974-02-04'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P155', 'Steven', 'Emerson', 'M', '3', '1976-11-23'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P156', 'Kendra', 'Suthers', 'F', '1', '1977-03-05'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P157', 'Zack', 'Pine', 'M', '13', '1968-07-31'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P158', 'Bret', 'Read', 'M', '10', '1973-04-07'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P159', 'Hailey', 'Venture', 'F', '12', '1971-04-07'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P160', 'Connor', 'Fletcher', 'M', '9', '1969-06-27'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P161', 'Kim', 'Dunn', 'F', '4', '1971-09-04'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P162', 'Macy', 'Peck', 'F', '5', '1976-07-05'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P163', 'Meredith', 'Ness', 'F', '7', '1970-11-20'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P164', 'Adam', 'Croft', 'M', '9', '1967-10-02'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P165', 'Brooke', 'Foss', 'F', '11', '1971-01-06'
	);

INSERT INTO People (PID, First_Name, Last_Name, Gender, Yrs_of_Membership, DOB)
	VALUES ('P166', 'John', 'Lock', 'M', '11', '1975-06-13'
	);

--Council--
INSERT INTO Council (Council_Name, Headquarters, State)
	VALUES ('Girl Scouts of Central California South', 'Fresno', DEFAULT
	);

INSERT INTO Council (Council_Name, Headquarters, State)
	VALUES ('Girl Scouts of Californias Central Coast', 'Camarillo', DEFAULT
	);

INSERT INTO Council (Council_Name, Headquarters, State)
	VALUES ('Girl Scouts of Northern California', 'San Jose', DEFAULT
	);	
	
INSERT INTO Council (Council_Name, Headquarters, State)
	VALUES ('Girl Scouts of Greater Los Angeles', 'Los Angeles', DEFAULT
	);

INSERT INTO Council (Council_Name, Headquarters, State)
	VALUES ('Girl Scout Council of Orange County', 'Irvine', DEFAULT
	);

INSERT INTO Council (Council_Name, Headquarters, State)
	VALUES ('Girl Scouts San Diego', 'San Diego', DEFAULT
	);
	
--Council_President--
INSERT INTO Council_President (PID, Council_Name)
	VALUES ('P149', 'Girl Scouts of Northern California'
	);

INSERT INTO Council_President (PID, Council_Name)
	VALUES ('P152', 'Girl Scout Council of Orange County'
	);

INSERT INTO Council_President (PID, Council_Name)
	VALUES ('P147', 'Girl Scouts of Greater Los Angeles'
	);
	
INSERT INTO Council_President (PID, Council_Name)
	VALUES ('P166', 'Girl Scouts San Diego'
	);

--Council_Treasurer--
INSERT INTO Council_Treasurer (PID, Council_Name)
	VALUES ('P143', 'Girl Scouts of Northern California'
	);

INSERT INTO Council_Treasurer (PID, Council_Name)
	VALUES ('P161', 'Girl Scout Council of Orange County'
	);
	
INSERT INTO Council_Treasurer (PID, Council_Name)
	VALUES ('P148', 'Girl Scouts of Greater Los Angeles'
	);

INSERT INTO Council_Treasurer (PID, Council_Name)
	VALUES ('P150', 'Girl Scouts San Diego'
	);

--ServiceUnit--
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (378, 'Annadale', 'Girl Scouts of Central California South'
	);

INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (128, 'Maple Lakes', 'Girl Scouts San Diego'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (129, 'Bloomington', 'Girl Scouts San Diego'
	);

INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (467, 'Northern Woods', 'Girl Scout Council of Orange County'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (468, 'Monticello', 'Girl Scout Council of Orange County'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (469, 'Stone Arch', 'Girl Scout Council of Orange County'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (135, 'Shingle Creek', 'Girl Scouts of Northern California'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (136, 'White Water', 'Girl Scouts of Northern California'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (679, 'Robinsondale', 'Girl Scouts of Californias Central Coast'
	);
	
INSERT INTO ServiceUnit (ServiceUnitID, ServiceUnit_Name, Council_Name)
	VALUES (752, 'Cambridge', 'Girl Scouts of Greater Los Angeles'
	);

--SU_Manager--
INSERT INTO SU_Manager (PID, ServiceUnitID)
	VALUES ('P159', 136
	);

INSERT INTO SU_Manager (PID, ServiceUnitID)
	VALUES ('P145', 467
	);

INSERT INTO SU_Manager (PID, ServiceUnitID)
	VALUES ('P158', 752
	);

INSERT INTO SU_Manager (PID, ServiceUnitID)
	VALUES ('P156', 129
	);

--SU_ActivityConsultant--
INSERT INTO SU_ActivityConsultant (PID, ServiceUnitID)
	VALUES ('P155', 136
	);

INSERT INTO SU_ActivityConsultant (PID, ServiceUnitID)
	VALUES ('P144', 467
	);

INSERT INTO SU_ActivityConsultant (PID, ServiceUnitID)
	VALUES ('P146', 752
	);

INSERT INTO SU_ActivityConsultant (PID, ServiceUnitID)
	VALUES ('P157', 129
	);

--SU_CookieCoordinator--
INSERT INTO SU_CookieCoordinator (PID, ServiceUnitID)
	VALUES ('P160', 136
	);

INSERT INTO SU_CookieCoordinator (PID, ServiceUnitID)
	VALUES ('P162', 467
	);

INSERT INTO SU_CookieCoordinator (PID, ServiceUnitID)
	VALUES ('P154', 752
	);

INSERT INTO SU_CookieCoordinator (PID, ServiceUnitID)
	VALUES ('P153', 129
	);

--SU_Registrar--
INSERT INTO SU_Registrar (PID, ServiceUnitID)
	VALUES ('P151', 136
	);

INSERT INTO SU_Registrar (PID, ServiceUnitID)
	VALUES ('P161', 467
	);

INSERT INTO SU_Registrar (PID, ServiceUnitID)
	VALUES ('P160', 752
	);

INSERT INTO SU_Registrar (PID, ServiceUnitID)
	VALUES ('P162', 129
	);

--Troops--
INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES ( 3457, 752
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (1369, 752 
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (2689, 135
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (1213, 135
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (2679, 135 
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (2346, 679
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (1248, 136
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (3579, 469
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (1602, 468
	);

INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (9527, 467
	);
	
INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (4125, 129 
	);
	
INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (8176, 128
	);
	
INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (7836, 128
	);
	
INSERT INTO Troop (TroopID, ServiceUnitID)
	VALUES (6281, 378 
	);
	
--Troop_Leader--
INSERT INTO Troop_Leader (PID, TroopID)
	VALUES ('P137', 1213
	);

INSERT INTO Troop_Leader (PID, TroopID)
	VALUES ('P131', 1602
	);

INSERT INTO Troop_Leader (PID, TroopID)
	VALUES ('P135', 1369
	);

--Troop_CoLeader--
INSERT INTO Troop_CoLeader (PID, TroopID)
	VALUES ('P130', 1602
	); 

INSERT INTO Troop_CoLeader (PID, TroopID)
	VALUES ('P139', 1602
	); 

INSERT INTO Troop_CoLeader (PID, TroopID)
	VALUES ('P132', 1213
	); 

INSERT INTO Troop_CoLeader (PID, TroopID)
	VALUES ('P136', 1213
	); 

INSERT INTO Troop_CoLeader (PID, TroopID)
	VALUES ('P140', 1369
	); 

--Troop_Volunteers--
INSERT INTO Troop_Volunteers (PID, TroopID)
	VALUES ('P145', 4125
	);

INSERT INTO Troop_Volunteers (PID, TroopID)
	VALUES ('P141', 4125
	);

INSERT INTO Troop_Volunteers (PID, TroopID)
	VALUES ('P133', 4125
	);

INSERT INTO Troop_Volunteers (PID, TroopID)
	VALUES ('P134', 8176
	);

INSERT INTO Troop_Volunteers (PID, TroopID)
	VALUES ('P142', 8176
	);

--Staff--

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P130' ,'Troop CoLeader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P131', 'Troop Leader'
	);
	
INSERT INTO Staff (PID, Position_Title)
	VALUES ('P132', 'Troop CoLeader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P133', 'Troop Volunteer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P134', 'Troop Volunteer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P135', 'Troop Leader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P136', 'Troop CoLeader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P137', 'Troop Leader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P138', 'Troop CoLeader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P139', 'Troop CoLeader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P140', 'Troop CoLeader'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P141', 'Troop Volunteer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P142', 'Troop Volunteer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P143', 'Council Treasurer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P144', 'Service Unit Activity Consultant'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P145', 'Service Unit Manager'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P146', 'Service Unit Activity Consultant'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P147', 'Council President'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P148', 'Council Treasurer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P149', 'Council President'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P150', 'Council Treasurer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P151', 'Service Unit Registrar'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P152', 'Council President'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P153', 'Service Unit Cookie Coordinator'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P154', 'Service Unit Cookie Coordinator'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P155', 'Service Unit Activity Consultant'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P156', 'Service Unit Manager'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P157', 'Service Unit Activity Consultant'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P158', 'Service Unit Manager'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P159', 'Service Unit Manager'
	);
INSERT INTO Staff (PID, Position_Title)

	VALUES ('P160', 'Service Unit Registrar'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P161', 'Service Unit Registrar'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P162', 'Service Unit Registrar'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P163', 'Service Unit Cookie Coordinator'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P164', 'Council Treasurer'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P165', 'Service Unit Cookie Coordinator'
	);

INSERT INTO Staff (PID, Position_Title)
	VALUES ('P166', 'Service Unit President'
	);

--Scout_Level--
INSERT INTO Scout (Scout_Level, Start_Age, End_Age)
	VALUES ('Daisy', '5', '6'
	);
	
INSERT INTO Scout (Scout_Level, Start_Age, End_Age)
	VALUES ('Brownie', '7', '8'
	);

INSERT INTO Scout (Scout_Level, Start_Age, End_Age)
	VALUES ('Junior', '9', '10'
	);	

INSERT INTO Scout (Scout_Level, Start_Age, End_Age)
	VALUES ('Cadette', '11', '13'
	);

INSERT INTO Scout (Scout_Level, Start_Age, End_Age)
	VALUES ('Senior', '14', '15'
	);
	
INSERT INTO Scout (Scout_Level, Start_Age, End_Age)
	VALUES ('Ambassador', '16', '18'
	);

--Girls-- 
INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P100', 1602, 'Cadette'
	);
	
INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P111', 4125, 'Brownie'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P112', 1213, 'Daisy'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P113', 1602, 'Cadette'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P114', 1213, 'Daisy'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P115', 1369, 'Daisy'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P116', 2346, 'Senior'
	);	

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P117', 2689, 'Junior'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P118', 1248, 'Ambassador'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P119', 6281, 'Cadette'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P120', 2679, 'Senior'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P121', 4125, 'Brownie'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P122', 9527, 'Junior'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P123', 3579, 'Daisy'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P124', 9527, 'Junior'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P125', 7836, 'Brownie'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P126', 8176, 'Ambassador'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P127', 6281, 'Cadette'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P128', 6281, 'Cadette'
	);

INSERT INTO Girls (PID, TroopID, Scout_Level)
	VALUES ('P129', 8176, 'Ambassador'
	);
	
--Update after adding new column 'Briding_Members' on Girls table--
UPDATE Girls
SET Bridging_Member = TRUE
WHERE Scout_Level = 'Daisy';

UPDATE Girls
SET Bridging_Member = TRUE
WHERE Scout_Level = 'Brownie';

UPDATE Girls
SET Bridging_Member = TRUE
WHERE Scout_Level = 'Junior';

UPDATE Girls
SET Bridging_Member = TRUE
WHERE Scout_Level = 'Cadette';

UPDATE Girls
SET Bridging_Member = TRUE
WHERE Scout_Level = 'Senior';

UPDATE Girls
SET Bridging_Member = FALSE
WHERE Scout_Level = 'Ambassador';
	
--Events--
INSERT INTO Events (Event_Category, Description)
	VALUES ('Skill Learning', 'Girls will learn skills from different areas of life such as: food, athletics, art, and the environment, becoming well-rounded women in our world.'
	);	

INSERT INTO Events (Event_Category, Description)
	VALUES ('Financial Literacy', 'Girls will learn the basics of credit, how to be frugal with their savings, and planning for their future. '
	);	
	
INSERT INTO Events (Event_Category, Description)
	VALUES ('Cookie Business', 'Girls will learn how to set personal and team goals, make important decisions such as when and where to sell cookies, develop money management skills and people skills by interacting with customers, and overall business ethics.'
	);	

INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P100', 'Skill Learning'
	);

INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P111', 'Financial Literacy'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P114', 'Skill Learning'
	);

INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P115', 'Financial Literacy'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P117', 'Cookie Business'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P119', 'Skill Learning'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P120', 'Financial Literacy'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P122', 'Cookie Business'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P125', 'Cookie Business'
	);
	
INSERT INTO Events_Attended (PID, Event_Category)
	VALUES ('P126', 'Skill Learning'
	);
	

--Badges--
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Use Resources Wisely','Skill Learning', 'Daisy'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Respect Authority', 'Skill Learning', 'Daisy'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Be A Sister To Every Girl Scout', 'Skill Learning', 'Daisy'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Computer Expert', 'Skill Learning', 'Brownie'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Making Friends', 'Skill Learning', 'Brownie'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Pottery', 'Skill Learning', 'Brownie'
	);		
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Camper', 'Skill Learning', 'Junior'
	);		
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Photographer', 'Skill Learning', 'Junior'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Detetive', 'Skill Learning', 'Junior'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Public Speaker', 'Skill Learning', 'Cadette'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Baby Sitter', 'Skill Learning', 'Cadette'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Animal Helper', 'Skill Learning', 'Cadette'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Website Designer', 'Skill Learning', 'Senior'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Room Makeover', 'Skill Learning', 'Senior'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Traveler', 'Skill Learning', 'Senior'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Womens Health', 'Skill Learning', 'Ambassador'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Car Care', 'Skill Learning', 'Ambassador'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Business Etiquette', 'Skill Learning', 'Ambassador'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Money Counts', 'Financial Literacy', 'Daisy'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Making Choices', 'Financial Literacy', 'Daisy'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Money Manager', 'Financial Literacy', 'Brownie'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Philanthropist', 'Financial Literacy', 'Brownie'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Business Owner', 'Financial Literacy', 'Junior'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Savvy Shopper', 'Financial Literacy', 'Junior'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Budgeting', 'Financial Literacy', 'Cadette'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Comparison Shopping', 'Financial Literacy', 'Cadette'
	);	
	
INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Finacing My Dreams', 'Financial Literacy', 'Cadette'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Buying Power', 'Financial Literacy', 'Senior'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Financing My Future', 'Financial Literacy', 'Senior'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('On My Own', 'Financial Literacy', 'Ambassador'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Good Credit', 'Financial Literacy', 'Ambassador'
	);	

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Count It Up', 'Cookie Business', 'Daisy'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Talk It Up', 'Cookie Business', 'Daisy'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Meet My Customers', 'Cookie Business', 'Brownie'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Give Back', 'Cookie Business', 'Brownie'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('CookieCEO', 'Cookie Business', 'Junior'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Customer Insights', 'Cookie Business', 'Junior'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Business Plan', 'Cookie Business', 'Cadette'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Marketing', 'Cookie Business', 'Cadette'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Thing Big', 'Cookie Business', 'Cadette'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Customer Loyalty', 'Cookie Business', 'Senior'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('My Portfolio', 'Cookie Business', 'Senior'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('Research and Development', 'Cookie Business', 'Ambassador'
	);

INSERT INTO Badges (Badge_Name, Event_Category, Scout_Level)
	VALUES ('P&L', 'Cookie Business', 'Ambassador'
	);

INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P100', 'Public Speaker'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P111', 'Money Manager'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P114', 'Respect Authority'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P115', 'Money Counts'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P117', 'CookieCEO'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P119', 'Animal Helper'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P120', 'Financing My Future'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P122', 'Savvy Shopper'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P125', 'Meet My Customers'
	);
	
INSERT INTO Badges_Earned (PID, Badge_Name)
	VALUES ('P126', 'Customer Loyalty'
	);


--Query 1--
SELECT council.council_name, serviceunit.serviceunitID, troop.troopID, troop_volunteers.pid, people.first_name, people.last_name 
	FROM council, serviceunit, troop, troop_volunteers, people
	WHERE council.council_name = serviceunit.council_name
	AND serviceunit.serviceunitID = troop.serviceunitID
	AND troop.troopID = troop_volunteers.troopIDAND people.PID = troop_volunteers.PID
	AND serviceunit.serviceunitID = 129;

--Query 2--
SELECT people.first_name, people.last_name, scout.scout_level, badges_earned, events.event_category
FROM people, badges_earned, badges, scout, events
WHERE people.pid = badges_earned.PID
AND events.event_category = badges.event_category
AND badges_earned.badge_name = badges.badge_name
AND badges.scout_level = scout.scout_level;

--View 1--
DROP VIEW IF EXISTS BadgeDistribution;
CREATE VIEW BadgeDistribution as
	select people.first_name, people.last_name, scout.scout_level, badges_earned, events.event_category
	from people, badges_earned, badges, scout, events
	where people.pid = badges_earned.PID
	AND events.event_category = badges.event_category
	AND badges_earned.badge_name = badges.badge_name
	AND badges.scout_level = scout.scout_level;
SELECT * FROM BadgeDistribution;

--Stored Procedure 1--

CREATE OR REPLACE FUNCTION update_bridging_status()
RETURNS TRIGGER AS 
$$
BEGIN
	IF NEW.PID is NULL THEN
    	UPDATE Girls
        SET Bridging_Member = FALSE
        WHERE NEW.PID = Girls.PID;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

--Trigger calling Stored Procedure 1--
CREATE TRIGGER update_bridging_status_trigger
	AFTER INSERT ON girls
    FOR EACH STATEMENT
    EXECUTE PROCEDURE update_bridging_status();

------------
--Security--
------------
--Admin--
CREATE ROLE ADMIN
GRANT ALL ON ALL TABLES IN SCHEMA PUBLIC TO ADMIN

--SU_Registrar--
CREATE ROLE SU_REGISTRAR
REVOKE ALL ON ALL TABLES IN SCHEMA PUBLIC TO SU_REGISTRAR	
GRANT ALL ON ALL TABLES IN SCHEMA PUBLIC TO SU_REGISTRAR	
GRANT INSERT ON PEOPLE, STAFF, COUNCIL, COUNCIL_PRESIDENT, COUNCIL_TREASURER, 
	SERVICEUNIT, SU_MANAGER, SU_SU_ACTIVITYCONSULTANT, SU_COOKIECOORDINATOR, SU_REGISTRAR, 
	TROOP, TROOP_LEADER, TROOP_COLEADER, TROOP_VOLUNTEERS, GIRLS, STAFF, PEOPLE  
GRANT UPDATE ON PEOPLE, STAFF, COUNCIL, COUNCIL_PRESIDENT, COUNCIL_TREASURER, SERVICEUNIT, 
	SU_MANAGER, SU_SU_ACTIVITYCONSULTANT, SU_COOKIECOORDINATOR, SU_REGISTRAR, TROOP, 
	TROOP_LEADER, TROOP_COLEADER, TROOP_VOLUNTEERS, GIRLS, STAFF, PEOPLE
	
--SU_ACTIVITYCONSULTANT--
CREATE ROLE SU_ACTIVITYCONSULTANT
REVOKE ALL ON ALL TABLES IN SCHEMA PUBLIC TO SU_REGISTRAR
GRANT INSERT ON SERVICEUNIT, TROOP, GIRLS, EVENTS, EVENTS_ATTENDED, BADGES, BADGES_EARNED
GRANT UPDATE ON SERVICEUNIT, TROOP, GIRLS, EVENTS, EVENTS_ATTENDED, BADGES, BADGES_EARNED

--TROOP_LEADER--
CREATE ROLE TROOP_LEADER
REVOKE ALL ON ALL TABLES IN SCHEMA PUBLIC TO TROOP_LEADER
GRANT SELECT ON GIRLS, EVENTS, EVENTS_ATTENDED, BADGES, BADGES_EARNED
GRANT INSERT ON GIRLS, EVENTS, EVENTS_ATTENDED, BADGES, BADGES_EARNED
GRANT UPDATE ON GIRLS, EVENTS, EVENTS_ATTENDED, BADGES, BADGES_EARNED