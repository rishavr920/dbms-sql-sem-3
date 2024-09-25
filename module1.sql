-- i) Perform the following computations on table data:


-- a. List the names of all clients having ‘a’ as the second letter in their names. 

select name from client_master where name like '_a%';

-- b. List the clients who stay in a city whose First letter is ‘M’. 

SELECT * FROM client_master WHERE City LIKE 'M%';

-- c. List all clients who stay in ‘Bangalore’ or ‘Mangalore’ 

select * from client_master where city = 'banglore' or city = 'manglore';

-- d. List all clients whose BalDue is greater than value 1000.

select * from client_master where baldue>1000;

-- e. List all information from the Sales_Order table for orders placed in the month of June.

SELECT * 
FROM Sales_Order
WHERE MONTH(OrderDate) = 6;

-- other way

SELECT *
FROM Sales_Order
WHERE OrderDate >= '2004-06-01' AND OrderDate < '2004-07-01';

-- f. List the order information for ClientNo ‘C00001’ and ‘C00002’.

SELECT *
FROM Sales_Order
WHERE ClientNo IN ('C00001', 'C00002');

-- g. List products whose selling price is greater than 500 and less than or equal to 750.

select * from product_master where sellprice> 500 and sellprice<750;

-- h. List products whose selling price is more than 500. Calculate a new selling price as, original
-- 	  selling price*.15. Rename the new column in the output of the above query as new_price. 

SELECT *,SellPrice * 0.15 AS new_price
FROM Product_master
WHERE SellPrice > 500;

-- i. List the names, city and state of clients who are not in the state of ‘Maharashtra’.

select * from client_master where not city = "Maharashtra"; 

-- j. Count the total Int of orders.

SELECT COUNT(*) AS total_orders
FROM Sales_Order;

-- k. Calculate the average price of all the products.

SELECT AVG(SellPrice) AS average_price
FROM Product_master;

-- l. Determine the maximum and minimum product prices. Rename the output as max_price and
-- min_price respectively. 

Select max(sellprice) as max_price,min(sellprice)as min_price from product_master;

-- m. Count the Int of products having price less than or equal to 6000.

select count(*) from product_master where sellprice<=6000;

-- n. List all the products whose QtyOnHand is less than recorder level.

SELECT *
FROM Product_master
WHERE QtyOnHand < Reorderlvl;



 