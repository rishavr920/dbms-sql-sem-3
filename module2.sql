-- ii) Exercise on Date Manipulation:
-- a. List  the order number and day on which clients placed their order.
select orderno,day(orderdate) AS order_day from sales_order;
-- b. List the month (in alphabets) and date when the orders must be delivered.

select orderno,monthname(delydate) AS delivery_month,delydate AS delivery_day from sales_order;
    
-- c. List the OrderDate in the format ‘DD-Month-YY’. E.g. 12-February-02.
	SELECT orderno,DATE_FORMAT(sales_order.OrderDate, '%d-%M-%y') AS FormattedOrderDate
	FROM sales_order;
-- d. List the date, 15 days after today’s date. 
	SELECT DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS date_15_days_later;

