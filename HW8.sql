-- 1. Modifications
UPDATE TblOrder
SET OrderDate = '1/15/2016'
WHERE OrderID = '567123';

UPDATE TblOrder
SET OrderDate = '2/10/2016'
WHERE OrderID = '671100';

UPDATE TblShipLine
SET MethodShipped = LOWER(MethodShipped);

UPDATE TblCustomer
SET state = UPPER(state);

DELETE FROM TblOrder
WHERE orderID not in (SELECT tblOrderline.OrderID
          FROM tblOrderLine
          JOIN TblOrder
          ON TblOrder.orderid = tblOrderline.orderid
          GROUP BY tblOrderline.orderid);
-- 2.
CREATE VIEW tblQuantitySummary AS
SELECT orderID,
       itemID,
       SUM(QtyShipped) TotalShipped
FROM TblShipLine
GROUP BY orderID,itemID;

CREATE VIEW tblShippingStatus AS
SELECT ord.OrderID,
       ord.OrderDate,
       customer.lastname + ', ' + UPPER(SUBSTRING(customer.firstname,1,1)) CustomerName,
       orderline.ItemID,
       item.description ItemDescription,
       orderline.Quantity,
       ISNULL(qsummary.TotalShipped,0) TotalShipped,
       (orderline.Quantity-ISNULL(qsummary.TotalShipped,0)) QuantityRemaining,
      CASE
          WHEN ISNULL(qsummary.TotalShipped,0) = 0
            THEN 'Not Shipped'
          WHEN (orderline.Quantity-ISNULL(qsummary.TotalShipped,0)) = 0
           THEN 'Completely Shipped'
          WHEN (orderline.Quantity-ISNULL(qsummary.TotalShipped,0)) < 0
           THEN 'Over Shipped'
          WHEN (orderline.Quantity-ISNULL(qsummary.TotalShipped,0)) > 0
            THEN 'Partially Shipped'
        END ShippingStatus

FROM TblOrder as ord
INNER JOIN tblOrderLine as orderline
ON ord.orderid = orderline.orderid
LEFT OUTER JOIN tblItem as item
ON item.itemid = orderline.itemid
LEFT OUTER JOIN TblCustomer as customer
ON customer.customerId = ord.customerId
LEFT OUTER JOIN tblQuantitySummary  as qsummary
ON qsummary.orderid = ord.orderid AND qsummary.itemid = orderline.itemid

-- 3.
SELECT *
FROM tblShippingStatus
WHERE QuantityRemaining < 0

-- 4.
CREATE VIEW tblOpenOrders AS
SELECT
    OrderID
FROM tblShippingStatus
WHERE ShippingStatus = 'Not Shipped' or ShippingStatus =  'Partially Shipped'
GROUP BY orderid

SELECT *
FROM tblShippingStatus as shipstatus
RIGHT OUTER JOIN tblOpenOrders
ON tblOpenOrders.orderid = shipstatus.orderid

-- 5
CREATE VIEW tbllastdate AS
SELECT itemid, MAX(LastCostDate) LastCostDate
FROM tblItemCostHistory GROUP BY itemid;

CREATE VIEW tblLastItem AS
SELECT    item.itemid ItemID,
          item.description ItemDescription,
          ISNULL(CONVERT(varchar,tich.LastCostDate,107),'No Previous Purchase') LastCostDate,
          ISNULL(tich.LastCost,0) LastCostPaid
FROM     tblItem item
LEFT OUTER JOIN tbllastdate tld
ON tld.itemid = item.itemid
LEFT OUTER JOIN tblItemCostHistory tich
ON item.itemid = tich.itemid AND tich.lastcostdate = tld.lastcostdate;

CREATE VIEW tblTinyEpic AS
SELECT customer.lastname + ', ' + customer.firstname  CustomerName,
       ord.OrderID OrderID,
       CONVERT(varchar,ord.OrderDate,107) OrderDate,
       orderline.ItemID ItemID,
       item.description ItemDescription,
       orderline.price PricePaid,
       lastitem.LastCostPaid MostCurrentCost,
       lastitem.LastCostDate LastCostDate,
       orderline.price - lastitem.LastCostPaid DifferenceBetweenPriceAndCost

FROM TblOrder as ord
INNER JOIN tblOrderLine as orderline
ON ord.orderid = orderline.orderid
LEFT OUTER JOIN tblItem as item
ON item.itemid = orderline.itemid
LEFT OUTER JOIN TblCustomer as customer
ON customer.customerId = ord.customerId
LEFT OUTER JOIN tbllastitem as lastitem
ON lastitem.itemid = orderline.itemid
WHERE item.description = 'Tiny Epic Galaxies';

