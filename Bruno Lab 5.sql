/*
Federica Bruno
Database Management 308
Alan Labouseur
Lab 5: The Joins Three-quel
Due February 21, 2017
*/

-- Question 1:
select city 
from agents a
	inner join orders o on o.aid = a.aid 
where o.cid='c006';
      
-- Question 2:
Select distinct p.pid
from orders o
	inner join customers c on o.cid = c.cid
	inner join agents a on o.aid = a.aid
	inner join products p on o.pid = p.pid
where c.city = 'Kyoto'
order by p.pid DESC;
		
-- Question 3:
select distinct name 
from customers
where not cid in (
	select cid from orders); 
      
-- Question 4:
select distinct name 
from customers c
	full outer join orders o on c.cid = o.cid
where o.cid is null;

-- Question 5:
select distinct c.name, a.name
from customers c, agents a, orders o
where c.city = a.city
	and c.cid = o.cid
	and a.aid = o.aid;

-- Question 6:
select c.name, a.name, c.city, a.city
from customers c
	inner join agents a on c.city = a.city;
	
-- Question 7:
select name, city
from customers
where city in (select city 
	       from products
	       group by city
	       order by count (*) ASC
Limit 1);

      
