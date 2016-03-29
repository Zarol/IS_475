-- 1.
SELECT    CONVERT(varchar, ord.OrderDate,101) OrderDate,
          ord.OrderID OrderNumber,
          cst.lastname + ', ' + UPPER(SUBSTRING(cst.firstname,1,1)) + '.' CustomerName,
         '('+SUBSTRING(cst.Phone,1,3)+') '+ SUBSTRING(cst.Phone,4,3)+'-'+ SUBSTRING(cst.Phone,7,4) CustomerTelePhone
FROM      TblOrder ord
INNER JOIN TblCustomer cst
ON          ord.CustomerID = cst.CustomerID
WHERE     YEAR(OrderDate) = YEAR(getdate()) AND MONTH(OrderDate) = 1
ORDER BY OrderDate DESC;

-- 2.
SELECT    CONVERT(varchar, ord.OrderDate,101) OrderDate,
          ord.OrderID OrderNumber,
          cst.lastname + ', ' + UPPER(SUBSTRING(cst.firstname,1,1)) + '.' CustomerName,
          CASE
            WHEN ord.shipAddress IS NOT NULL
              THEN ord.shipAddress
            WHEN cst.address IS NOT NULL
              THEN cst.address
            ELSE 'Unknown'
          END ShippingAddress,
          CASE
            WHEN ord.shipZip IS NOT NULL THEN ord.shipZip
            WHEN cst.zip IS NOT NULL THEN cst.zip
            ELSE 'Unknown'
          END ShippingCode,
          CASE
            WHEN ord.shipCountry IS NOT NULL
              THEN ord.shipCountry
            WHEN cst.Country IS NOT NULL
              THEN cst.Country
            ELSE 'Unknown'
          END ShippingCountry,
	     CASE
		 WHEN ord.shipCountry = 'USA'
		  THEN '('+SUBSTRING(ord.ShipPhone,1,3)+') '+ SUBSTRING(ord.ShipPhone,4,3)+'-'+ SUBSTRING(ord.ShipPhone,7,4)
		WHEN ord.shipCountry IS NULL
		THEN '('+SUBSTRING(cst.Phone,1,3)+') '+ SUBSTRING(cst.Phone,4,3)+'-'+ SUBSTRING(cst.Phone,7,4)
		ELSE ord.ShipPhone
	    END CustomerTelephone
FROM      TblOrder ord
INNER JOIN TblCustomer cst
ON          ord.CustomerID = cst.CustomerID
WHERE     YEAR(OrderDate) = YEAR(getdate()) AND MONTH(OrderDate) = 1
ORDER BY OrderDate DESC;


-- 3.
SELECT    CONVERT(varchar, ord.OrderDate,101) OrderDate,
          ord.OrderID OrderNumber,
          cst.lastname + ', ' + UPPER(SUBSTRING(cst.firstname,1,1)) + '.'CustomerName,
          CASE
            WHEN ord.shipAddress IS NOT NULL
              THEN ord.shipAddress
            WHEN cst.address IS NOT NULL
              THEN cst.address
            ELSE 'Unknown'
          END ShippingAddress,
          CASE
            WHEN ord.shipZip IS NOT NULL THEN ord.shipZip
            WHEN cst.zip IS NOT NULL THEN cst.zip
            ELSE 'Unknown'
          END ShippingCode,
          CASE
            WHEN ord.shipCountry IS NOT NULL
              THEN ord.shipCountry
            WHEN cst.Country IS NOT NULL
              THEN cst.Country
            ELSE 'Unknown'
          END ShippingCountry,
	     CASE
		 WHEN ord.shipCountry = 'USA'
		  THEN '('+SUBSTRING(ord.ShipPhone,1,3)+') '+ SUBSTRING(ord.ShipPhone,4,3)+'-'+ SUBSTRING(ord.ShipPhone,7,4)
		WHEN ord.shipCountry IS NULL
		THEN '('+SUBSTRING(cst.Phone,1,3)+') '+ SUBSTRING(cst.Phone,4,3)+'-'+ SUBSTRING(cst.Phone,7,4)
		ELSE ord.shipPhone
	    END CustomerTelephone,
          ordl.itemid ItemID,
          ordl.quantity Quantity,
          ordl.price Price,
          ordl.quantity * ordl.price ExtendedPrice
FROM      TblOrder ord
INNER JOIN TblCustomer cst
ON         ord.CustomerID = cst.CustomerID
INNER JOIN TblOrderLine ordl
ON         ordl.orderid = ord.orderid
WHERE     YEAR(OrderDate) = YEAR(getdate()) AND MONTH(OrderDate) = 1
ORDER BY OrderDate DESC;

