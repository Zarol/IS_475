-- 1. List the names of all customers located in the state of Nevada. Sort the output by customer last name. The first and last name of the customer should be concatenated so that the format of the result table is the same as that shown below:

SELECT    FirstName + ' ' + LastName CustomerName,
          Phone CustomerPhone,
          City City,
          State State,
          FIrstBuyDate FirstBuyDate
FROM      TblCustomer
WHERE     UPPER(State) = 'NV'
ORDER BY  CustomerName;

-- 2. Change the query to format the customer's phone number and first buy date. Change the structure of the customer name to make sure that there is a comma directly after the last name (no blank spaces between the last name and the comma) and that the first initial of the first name is separated by only one space from the comma. Make sure that there is a period directly after the initial. Change the format of the city and state so that they display in all upper case.

SELECT    LastName + ', ' + UPPER(SUBSTRING(FirstName, 1, 1)) + '.' CustomerName,
          '('+SUBSTRING(Phone,1,3)+') '+ SUBSTRING(Phone,4,3)+'-'+ SUBSTRING(Phone,7,4) CustomerPhone,
          UPPER(City) City,
          UPPER(State) State,
          CONVERT(VARCHAR, FirstBuyDate, 107) FirstBuyDate
FROM      TblCustomer
WHERE     State = 'NV'
ORDER BY  CustomerName;

-- 3. List the orders in the order table that do NOT have a discount code (the discount code is a NULL value). Sort the output by orderdate. Here is the complete result table:

SELECT  CONVERT(VARCHAR, OrderDate, 101) 'Date of Order',
       OrderID   'Order Number',
       CustomerID 'Customer Number',
       CreditCode 'Credit Code'
FROM   TblOrder
WHERE  DiscountCode is NULL
ORDER BY OrderDate;

-- 4. List order information placed for itemID A34665. Include the orderID, itemID, quantity ordered, price paid, and calculate the extended price (price * quantity). Sort the output by orderID. Here is the result table:

SELECT    OrderID   'Order Number',
          ItemID    'ItemNumber',
          Quantity  'QuantityOrdered',
          Price     'PricePaid',
          Price*Quantity   'ExtendedPrice'
FROM      tblOrderLine
WHERE     ItemID = 'A34665'
ORDER BY  OrderID;

-- 5. List the order information for all items in the OrderLine table that have an extended price over $800. Sort the rows by itemID within orderID. Here is the result table:

SELECT    OrderID   'Order Number',
          ItemID    'ItemNumber',
          Quantity  'QuantityOrdered',
          Price     'PricePaid',
          Price*Quantity   'ExtendedPrice'
FROM      tblOrderLine
WHERE     Price*Quantity > 800
ORDER BY  OrderID;

-- 6. Modify query #5 to include a column with a message about the extended price. The table below provides the messages appropriate for an extended price:

SELECT    OrderID   'Order Number',
          ItemID    'ItemNumber',
          Quantity  'QuantityOrdered',
          Price     'PricePaid',
          Price*Quantity   'ExtendedPrice',
          CASE
            WHEN Price*Quantity >= 5000
            THEN '***Closely Watch the Status***'
            WHEN Price*Quantity >= 2000
            THEN 'Very Large Order – Watch Dates'
            WHEN Price*Quantity >= 1500
            THEN 'Large Order - Monitor'
            WHEN Price*Quantity >= 1000
            THEN 'Medium Order'
            ELSE NULL
            END  'OrderStatusMessage'
FROM      tblOrderLine
WHERE     Price*Quantity > 800
ORDER BY  OrderID;

-- 7. List all the shipments in the ShipLine table that were shipped in January of the current year. For full credit on the answer, the query must be flexible enough to compare the year of the DateShipped to the year of the current date. Thus, you must use the GETDATE() function to determine the correct year for comparison. Sort the result table in order by ItemID within OrderID. Result table:

SELECT    OrderID,
          ItemID,
          CONVERT(VARCHAR, DateShipped, 101) DateShipped,
          QtyShipped,
          UPPER(MethodShipped)s
FROM      TblShipLine
WHERE     YEAR(DateShipped) = YEAR(getdate()) AND MONTH(DateShipped) = '1'
ORDER BY  OrderID;

-- 8. What is the earliest FirstBuyDate for a customer in the CUSTOMER table? You do not have to display any other information – just the value of the earliest (or you might consider the earliest to be the minimum) FirstBuyDate – for the answer to this query. Result table:

SELECT    CONVERT(VARCHAR, MIN(FirstBuyDate), 107) 'Earliest First Buy Date'
FROM      TblCustomer;

-- 9 What is the average selling price for itemID A34665? Use the OrderLine table for the table in this query. Round the result. Here is the result table:

