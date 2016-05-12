DROP TABLE  tblItemCostHistory,
            TblShipLine,
            tblReview,
            TblItemLocation,
            tblOrderLine,
            TblOrder,
            tblItem,
            tblItemType,
            TblCustomer;

CREATE TABLE TblCustomer(
  CustomerID char(5)      NOT NULL,
  LastName   varchar(30)  NOT NULL,
  FirstName  varchar(20),
  Address    varchar(30)  NOT NULL,
  City       varchar(20)  NOT NULL,
  State      char(2)      NOT NULL,
  Zip        varchar(12)  NOT NULL,
  Country    varchar(15),
  FirstBuyDate  datetime,
  Email      varchar(60),
  Phone      char(15)     NOT NULL
  CONSTRAINT pkTblCustomer PRIMARY KEY (CustomerID),
);

CREATE TABLE TblOrder(
  OrderID       char(6)     NOT NULL,
  OrderDate     datetime    NOT NULL,
  DiscountCode  char(2)     CHECK (DiscountCode in ('02','03','04','06','08','10','A1','B3')),
  CreditCode    char(3)     NOT NULL,
  ShipName      varchar(30),
  ShipAddress   varchar(30),
  ShipZip       varchar(12),
  ShipCountry   varchar(30),
  ShipPhone     char(15),
  CustomerID    char(5)     NOT NULL,
  PrimaryOrderID Char(6),
  CONSTRAINT pkTblOrder PRIMARY KEY (OrderID),
  CONSTRAINT fkTblCustomer FOREIGN KEY (CustomerID) REFERENCES TblCustomer(CustomerID),
  CONSTRAINT fkTblOrder FOREIGN KEY (PrimaryOrderID) REFERENCES TblOrder(OrderID)
);

CREATE TABLE tblItemType(
  TypeID                int         NOT NULL,
  CategoryDescription  varchar(50),
  CONSTRAINT pkTblItemType PRIMARY KEY (TypeID)
);

CREATE TABLE tblItem(
  ItemID      char(6)       NOT NULL,
  Description varchar(300),
  ListPrice    money        NOT NULL CHECK (ListPrice > 5),
  TypeID       int          NOT NULL,
  CONSTRAINT pktblItem      PRIMARY KEY (ItemID),
  CONSTRAINT fktblItemType FOREIGN KEY (TypeID) REFERENCES tblItemType(TypeID)
);

CREATE TABLE tblOrderLine(
  OrderID    char(6)   NOT NULL,
  ItemID   char(6)   NOT NULL,
  Quantity  int       NOT NULL CHECK (Quantity > 0),
  Price     money     NOT NULL CHECK (Price > 0),
  CONSTRAINT pktblOrderLine PRIMARY KEY (OrderID, ItemID),
  CONSTRAINT fkTblOrder2 FOREIGN KEY (OrderID) REFERENCES TblOrder(OrderID),
  CONSTRAINT fktblItem FOREIGN KEY (ItemID) REFERENCES tblItem(ItemID)
);

CREATE TABLE TblItemLocation(
  ItemID      char(6)   NOT NULL,
  LocationID  char(2)   NOT NULL,
  QtyOnHand   int
  CONSTRAINT pkTblItemLocation PRIMARY KEY (ItemID, LocationID)
  CONSTRAINT fktblItem2         FOREIGN KEY (ItemID)  REFERENCES tblItem(ItemID)
);

CREATE TABLE TblShipLine(
  DateShipped   datetime    NOT NULL,
  OrderID       char(6)     NOT NULL,
  ItemID        char(6)     NOT NULL,
  LocationID    char(2)     NOT NULL,
  QtyShipped    int         NOT NULL,
  MethodShipped varchar(30) NOT NULL
  CONSTRAINT pkTblShipLine      PRIMARY KEY (DateShipped, OrderID, ItemID, LocationID),
  CONSTRAINT fkTblOrder3         FOREIGN KEY (OrderID) REFERENCES TblOrder(OrderID),
  CONSTRAINT fktblItem3          FOREIGN KEY (ItemID)  REFERENCES tblItem(ItemID),
  CONSTRAINT fkTblItemLocation  FOREIGN KEY (ItemID, LocationID)
                                REFERENCES TblItemLocation(ItemID, LocationID),
);

CREATE TABLE tblItemCostHistory(
  ItemID        char(6)     NOT NULL,
  LastCostDate  datetime    NOT NULL,
  LastCost      money       NOT NULL,
  CONSTRAINT pkTblItemCostHistory   PRIMARY KEY (ItemID, LastCostDate),
  CONSTRAINT fktblItem4        FOREIGN KEY (ItemID)  REFERENCES tblItem(ItemID),
);

CREATE TABLE tblReview(
  ReviewID    int         NOT NULL,
  ReviewDate  datetime ,
  Rating      int         CHECK (Rating in (1,2,3,4,5)),
  ReviewText  varchar(500),
  OrderID     char(6)     NOT NULL,
  ItemID      char(6)     NOT NULL,
  CONSTRAINT pktblReview     PRIMARY KEY (ReviewID),
  CONSTRAINT fktblOrderLine      FOREIGN KEY (OrderID, ItemID)
                                 REFERENCES tblOrderLine(OrderID, ItemID)
);

SELECT * FROM	TblCustomer "Customer";
SELECT * FROM	tblItem "Item";
SELECT * FROM	tblItemCostHistory "Item Cost History";
SELECT * FROM	TblItemLocation "Item Location";
SELECT * FROM	tblReview "Item Review";
SELECT * FROM	tblItemType "Item Type";
SELECT * FROM	TblOrder "Order";
SELECT * FROM	tblOrderLine "Order Line";
SELECT * FROM	TblShipLine "Ship Line";
