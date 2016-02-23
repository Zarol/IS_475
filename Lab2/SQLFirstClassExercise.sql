DROP TABLE xtblMaterialLocation;
DROP TABLE xtblVendorMaterial;
DROP TABLE xtblRawMaterial;
DROP TABLE xtblVendor;



CREATE TABLE xtblVendor
(VendorID		char(4),
  VendorName		varchar(30),
  FirstBuyDate		datetime
  CONSTRAINT pkVendor PRIMARY KEY (vendorID));


INSERT INTO xtblVendor VALUES
('7819', 'Martinson Concrete and Supply', '04/15/2015');
INSERT INTO xtblVendor VALUES
('2745', 'Johnson Plating', '14-oct-2015');
INSERT INTO xtblVendor VALUES
('0062', 'Evergreen Surface Products', '07-12-99');
INSERT INTO xtblVendor VALUES
(0062, 'Touchstone Materials', '01-16-16');



CREATE TABLE	xtblRawMaterial
(MaterialID		char(3),
 Description	varchar(50),
 UnitOfMeasure	char(8),
 StandardPrice	money  CHECK (standardprice > 0),
 CONSTRAINT	pkRawMaterial PRIMARY KEY (MaterialID));

Insert into xtblrawmaterial values
('255', 'Concrete Overlay Polymer', 'pound', 13.75),
('240', 'Mortar Mix', null, .23),
('288', 'Titanium Glass Mixture', 'each', 236.78),
('271', 'Graphite Ismolded Sheet', 'each', 46.70),
('124', 'Polyester Sheeting', 'ft', .05);




CREATE TABLE 	xtblVendorMaterial
(VendorID		char(4),
 MaterialID		char(3),
 CurrentPrice	money		NOT NULL,
 CONSTRAINT pkVendorMaterial
 PRIMARY KEY 	(VendorID, MaterialID),
 CONSTRAINT	fkVendor
 FOREIGN KEY	(VendorID) REFERENCES xtblVendor (vendorID),
 CONSTRAINT	fkRM
 FOREIGN KEY	(MaterialID) REFERENCES xtblRawMaterial (MaterialID));


INSERT INTO xtblVendorMaterial VALUES
('7819', '288', 12.95);
insert into xtblvendormaterial values
('7819', '255', 14.25);
insert into xtblvendormaterial values
('62', '255', 13.95);
insert into xtblvendormaterial values
('0062', '271', 46.70);
insert into xtblvendormaterial values
('7819', '240', .26);

CREATE TABLE 	xtblMaterialLocation
(VendorID		char(4),
 MaterialID		char(3),
 LocationID		char(3),
 QuantityOnHand	decimal(8,3),
 CONSTRAINT pkMaterialLocation
 PRIMARY KEY 	(VendorID, MaterialID, LocationID),
 CONSTRAINT fkVendorMaterial
 FOREIGN KEY	(VendorID, MaterialID) 
 REFERENCES 	xtblVendorMaterial (VendorID, MaterialID));


Insert into xtblmateriallocation values
('7819', '255', '12', 700.25),
('7819', '255', '15', 600.88),
('7819', '240', '12', 124),
('0062', '271', '81', 5505);

 