-- 4.
SELECT    CONVERT(varchar, ord.OrderDate,101) OrderDate,
          ord.OrderID OrderNumber,
          cst.lastname + ', ' + UPPER(SUBSTRING(cst.firstname,1,1)) + '.' CustomerName,
          CASE
            WHEN ord.shipAddress IS NOT NULL
              THEN ord.shipAddress
            WHEN cst.address IS NOT NULL
              THEN cst.address
            ELSE 'Unknown'
          END ShippingAddress,
          CASE
            WHEN ord.shipZip IS NOT NULL THEN ord.shipZip
            WHEN cst.zip IS NOT NULL THEN cst.zip
            ELSE 'Unknown'
          END ShippingCode,
          CASE
            WHEN ord.shipCountry IS NOT NULL
              THEN ord.shipCountry
            WHEN cst.Country IS NOT NULL
              THEN cst.Country
            ELSE 'Unknown'
          END ShippingCountry,
	     CASE
		 WHEN ord.shipCountry = 'USA'
		  THEN '('+SUBSTRING(ord.ShipPhone,1,3)+') '+ SUBSTRING(ord.ShipPhone,4,3)+'-'+ SUBSTRING(ord.ShipPhone,7,4)
		WHEN ord.shipCountry IS NULL
		THEN '('+SUBSTRING(cst.Phone,1,3)+') '+ SUBSTRING(cst.Phone,4,3)+'-'+ SUBSTRING(cst.Phone,7,4)
		ELSE ord.shipPhone
	    END CustomerTelephone,
          ordl.itemid ItemID,
          item.description Description,
          ordl.quantity Quantity,
          ordl.price Price,
          ordl.quantity * ordl.price ExtendedPrice
FROM      TblOrder ord
INNER JOIN TblCustomer cst
ON         ord.CustomerID = cst.CustomerID
INNER JOIN TblOrderLine ordl
ON         ordl.orderid = ord.orderid
INNER JOIN tblItem item
ON ordl.itemid = item.itemid
WHERE     YEAR(OrderDate) = YEAR(getdate()) AND MONTH(OrderDate) = 1
ORDER BY OrderDate DESC;

-- 5.
SELECT    CONVERT(varchar, ord.OrderDate,101) OrderDate,
          ord.OrderID OrderNumber,
          cst.lastname + ', ' + UPPER(SUBSTRING(cst.firstname,1,1)) + '.' CustomerName,
          CASE
            WHEN ord.shipAddress IS NOT NULL
              THEN ord.shipAddress
            WHEN cst.address IS NOT NULL
              THEN cst.address
            ELSE 'Unknown'
          END ShippingAddress,
          CASE
            WHEN ord.shipZip IS NOT NULL THEN ord.shipZip
            WHEN cst.zip IS NOT NULL THEN cst.zip
            ELSE 'Unknown'
          END ShippingCode,
          CASE
            WHEN ord.shipCountry IS NOT NULL
              THEN ord.shipCountry
            WHEN cst.Country IS NOT NULL
              THEN cst.Country
            ELSE 'Unknown'
          END ShippingCountry,
	     CASE
		 WHEN ord.shipCountry = 'USA'
		  THEN '('+SUBSTRING(ord.ShipPhone,1,3)+') '+ SUBSTRING(ord.ShipPhone,4,3)+'-'+ SUBSTRING(ord.ShipPhone,7,4)
		WHEN ord.shipCountry IS NULL
		THEN '('+SUBSTRING(cst.Phone,1,3)+') '+ SUBSTRING(cst.Phone,4,3)+'-'+ SUBSTRING(cst.Phone,7,4)
		ELSE ord.shipPhone
	    END CustomerTelephone,
          ordl.itemid ItemID,
          item.description Description,
          itp.CategoryDescription CategoryDescription,
          ordl.quantity Quantity,
          ordl.price Price,
          ordl.quantity * ordl.price ExtendedPrice
FROM      TblOrder ord
INNER JOIN TblCustomer cst
ON         ord.CustomerID = cst.CustomerID
INNER JOIN TblOrderLine ordl
ON         ordl.orderid = ord.orderid
INNER JOIN tblItem item
ON ordl.itemid = item.itemid
INNER JOIN tblitemtype itp
ON item.typeid = itp.typeid
WHERE     YEAR(OrderDate) = YEAR(getdate()) AND MONTH(OrderDate) = 1
ORDER BY OrderDate DESC;

-- 6.
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          SUM(ordl.quantity) TotalQtySold,
          COUNT(*) CouuntofOrderLines,
          MIN(ordl.price) MinimumPrice,
          MAX(ordl.price) MaximumPrice,
          AVG(ordl.price) AveragePrice
