-- i) Exercise on Joins and Correction:

-- a. Find out the products, which have been sold to ‘Ivan Bayross’.
	SELECT
   PM.PRODUCTNO,
   PM.DESCRIPTION
FROM
   SALES_ORDER SO
JOIN
   CLIENT_MASTER CM ON SO.CLIENTNO = CM.CLIENTNO
JOIN
   SALES_ORDER_DETAILS SOD ON SO.ORDERNO = SOD.ORDERNO
JOIN
   PRODUCT_MASTER PM ON SOD.PRODUCTNO = PM.PRODUCTNO
WHERE
   CM.NAME = 'Ivan Bayross';
-- b. Find out the products and their quantities that will have to be delivered in the current month.
	SELECT
   PM.PRODUCTNO,
   PM.DESCRIPTION,
   SUM(SOD.QTYORDERED) AS total_quantity
FROM
   SALES_ORDER SO
JOIN
   SALES_ORDER_DETAILS SOD ON SO.ORDERNO = SOD.ORDERNO
JOIN
   PRODUCT_MASTER PM ON SOD.PRODUCTNO = PM.PRODUCTNO
WHERE
   MONTH(SO.DELYDATE) = MONTH(CURDATE())
   AND YEAR(SO.DELYDATE) = YEAR(CURDATE())
GROUP BY
   PM.PRODUCTNO, PM.DESCRIPTION;
-- c. List the ProductNo. and description of constantly sold (i.e. rapidly moving) products.
SELECT
   PM.PRODUCTNO,
   PM.DESCRIPTION
FROM
   PRODUCT_MASTER PM
JOIN
   SALES_ORDER_DETAILS SOD ON PM.PRODUCTNO = SOD.PRODUCTNO
GROUP BY
   PM.PRODUCTNO, PM.DESCRIPTION
HAVING
   SUM(SOD.QTYORDERED) > 10; 
-- d. Find the names of clients who have purchased ‘Mouses’.
		
SELECT CM.name
FROM client_master CM
JOIN sales_order SO ON CM.clientno = SO.clientno
JOIN sales_order_details SOD ON SO.orderno = SOD.orderno
JOIN product_master PM ON SOD.productno = PM.productno
WHERE PM.DESCRIPTION = 'Mouse';

-- e. List the products and orders from customers who have ordered less than 5 units of ‘Pull
-- Overs’.
	
SELECT
   SOD.ORDERNO,
   PM.PRODUCTNO,
   PM.DESCRIPTION,
   SOD.QTYORDERED
FROM
   SALES_ORDER_DETAILS SOD
JOIN
   SALES_ORDER SO ON SOD.ORDERNO = SO.ORDERNO
JOIN
   PRODUCT_MASTER PM ON SOD.PRODUCTNO = PM.PRODUCTNO
WHERE
   PM.DESCRIPTION = 'Pull Overs'
   AND SOD.QTYORDERED < 5;


-- f. Find the products and their quantities for the orders placed by ‘Ivan Bayross’ and ‘Mamta
-- Muzumdar’
SELECT
   PM.PRODUCTNO,
   PM.DESCRIPTION,
   SOD.QTYORDERED
FROM
   CLIENT_MASTER CM
JOIN
   SALES_ORDER SO ON CM.CLIENTNO = SO.CLIENTNO
JOIN
   SALES_ORDER_DETAILS SOD ON SO.ORDERNO = SOD.ORDERNO
JOIN
   PRODUCT_MASTER PM ON SOD.PRODUCTNO = PM.PRODUCTNO
WHERE
   CM.CLIENTNO IN ('C00001', 'C00002');
-- g. Find the products and their quantities for the orders placed by ClientNo ‘C00001’ and
-- C00002’.

SELECT
   PM.PRODUCTNO,
   PM.DESCRIPTION,
   SOD.QTYORDERED
FROM
   CLIENT_MASTER CM
JOIN
   SALES_ORDER SO ON CM.CLIENTNO = SO.CLIENTNO
JOIN
   SALES_ORDER_DETAILS SOD ON SO.ORDERNO = SOD.ORDERNO
JOIN
   PRODUCT_MASTER PM ON SOD.PRODUCTNO = PM.PRODUCTNO
WHERE
   CM.CLIENTNO IN ('C00001', 'C00002');