SELECT *
FROM tbltinyepic
WHERE DifferenceBetweenPriceAndCost = (SELECT MIN(DifferenceBetweenPriceAndCost) FROM tbltinyepic);

-- 6.
CREATE VIEW tblDiffPrice AS
SELECT ord.OrderID OrderID,
       CONVERT(varchar,ord.OrderDate,107) OrderDate,
     customer.lastname + ', ' + customer.firstname  CustomerName,
       orderline.ItemID ItemID,
       item.description ItemDescription,
     orderline.quantity QtyOrdered,
       orderline.price PricePaid,
       lastitem.LastCostPaid MostCurrentCost,
       lastitem.LastCostDate LastCostDate,
       orderline.price - lastitem.LastCostPaid DifferenceBetweenPriceAndCost,
     orderline.quantity*(orderline.price - lastitem.LastCostPaid)  ExtendedDifference

FROM TblOrder as ord
INNER JOIN tblOrderLine as orderline
ON ord.orderid = orderline.orderid
LEFT OUTER JOIN tblItem as item
ON item.itemid = orderline.itemid
LEFT OUTER JOIN TblCustomer as customer
ON customer.customerId = ord.customerId
LEFT OUTER JOIN tbllastitem as lastitem
ON lastitem.itemid = orderline.itemid;

SELECT *
FROM tblDiffPrice
WHERE orderid = (SELECT orderid FROM tblSumExtDiff
           WHERE SumOfExtDiff = (SELECT MAX(SumOfExtDiff)
                     FROM tblSumExtDiff));

-- 7.
CREATE VIEW tblTotalOrder AS
SELECT customer.lastname + ', ' + customer.firstname CustomerName,
       '('+SUBSTRING(customer.Phone,1,3)+') '+ SUBSTRING(customer.Phone,4,3)+'-'+ SUBSTRING(customer.Phone,7,4) CustomerTelephoneNumber,
       SUM(orderline.quantity) TotalNumberofItemsOrdered
FROM TblOrder as ord
INNER JOIN tblOrderLine as orderline
ON ord.orderid = orderline.orderid
LEFT OUTER JOIN tblItem as item
ON item.itemid = orderline.itemid
LEFT OUTER JOIN TblCustomer as customer
ON customer.customerId = ord.customerId
GROUP BY customer.lastname,customer.firstname, customer.phone;

SELECT CustomerName 'Customer Name',
     CustomerTelephoneNumber 'Customer Telephone Number',
     TotalNumberofItemsOrdered 'Total Number of Items Ordered'
FROM tblTotalOrder
WHERE TotalNumberofItemsOrdered = (SELECT MAX(TotalNumberofItemsOrdered)
                     FROM tblTotalOrder)

-- 8.
CREATE VIEW tblTotallQtOrderedinNV AS
SELECT orderline.itemID,
       SUM(orderline.quantity) TotalQuantityOrdered
FROM tblOrderLine as orderline
LEFT OUTER JOIN TblOrder as ord
ON ord.orderid = orderline.orderid
LEFT OUTER JOIN TblCustomer as customer
ON customer.customerid = ord.customerid
WHERE customer.state = 'NV'
GROUP BY orderline.itemID

CREATE VIEW itemordersummary AS
SELECT lastitem.ItemID ItemID,
       item.description ItemDescription,
       ISNULL(ttqo.TotalQuantityOrdered,0) TotalQuantityOrdered,
       lastitem.LastCostPaid MostCurrentCost,
       lastitem.LastCostDate LastCostDate
FROM tbllastitem as lastitem
LEFT OUTER JOIN tblTotallQtOrderedinNV as ttqo
ON ttqo.itemid = lastitem.itemid
LEFT OUTER JOIN tblItem as item
ON item.itemid = lastitem.itemid

SELECT * FROM itemordersummary
WHERE itemid in (SELECT itemid FROM itemordersummary
         WHERE TotalQuantityOrdered = (SELECT MAX(TotalQuantityOrdered)
                         FROM itemordersummary))

-- 9.
CREATE VIEW tblTotallQtOrdered AS
SELECT orderline.itemID,
       SUM(orderline.quantity) TotalQuantityOrdered,
       COUNT(*) NumberOfOrderes
FROM tblOrderLine as orderline
GROUP BY orderline.itemID

CREATE VIEW itemPriceStats AS
SELECT itemID,
     MAX(price) MostExpensivePrice,
     MIN(price) LeastExpensivePrice,
     AVG(price) AveragePrice
FROM tblOrderLine
GROUP BY itemID;

CREATE VIEW itemCostStats AS
SELECT itemID,
     MAX(lastcost) MostExpensiveCost,
     MIN(lastcost) LeastExpensiveCost,
     AVG(lastcost) AverageCost