FROM     tblItem item
RIGHT OUTER JOIN TblOrderLine ordl
ON ordl.itemid = item.itemid
GROUP BY item.itemid, item.description
ORDER BY item.itemid;

-- 7.
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(SUM(ordl.quantity),0) TotalQtySold,
          ISNULL(COUNT(*),0) CouuntofOrderLines,
          ISNULL(MIN(ordl.price),0) MinimumPrice,
          ISNULL(MAX(ordl.price),0) MaximumPrice,
          ISNULL(AVG(ordl.price),0) AveragePrice
FROM     tblItem item
LEFT OUTER JOIN TblOrderLine ordl
ON ordl.itemid = item.itemid
GROUP BY item.itemid, item.description
ORDEr BY item.itemid;

-- 8.
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(CONVERT(varchar,tich.LastCostDate,107),'No Date Recorded') 'Last Cost Date',
          ISNULL(tich.LastCost,0) 'Last Cost Paid'
FROM     tblItem item
LEFT OUTER JOIN tblItemCostHistory tich
ON item.itemid = tich.itemid
ORDER BY item.itemid ASC, tich.LastCostDate DESC;

-- 9.
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(CONVERT(varchar,tich.LastCostDate,107),'No Date Recorded') 'Last Cost Date',
          ISNULL(tich.LastCost,0) 'Last Cost Paid'
FROM     tblItem item
LEFT OUTER JOIN tblItemCostHistory tich
ON item.itemid = tich.itemid
WHERE LastCostDate = (SELECT MAX(LastCostDate) FROM tblItemCostHistory WHERE item.itemid = itemid) OR LastCostDate IS NULL
ORDER BY itemid;

/* alternative way
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(CONVERT(varchar,tich.LastCostDate,107),'No Date Recorded') 'Last Cost Date',
          ISNULL(tich.LastCost,0) 'Last Cost Paid'
FROM     tblItem item
LEFT OUTER JOIN tblItemCostHistory tich
ON item.itemid = tich.itemid
INNER JOIN (SELECT item.itemid,
                   MAX(tich.LastCostDate) LastCostDate
            FROM tblItem item
            LEFT OUTER JOIN tblItemCostHistory tich
            ON item.itemid = tich.itemid
            GROUP BY item.itemid) AS temp
ON temp.itemid = item.itemid AND (temp.LastCostDate = tich.LastCostDate OR temp.LastCostDate IS NULL)
*/

-- 10.
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(CONVERT(varchar,tich.LastCostDate,107),'No Date Recorded') 'Last Cost Date',
          (SELECT COUNT(*) FROM tblItemCostHistory WHERE item.itemid = itemid) CountOfPurchaces,
          ISNULL(tich.LastCost,0) 'Last Cost Paid',
          ISNULL(ROUND((SELECT AVG(lastCost) FROM tblItemCostHistory WHERE item.itemid = itemid),2),0) 'Average Last Cost'
FROM     tblItem item
LEFT OUTER JOIN tblItemCostHistory tich
ON item.itemid = tich.itemid
WHERE LastCostDate = (SELECT MAX(LastCostDate) FROM tblItemCostHistory WHERE item.itemid = itemid) OR LastCostDate IS NULL
ORDER BY itemid;

/* alterantive way
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(CONVERT(varchar,tich.LastCostDate,107),'No Date Recorded') 'Last Cost Date',
          temp.CountOfPurchaces CountOfPurchaces,
          ISNULL(tich.LastCost,0) 'Last Cost Paid',
          ISNULL(temp.AvgLastCost,0) 'Average Last Cost'
FROM     tblItem item
LEFT OUTER JOIN tblItemCostHistory tich
ON item.itemid = tich.itemid
INNER JOIN (SELECT item.itemid,
                   MAX(tich.LastCostDate) RecentLastCostDate,
                   ROUND(AVG(tich.LastCost),2) AvgLastCost,
                   COUNT(tich.LastCostDate) CountOfPurchaces
            FROM tblItem item
            LEFT OUTER JOIN tblItemCostHistory tich
            ON item.itemid = tich.itemid
            GROUP BY item.itemid) AS temp
ON temp.itemid = item.itemid AND (temp.RecentLastCostDate = tich.LastCostDate OR temp.RecentLastCostDate IS NULL);
*/

-- 11.
SELECT    ordl.OrderID OrderID,
          ordl.itemid ItemID,
          ordl.price Price,
          ordl.quantity Quantity,
          ISNULL(SUM(tsl.QtyShipped),0) TotalQuantityShipped,
          ordl.quantity - ISNULL(SUM(tsl.QtyShipped),0) LeftToShip
