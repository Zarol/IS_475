CREATE TABLE xtblVendor
(VendorID		char(4),
 VendorName		varchar(30),
 FirstBuyDate	datetime
 CONSTRAINT pkVendor PRIMARY KEY (vendorID));

INSERT INTO xtblVendor VALUES
('7819', 'Martinson Concrete and Supply', '04/15/2015'),
('2745', 'Johnson Plating', '14-oct-2014'),
('0062', 'Evergreen Surface Products', '01-12-2016');

INSERT INTO xtblVendor Values
(0062, 'Touchstone Materials', '05-16-15');