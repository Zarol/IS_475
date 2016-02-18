CREATE TABLE xtblRawMaterial
(MaterialID		char(3),
 Description	varchar(50),
 UnitOfMeasure	char(8),
 StandardPrice	money CHECK (standardprice > 0),
 CONSTRAINT pkRawMaterial PRIMARY KEY (MaterialID));

CREATE TABLE xtblVendorMaterial
(VendorID		char(4),
 MaterialID		char(3),
 CurrentPrice	money		NOT NULL,
 CONSTRAINT pkVendorMaterial
 PRIMARY KEY	(VendorID, MaterialID),
 CONSTRAINT fkVendor
 FOREIGN KEY	(VendorID) REFERENCES xtblVendor (vendorID),
 CONSTRAINT fkRM
 FOREIGN KEY	(MaterialID) REFERENCES xtblRawMaterial (MaterialID));

 CREATE TABLE xtblMaterialLocation
 (VendorID			char(4),
  MaterialID		char(3),
  LocationID		char(3),
  QuantityOnHand	decimal(8,3),
  CONSTRAINT pkMaterialLocation
  PRIMARY KEY		(VendorID, MaterialID, LocationID),
  CONSTRAINT fkVendorMaterial
  FOREIGN KEY		(VendorID, MaterialID)
  REFERENCES		xtblVendorMaterial (VendorID, MaterialID));

  INSERT INTO xtblRawMaterial VALUES
('255', 'Concrete Overlay Polymer', 'pound', 13.75),
('240', 'Mortar Mix', null, .23),
('271', 'Graphite Isomolded Sheet', 'each', 46.70);

INSERT INTO xtblVendorMaterial VALUES
('7819', '255', 14.25),
('62', '255', 13.95),
('0062', '271', 46.70),
('7819', '240', .26);

INSERT INTO xtblMaterialLocation VALUES
('7819', '255', '12', 700.25),
('7819', '255', '15', 600.88),
('7819', '240', '12', 124),
('0062', '271', '81', 5505),
('0062', '240', '81', 6); --0062 / 240 does not exist within xtblVendorMaterial