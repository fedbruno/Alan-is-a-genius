/*
Federica Bruno
308 Database Management
Alan Labouseur
Lab 10: Stored Procedures
*/

-- The table of courses.
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


-- Courses and their prerequisites
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;

--QUESTION 1 Returns the immediate prerequisites for the passed-in course number.
CREATE FUNCTION PreReqsFor(int, REFCURSOR) returns refcursor as $$
declare
 courseNum	int 		:=$1;
 resultset	REFCURSOR 	:=$2;  
begin 
	open resultset for
	select preReqNum
	from Prerequisites
	where courseNum = prerequisites.courseNum;
return resultset;

end;
$$
language plpgsql;

select PreReqsFor(220, 'results');
Fetch all from results;

--QUESTION 2 Returns the courses for which the passed-in course	number is an immediate 
--pre-requisite.	
CREATE FUNCTION IsPreReqsFor(int, REFCURSOR) returns refcursor as $$
declare
 	courseNum	int 		:=$1;
 	resultset	REFCURSOR 	:=$2;  
begin 
	open resultset for
	select preReqNum
	from Prerequisites
	where courseNum = prerequisites.preReqNum;
return resultset;
end;
$$
language plpgsql;

select IsPreReqsFor(220, 'results');
Fetch all from results;