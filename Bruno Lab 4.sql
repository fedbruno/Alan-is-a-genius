/*
Federica Bruno
Database Management 308
Alan Labouseur
Due: February 14, 2017
Lab 4: The Subqueries Sequel
*/


-- Question 1
Select distinct city 
From agents 
Where aid in (	Select aid
				From orders
    			Where cid = 'c006');

-- Question 2
Select distinct pid
From Orders
Where aid in (	Select aid
				From Orders
				Where cid in 
					(	Select cid
		      			From Customers
		      			Where city = 'Kyoto'))
Order by pid Desc;

-- Question 3
Select cid, name
From Customers
Where cid not in (	Select cid
	          		From Orders
	          		Where aid = 'a01');

-- Question 4 
Select cid, name
From Customers
Where cid in (	Select cid
	       		From Orders
	       		Where pid = 'p07')

AND cid in (	Select cid
	       		From Orders
	       		Where pid = 'p01');

-- Question 5
Select distinct pid
From Orders
Where cid not in (	Select cid
                  	From Orders
                  	Where aid = 'a08')
Order by pid Desc;


-- Question 6
Select name, discount, city
From Customers
Where cid in (	Select cid
	      		From Orders
	      		Where aid in 
	      			(	Select aid
			    		From Agents
			    		Where city = 'Tokyo' or city = 'New York'));

-- Question 7
Select *
From Customers
Where discount in (	Select discount
		   			From Customers
		   			Where city = 'Dallas' or city = 'London');

-- Question 8

/*
A check constraint is used to limit the value range placed in a specific value in a table
or more generally speaking, it ensures certain requirements that the database must abide 
to. The main advantage to a check constraint is that it ensures referential integrity. 
For instance, it ensures if all cross references are correct; that is, if all foreign keys
correctly correspond to the respectable primary keys. It also checks updating and deleting
operations. For instance, it checks to make sure that the "children" values are deleted
before the "parent" values are. (We wouldn't want any orphans!) An example of a good
instance to use a check constraint may be on ISBN numbers for books. Every ISBN number for 
any type of book in the world is a 13 character string. Limiting the value range to be
up to 13 characters will ensure that it will be a ISBN number uniquely identifying a book.
An example of a bad instance to use a check constraint may be on social security numbers,
because not everyone has a social security number; so, it would be unnecessary to apply 
a restraint on something that does not require a check constraint. 
*\