SELECT    ROUND(AVG(Price),2) 'Average Selling Price'
FROM      tblOrderLine
WHERE     ItemID = 'A34665';

-- 10. Create a grouped report that summarizes data and provides information about each item that is on an order in the OrderLine table. The report should include the itemID, the number of rows in the OrderLine table for that item, total quantity on order for that item, the minimum price that the item sold for, the maximum price that the item sold for, and the average price that the item sold for. The report should be ordered by itemID. Result table:

SELECT    ItemID 'itemid',
          COUNT(*) 'NumberOfRows',
          SUM(Quantity)'QuantitySold',
          MIN(Price) 'MinimumPrice',
          MAX(Price) 'MaximumPrice',
          AVG(Price) 'AveragePrice'
FROM      tblOrderLine
GROUP BY  ItemID;

-- 11. Modify query #10 so that it only displays the rows where the MaximumPrice is greater than 50% more than the MinimumPrice. Add a column to the output that displays the percentage difference between the minimum and maximum price. Here is the result table:

SELECT    ItemID 'itemid',
          COUNT(*) 'NumberOfRows',
          SUM(Quantity)'QuantitySold',
          MIN(Price) 'MinimumPrice',
          MAX(Price) 'MaximumPrice',
          AVG(Price) 'AveragePrice',
          (MAX(Price) - MIN(Price))/MIN(Price)*100 'Diff'
FROM      tblOrderLine
GROUP BY  ItemID
HAVING    MAX(Price) > MIN(Price)*1.5;

-- 12. Assume just for this query that all orders in the Order table are waiting to be shipped. That isn’t true for this database, but assume it is anyway for this question. Calculate the number of days each order is overdue and display those orders that are 40 days overdue from the day you run your query. I’m running this query on 2/26/2016, so my output is based on that run date. Use only the Order table for this query. Here is the result table with a current date of 2/26/2016, but your output will be slightly different because you will be running it on a different day. Make sure that your “current date and time” column is the actual current date when you run your query.

SELECT    OrderID 'Order Number',
          CustomerID 'Customer Number',
          CONVERT(varchar, OrderDate, 107) 'Date Ordered',
          CONVERT(varchar, DATEADD(day, 40, OrderDate), 107) '40 Days After Date Ordered',
          DATEDIFF(day, OrderDate, getDate()) 'Number of Days Difference',
          getDate() 'Current Date and Time'
FROM      TblOrder
WHERE     DATEDIFF(day, OrderDate, getDate()) > 40
ORDER BY  OrderID;

-- 13. It is possible in this database to have partial shipments. The goal of this query is to see only those OrderID and ItemID combinations that were shipped in partial shipments. Count the number of shipments, as represented by rows in the ShipLine table, sum the quantity shipped in the ShipLine table by orderID and itemID, displaying only those combinations of orderID and itemID that have more than one row in the ShipLine table. The result table is on the top of the next page

SELECT    OrderID,
          ItemID,
          COUNT(*) NumberOfShipments,
          SUM(Qtyshipped) TotalShipped
FROM      TblShipLine
GROUP BY OrderID,ItemID
HAVING     COUNT(*) > 1
ORDER BY OrderID;

-- 14. Which customers do not have any orders in the Order table? I recommend using a non-correlated sub-query for this query. Here is the result table:
SELECT    CustomerID,
          LastName + ', ' + UPPER(SUBSTRING(FirstName, 1, 1)) + '.' CustomerName,
          '('+SUBSTRING(Phone,1,3)+') '+ SUBSTRING(Phone,4,3)+'-'+ SUBSTRING(Phone,7,4) CustomerPhone,
          UPPER(City) City,
          UPPER(State) State,
          CONVERT(VARCHAR, FirstBuyDate, 107) FirstBuyDate
FROM      TblCustomer
WHERE     TblCustomer.CustomerID not in (SELECT TblOrder.CustomerID FROM TblOrder);

--  15. Which customer is the one who has the most recent FirstBuyDate? I recommend using a non-correlated sub-query for this query. Here is the result table:
SELECT    CustomerID,
          LastName + ', ' + UPPER(SUBSTRING(FirstName, 1, 1)) + '.' CustomerName,
          '('+SUBSTRING(Phone,1,3)+') '+ SUBSTRING(Phone,4,3)+'-'+ SUBSTRING(Phone,7,4) CustomerPhone,
          UPPER(City) City,
          UPPER(State) State,
          CONVERT(VARCHAR, FirstBuyDate, 107) FirstBuyDate
FROM      TblCustomer
WHERE     FirstBuyDate = (SELECT MAX(FirstBuyDate) FROM TblCustomer);