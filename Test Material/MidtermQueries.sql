--QUESTION 1
SELECT	ItemID "itemid",
		Description "ItemDescription",
		ListPrice "ListPrice"
FROM	TblItem
WHERE	typeID = 12 OR typeID = 15
ORDER BY	ItemID;

--QUESTION 2
SELECT	TblItem.ItemID "itemid",
		TblItem.Description "ItemDescription",
		TblItemType.CategoryDescription "CategoryDescription",
		TblItem.ListPrice "ListPrice"
FROM	TblItem
INNER JOIN	TblItemType
ON	TblItem.TypeID = TblItemType.TypeID
WHERE	TblItem.typeID = 12 OR TblItem.typeID = 15
ORDER BY	ItemID;

--QUESTION 3
SELECT	TblItem.ItemID "itemid",
		TblItem.Description "ItemDescription",
		TblItemType.CategoryDescription "CategoryDescription",
		CASE
			WHEN TblOrderLine.OrderID IS NULL
				THEN '*n/a*'
			ELSE
				TblOrderLine.OrderID
		END "OrderID",
		TblOrderLine.Quantity "Quantity",
		TblItem.ListPrice "ListPrice",
		TblOrderLine.Price "Price",
		TblOrderLine.Price - TblItem.ListPrice "PriceDifference"
FROM	TblItem
INNER JOIN	TblItemType
ON	TblItem.TypeID = TblItemType.TypeID
LEFT OUTER JOIN TblOrderLine
ON TblItem.ItemID = TblOrderLine.ItemID
WHERE	TblItem.typeID = 12 OR TblItem.typeID = 15
ORDER BY	ItemID;

--QUESTION 4
SELECT	TblItem.ItemID "itemid",
		TblItem.Description "ItemDescription",
		TblItemType.CategoryDescription "CategoryDescription",
		CASE
			WHEN TblOrderLine.OrderID IS NULL
				THEN '*n/a*'
			ELSE
				TblOrderLine.OrderID
		END "OrderID",
		CONVERT(VARCHAR(12), TblOrder.OrderDate, 107) "OrderDate",
		CASE
			WHEN TblOrder.CustomerID IS NULL
				THEN 'No Current Order'
			ELSE
				CONCAT(TblCustomer.LastName, ', ', TblCustomer.FirstName)
		END "CustomerName",
		TblOrderLine.Quantity "Quantity",
		TblItem.ListPrice "ListPrice",
		TblOrderLine.Price "Price",
		TblOrderLine.Price - TblItem.ListPrice "PriceDifference"
FROM	TblItem
INNER JOIN	TblItemType
ON	TblItem.TypeID = TblItemType.TypeID
LEFT OUTER JOIN TblOrderLine
ON TblItem.ItemID = TblOrderLine.ItemID
LEFT OUTER JOIN TblOrder
ON TblOrderLine.OrderID = TblOrder.OrderID
LEFT OUTER JOIN TblCustomer
ON TblOrder.CustomerID = TblCustomer.CustomerID
WHERE	TblItem.typeID = 12 OR TblItem.typeID = 15
ORDER BY	ItemID;

--QUESTION 5
SELECT	TblItem.ItemID "ItemID",
		TblItem.Description "Description",
		TblItem.ListPrice "ListPrice",
		TblItemType.CategoryDescription "CategoryDescription"
FROM	TblItem
INNER JOIN	TblItemType
ON	TblItem.TypeID = TblItemType.TypeID
WHERE	EXISTS (SELECT	*
				FROM	TblReview
				WHERE	TblReview.ItemID = TblItem.ItemID);

--QUESTION 6
SELECT	DISTINCT CONCAT(TblCustomer.LastName, ', ', TblCustomer.FirstName) "CustomerName",
		(SELECT	COUNT(*)
		 FROM	TblOrder
		 WHERE	TblOrder.CustomerID = TblCustomer.CustomerID) "CountOfOrders"
FROM	TblCustomer
INNER JOIN	TblOrder
ON	TblCustomer.CustomerID = TblOrder.CustomerID;

--QUESTION 7
SELECT	DISTINCT CONCAT(TblCustomer.LastName, ', ', TblCustomer.FirstName) "CustomerName",
		(SELECT	COUNT(*)
		 FROM	TblOrder
		 WHERE	TblOrder.CustomerID = TblCustomer.CustomerID) "CountOfOrders",
		(SELECT COUNT(*)
		 FROM	TblOrder
		 INNER JOIN TblOrderLine
		 ON TblOrder.OrderID = TblOrderLine.OrderID
		 GROUP BY TblOrder.OrderID) "CountOfItems",
		(SELECT AVG(TblOrderLine.Price)
		 FROM	TblOrderLine
		 WHERE	TblOrder.OrderID = TblOrderLine.OrderID) "AveragePrice",
		(SELECT MIN(TblOrderLine.Price)
		 FROM	TblOrderLine
		 WHERE	TblOrder.OrderID = TblOrderLine.OrderID) "MinimumPrice",
		(SELECT MAX(TblOrderLine.Price)
		 FROM	TblOrderLine
		 WHERE	TblOrder.OrderID = TblOrderLine.OrderID) "MaximumPrice"
FROM	TblCustomer
INNER JOIN	TblOrder
ON	TblCustomer.CustomerID = TblOrder.CustomerID;

--QUESTION 8
SELECT	DISTINCT TOP 1 CONCAT(TblCustomer.LastName, ', ', TblCustomer.FirstName) "CustomerName",
		(SELECT	COUNT(*)
		 FROM	TblOrder
		 WHERE	TblOrder.CustomerID = TblCustomer.CustomerID) "CountOfOrders",
		(SELECT COUNT(*)
		 FROM	TblOrderLine
		 WHERE TblOrder.OrderID = TblOrderLine.OrderID
		 GROUP BY TblOrderLine.OrderID) "CountOfItems",
		(SELECT AVG(TblOrderLine.Price)
		 FROM	TblOrderLine
		 WHERE	TblOrder.OrderID = TblOrderLine.OrderID) "AveragePrice",
		(SELECT MIN(TblOrderLine.Price)
		 FROM	TblOrderLine
		 WHERE	TblOrder.OrderID = TblOrderLine.OrderID) "MinimumPrice",
		(SELECT MAX(TblOrderLine.Price)
		 FROM	TblOrderLine
		 WHERE	TblOrder.OrderID = TblOrderLine.OrderID) "MaximumPrice"
FROM	TblCustomer
INNER JOIN	TblOrder
ON	TblCustomer.CustomerID = TblOrder.CustomerID;