FROM tblItemCostHistory
GROUP BY itemID;

SELECT item.itemid ItemID,
       item.description ItemDescription,
       itemtype.categorydescription CategoryDescription,
       ISNULL(ttqo.TotalQuantityOrdered,0) TotalQtyOnOrder,
       ISNULL(ttqo.NumberOfOrderes,0) NumberOfOrders,
       ISNULL(iprice.MostExpensivePrice,0),
       ISNULL(iprice.LeastExpensivePrice,0),
       ISNULL(iprice.AveragePrice,0),
       ISNULL(icost.MostExpensiveCost,0),
       ISNULL(icost.LeastExpensiveCost,0),
       ISNULL(icost.AverageCost,0),
       ilast.LastCostDate LastCostDate,
       ISNULL(ilast.LastCostPaid,0) MostCurrentCost
FROM tblItem as item
LEFT OUTER JOIN tblitemtype as itemtype
ON itemtype.typeid = item.typeid
LEFT OUTER JOIN tblTotallQtOrdered as ttqo
ON ttqo.itemid = item.itemid
LEFT OUTER JOIN itemPriceStats as iprice
ON iprice.itemid = item.itemid
LEFT OUTER JOIN itemCostStats as icost
ON icost.itemid = item.itemid
LEFT OUTER JOIN tblLastItem as ilast
ON ilast.itemid = item.itemid

-- 10
CREATE VIEW tblClosedOrders AS
SELECT ord.orderid
FROM tblOrder as ord
LEFT OUTER JOIN tblOpenOrders as openord
ON openord.orderid = ord.orderid
WHERE openord.orderid is NULL
GROUP BY ord.orderid

SELECT ord.orderid OrderID,
       ord.customerid CustomerID,
       customer.lastname + ', ' + UPPER(SUBSTRING(customer.firstname,1,1)) CustomerName,
       ISNULL(ord.primaryorderid,'N/A') PrimaryOrderId,
       ISNULL(CONVERT(varchar,(SELECT OrderDate FROM tblorder as inord WHERE inord.orderid = ord.primaryorderid),107),'No Primary Order') PrimaryOrderDate,
       CONVERT(varchar, ord.orderdate, 107) OrderDate,
      CONVERT(varchar,(SELECT MIN(DateShipped) FROM tblShipLine WHERE ord.orderid = orderid GROUP BY orderid),107) FirstDateShipped,
      CONVERT(varchar,(SELECT MAX(DateShipped) FROM tblShipLine WHERE ord.orderid = orderid GROUP BY orderid),107) LastDateShipped
FROM tblorder as ord
RIGHT OUTER JOIN tblClosedOrders as closeorder
ON closeorder.orderid = ord.orderid
LEFT OUTER JOIN TblCustomer as customer
ON customer.customerid = ord.customerid

-- 11.
CREATE VIEW itemAvailable AS
SELECT itemid, SUM(qtyonhand) TotalQtyOnHand FROM tblItemLocation
GROUP BY itemid;

CREATE VIEW openitem AS
SELECT itemid,
     sum(Quantity) Quantity,
     sum(TotalShipped) Shipped,
     sum(QuantityRemaining) Remained
FROM tblShippingStatus
WHERE ShippingStatus = 'Partially Shipped' or ShippingStatus = 'Not Shipped'
GROUP BY itemid

SELECT  item.itemid ItemID,
        item.description ItemDescription,
        openitem.Remained 'Total Left to Ship',
        iavail.TotalQtyonHand 'Total Available in Inventory',
        openitem.Remained - iavail.TotalQtyonHand 'Quantity Short'
FROM tblItem as item
LEFT OUTER JOIN itemAvailable as iavail
ON iavail.itemid = item.itemid
LEFT OUTER JOIN openitem
ON openitem.itemid = item.itemid
WHERE  openitem.Remained - iavail.TotalQtyonHand > 0

-- drop virtual tables
DROP VIEW tblQuantitySummary;
DROP VIEW tblShippingStatus;
DROP VIEW tblOpenOrders;
DROP VIEW tbllastdate;
DROP VIEW tblLastItem;
DROP VIEW tblTinyEpic;
DROP VIEW tblDiffPrice;
DROP VIEW tblTotalOrder;
DROP VIEW tblTotallQtOrderedinNV;
DROP VIEW itemordersummary;
DROP VIEW tblTotallQtOrdered;
DROP VIEW itemPriceStats;
DROP VIEW itemCostStats;
DROP VIEW itemAvailable;
DROP VIEW itemOnShip;
DROP VIEW itemOnOrder;
