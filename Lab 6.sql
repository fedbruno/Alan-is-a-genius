/*
Federica Bruno
Database Management 308
Alan Labouseur
Due Date: February 28, 2017
Lab 6: Interesting and Painful Queries
*/


-- Question 1:
select name, city
from customers 
where city in (select city
                from products p
                group by city
                order by count(p.city) 
limit 1);


-- Question 2:
select name 
from products  
where priceUSD > (select avg(priceUSD)
                  from products)
order by name DESC;


-- Question 3:
select c.name, o.pid, o.totalUSD as "total"
from customers c, orders o 
where c.cid = o.cid
order by o.totalUSD ASC;


-- Question 4:
select c.name, sum(COALESCE(o.qty, 0)) as "total ordered"
from orders o, customers c
where c.cid = o.cid
group by c.name
order by c.name ASC;


-- Question 5:
select c.name, a.name, p.name
from orders o
	inner join customers c on o.cid = c.cid
	inner join agents a on o.aid = a.aid
	inner join products p on o.pid = p.pid
where a.city = 'Newark'


-- Question 6:
select *
from (select o.*, o.qty*p.priceUSD*(1-(discount/100)) as actualUSD
		from orders o
		inner join products p on o.pid = p.pid
		inner join customers c on o.cid = c.cid) as checkingUSD
where totalUSD != actualUSD;


/*
Question 7:
Difference between left outer join and right outer join:
Outer joins in general join tables with both matching data and dissimilar data. The left 
outer join returns matches from the right table. If there aren't any matches on the right 
side, it returns null. The right outer join essentially does the opposite: it matches rows 
from the left table, and if there aren't any matches, it returns null.
*/






