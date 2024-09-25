-- ii) Exercise on Sub-queries:
-- a. Find the ProductNo and description of non-moving products i.e. products not being sold.
SELECT
   PM.PRODUCTNO,
   PM.DESCRIPTION
FROM
   PRODUCT_MASTER PM
WHERE
   PM.PRODUCTNO NOT IN (
       SELECT
           SOD.PRODUCTNO
       FROM
           SALES_ORDER_DETAILS SOD
   );
-- b. List the customer Name, Address1, Address2, City and PinCode for the client who has
-- placed order no ‘O19001’.
	SELECT
   NAME,
   ADDRESS1,
   ADDRESS2,
   CITY,
   PINCODE
FROM
   CLIENT_MASTER
WHERE
   CLIENTNO = (
       SELECT
           CLIENTNO
       FROM
           SALES_ORDER
       WHERE
           ORDERNO = 'O19001'
   );
-- c. List the client names that have placed orders before the month of May, 02.

   SELECT
   NAME
FROM
   CLIENT_MASTER
WHERE
   CLIENTNO IN (
       SELECT
           CLIENTNO
       FROM
           SALES_ORDER
       WHERE
           ORDERDATE < '2002-05-01'
-- d. List if the product ‘Lycra Top’ has been ordered by any client and print the Client_no, Name
-- to whom it was sold.
	SELECT
   CM.CLIENTNO,
   CM.NAME
FROM
   CLIENT_MASTER CM
WHERE
   CM.CLIENTNO IN (
       SELECT
           SO.CLIENTNO
       FROM
           SALES_ORDER SO
       JOIN
           SALES_ORDER_DETAILS SOD ON SO.ORDERNO = SOD.ORDERNO
       JOIN
           PRODUCT_MASTER PM ON SOD.PRODUCTNO = PM.PRODUCTNO
       WHERE
           PM.DESCRIPTION = 'Lycra Top'
-- e. List the names of clients who have placed orders worth Rs. 10000 or more.

SELECT
   CM.NAME
FROM
   CLIENT_MASTER CM
WHERE
   CM.CLIENTNO IN (
       SELECT
           SO.CLIENTNO
       FROM
           SALES_ORDER SO
       JOIN
           SALES_ORDER_DETAILS SOD ON SO.ORDERNO = SOD.ORDERNO
       GROUP BY
           SO.CLIENTNO, SO.ORDERNO
       HAVING
           SUM(SOD.QTYORDERED * SOD.PRODUCTRATE) >= 10000