FROM      TblOrderLine ordl
INNER JOIN TblShipLine tsl
ON ordl.orderid = tsl.orderid AND ordl.itemid = tsl.itemid
GROUP BY ordl.orderid, ordl.itemid, ordl.price, ordl.quantity
ORDER BY ordl.orderid;

-- 12.
SELECT    ordl.OrderID OrderID,
          cst.lastname + ', ' + cst.firstname CustomerName,
          ordl.itemid ItemID,
          ordl.price Price,
          ordl.quantity Quantity,
          ISNULL(SUM(tsl.QtyShipped),0) TotalQuantityShipped,
          ordl.quantity - ISNULL(SUM(tsl.QtyShipped),0) LeftToShip
FROM      TblOrderLine ordl
INNER JOIN TblShipLine tsl
ON ordl.orderid = tsl.orderid AND ordl.itemid = tsl.itemid
LEFT OUTER JOIN TblOrder ord
ON ordl.orderid = ord.orderid
LEFT OUTER JOIN TblCustomer cst
ON ord.customerid = cst.customerid
GROUP BY ordl.orderid, ordl.itemid, ordl.price, ordl.quantity, cst.lastname, cst.firstname
ORDER BY ordl.orderid;

-- 13.
SELECT    ordl.OrderID OrderID,
          cst.lastname + ', ' + cst.firstname CustomerName,
          ordl.itemid ItemID,
          item.description Description,
          itp.CategoryDescription CategoryDescription,
          item.listprice ListPrice,
          ordl.price Price,
          ordl.quantity Quantity,
          ISNULL(SUM(tsl.QtyShipped),0) TotalQuantityShipped,
          ordl.quantity - ISNULL(SUM(tsl.QtyShipped),0) LeftToShip
FROM      TblOrderLine ordl
INNER JOIN TblShipLine tsl
ON ordl.orderid = tsl.orderid AND ordl.itemid = tsl.itemid
LEFT OUTER JOIN TblOrder ord
ON ordl.orderid = ord.orderid
LEFT OUTER JOIN TblCustomer cst
ON ord.customerid = cst.customerid
LEFT OUTER JOIN tblItem item
ON ordl.itemid = item.itemid
LEFT OUTER JOIN tblitemtype itp
ON item.typeid = itp.typeid
GROUP BY ordl.orderid, ordl.itemid, ordl.price, ordl.quantity,
         cst.lastname, cst.firstname, item.description, itp.CategoryDescription,
         item.listprice
ORDER BY ordl.orderid;

-- 14.
SELECT    ordl.OrderID OrderID,
          cst.lastname + ', ' + cst.firstname CustomerName,
          ordl.itemid ItemID,
          item.description Description,
          itp.CategoryDescription CategoryDescription,
          item.listprice ListPrice,
          ordl.price Price,
          ordl.quantity Quantity,
          ISNULL(SUM(tsl.QtyShipped),0) TotalQuantityShipped,
          ordl.quantity - ISNULL(SUM(tsl.QtyShipped),0) LeftToShip
FROM      TblOrderLine ordl
INNER JOIN TblShipLine tsl
ON ordl.orderid = tsl.orderid AND ordl.itemid = tsl.itemid
LEFT OUTER JOIN TblOrder ord
ON ordl.orderid = ord.orderid
LEFT OUTER JOIN TblCustomer cst
ON ord.customerid = cst.customerid
LEFT OUTER JOIN tblItem item
ON ordl.itemid = item.itemid
LEFT OUTER JOIN tblitemtype itp
ON item.typeid = itp.typeid
GROUP BY ordl.orderid, ordl.itemid, ordl.price, ordl.quantity,
         cst.lastname, cst.firstname, item.description, itp.CategoryDescription,
         item.listprice
HAVING ordl.quantity - ISNULL(SUM(tsl.QtyShipped),0) < 0
ORDER BY ordl.orderid;

-- 15.
SELECT    cst.lastname + ', ' + cst.firstname CustomerName,
          ordl.OrderID OrderID,
          ordl.itemid ItemID,
          item.description Description
FROM      TblOrderLine ordl
INNER JOIN TblShipLine tsl
ON ordl.orderid = tsl.orderid AND ordl.itemid = tsl.itemid AND UPPER(tsl.methodshipped) = 'FEDEX'
INNER JOIN TblOrder ord
ON ordl.orderid = ord.orderid
INNER JOIN TblCustomer cst
ON ord.customerid = cst.customerid
INNER JOIN tblItem item
ON ordl.itemid = item.itemid
ORDER BY CustomerName;
