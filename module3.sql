-- 4. Exercises on using Having and Group By Clauses:

-- a. Print the description and total qty sold for each product.
	SELECT
   PRODUCTNO,
   SUM(QTYORDERED) AS total_qty_sold
FROM
   SALES_ORDER_DETAILS
GROUP BY
   PRODUCTNO
HAVING
   total_qty_sold > 0;
-- b. Find the value of each product sold.
	SELECT
   PRODUCTNO,
   SUM(QTYORDERED * PRODUCTRATE) AS total_value_sold
FROM
   SALES_ORDER_DETAILS
GROUP BY
   PRODUCTNO;
-- c. Calculate the average qty sold for each client that has a maximum order value of 15000.00.
	SELECT
   S.CLIENTNO,
   AVG(SD.QTYORDERED) AS average_qty_sold
FROM
   SALES_ORDER S
JOIN
   SALES_ORDER_DETAILS SD ON S.ORDERNO = SD.ORDERNO
GROUP BY
   S.CLIENTNO
HAVING
   SUM(SD.QTYORDERED * SD.PRODUCTRATE) <= 15000.00;
-- d. Find out the total of all the billed orders for the month ofJune.
SELECT
   SUM(QTYORDERED * PRODUCTRATE) AS total_billed_orders
FROM
   SALES_ORDER_DETAILS
WHERE
   ORDERNO IN (
       SELECT ORDERNO
       FROM SALES_ORDER
       WHERE BILLYN = 'Y'
       AND MONTH(ORDERDATE) = 6
       AND YEAR(ORDERDATE) = YEAR(CURDATE())  -- Adjust the year if needed
   );