INSERT INTO tblItemType VALUES('10','Classic Board Games');
INSERT INTO tblItemType VALUES('11','Word Games');
INSERT INTO tblItemType VALUES('12','Science Fiction and Fantasy');
INSERT INTO tblItemType VALUES('15','Mystery and Thrillers');
INSERT INTO tblItemType VALUES('16','Romance');
INSERT INTO tblItemType VALUES('17','Comedy and Jokes');
INSERT INTO tblItemType VALUES('18','Risque and Adult Material');
INSERT INTO tblItemType VALUES('20','Office and Team Building');

INSERT INTO tblItem VALUES('A23441','New York City Monopoly Game Collector''s Edition','29.95','10');
INSERT INTO tblItem VALUES('A23771','Mysterium','132.99','12');
INSERT INTO tblItem VALUES('A34665','Boggle Deluxe 5x5','34.95','10');
INSERT INTO tblItem VALUES('A34882','Perudo','10.95','10');
INSERT INTO tblItem VALUES('A45111','How to Host a Murder - An Affair to Dismember','28.95','15');
INSERT INTO tblItem VALUES('B67123','Tiny Epic Galaxies','39.99','12');
INSERT INTO tblItem VALUES('B67466','Diplomacy: Game of Negotiation, Cunning and Deceit.','43.95','20');
INSERT INTO tblItem VALUES('B78244','Code Names','19.95','15');
INSERT INTO tblItem VALUES('B78500','Pandemic Legacy','59.99','12');
INSERT INTO tblItem VALUES('C26133','Knowledge Management: Create a Learning Organization','395.95','20');
INSERT INTO tblItem VALUES('C29179','Managing Change: The Game for an Executive Retreat','259.95','20');
INSERT INTO tblItem VALUES('C34122','A Game of Strategy, Negotiation and Excitement for Office Retreats','169.95','20');

INSERT INTO tblcustomer VALUES('00405','Barrington','Margaret','1765 Roundtree Pkwy','reno','nv','89509-1454','USA','07/12/06','barry@hotmail.com','7757464561');
INSERT INTO tblcustomer VALUES('00625','Dao','Phong','341 West Park','Fresno','CA','96137',NULL,'9/2/15','daop@gmail.com','8582138982');
INSERT INTO tblcustomer VALUES('06774','Phillips','Kendall','44512 Sawbuck Path','SPARKS','nv','89432','USA','8/12/00','flipper@gmail.com','7753324636');
INSERT INTO tblcustomer VALUES('07831','Rodriguez','Karen','4589 Marthiam','Chico','CA','97111',NULL,'11/6/08','rodriguez@aol.com','8193821828');
INSERT INTO tblcustomer VALUES('08892','Twillers','Bethany','P.O.Box 5661','san jose','ca','98123','USA','4/1/00','twillbeth@yahoo.com','8098291838');
INSERT INTO tblcustomer VALUES('12001','Cranston','Brittany','12 Sandstone','Sparks','NV','89431',NULL,'4/12/14','britters@ccb.com','7753312199');
INSERT INTO tblcustomer VALUES('12006','Martinez','Guadalupe','223 North Pinetree Drive','Reno','NV','89511',NULL,'02/14/12','gmartinez@ccu.edu','7758837612');
INSERT INTO tblcustomer VALUES('21142','Candriller','Kathy','2 Sedgeway','Laguna Beach','CA','94567',NULL,'12/11/15','kriller@mbu.edu','6198813929');
INSERT INTO tblcustomer VALUES('21143','Jackson','Janice','2341 Bramble Bush Drive','Sparks','NV','89431-0112',NULL,'5/6/14','jj@isp.all.com','7753317188');
INSERT INTO tblcustomer VALUES('29188','Polanski','Tiffany','5778 Battlemount Ct.','RENO','NV','89507',NULL,'8/23/11','skipole@gmail.com','7757465771');
INSERT INTO tblcustomer VALUES('30192','Chen','Lian','2319 Crest Dr','REno','Nv','89503-0113',NULL,'8/30/99','jester@here.com','7757218991');
INSERT INTO tblcustomer VALUES('32018','Jones','Martin','10 South Wilders','reno','nv','89503-8912','USA','2/12/16','mmm@hard.com','7753314838');
INSERT INTO tblcustomer VALUES('32817','Foster','Ben','318 Western Ave','SAN diego','ca','92381',NULL,'8/15/99','fosterben@aol.com','8583284483');
INSERT INTO tblcustomer VALUES('38817','Argiento','Bud','1001 Catchway','Anaheim','CA','95113',NULL,'3/12/15','bud@cservices.com','8037718991');
INSERT INTO tblcustomer VALUES('78112','Guili','Mary Anne','4457 Meridith St','Irvine','CA','97128',NULL,'10/9/12','ma@san.rr.com','6195621334');

INSERT INTO tblorder VALUES('123000','2/02/16','A1','111',NULL,NULL,NULL,NULL,NULL,'00405',NULL);
INSERT INTO tblorder VALUES('223344','2/09/16',NULL,'231',NULL,NULL,NULL,NULL,NULL,'21142',NULL);
INSERT INTO tblorder VALUES('445511','2/15/16','02','444',NULL,NULL,NULL,NULL,NULL,'32018',NULL);
INSERT INTO tblorder VALUES('450137','12/29/15',NULL,'444','Frandsen LLC','435 Caminito Corriente','92129','USA','6551223298','07831',NULL);
INSERT INTO tblorder VALUES('567123','1/26/16',NULL,'444','Jenkins Corporation','2276 Brentell Street Suite 201','92128','USA','8583440669','07831',NULL);
INSERT INTO tblorder VALUES('651222','1/29/16',NULL,'111',NULL,NULL,NULL,NULL,NULL,'12006',NULL);
INSERT INTO tblorder VALUES('671100','2/19/16',NULL,'111',NULL,NULL,NULL,NULL,NULL,'32018',NULL);
INSERT INTO tblorder VALUES('980001','1/22/16','04','444',NULL,NULL,NULL,NULL,NULL,'78112',NULL);
INSERT INTO tblorder VALUES('983983','2/19/16',NULL,'111','Ender Industries','3011 Marsh Dr.','67455','USA','3558992111','32018','671100');
INSERT INTO tblorder VALUES('200335','1/26/16',NULL,'111','Cordwin','Arch 162 Stamford Brook','W6 0SE','UK','441817417500','07831','567123');
INSERT INTO tblorder VALUES('400001','2/20/16','B3','111',NULL,NULL,NULL,NULL,NULL,'32018',NULL);
INSERT INTO tblorder VALUES('892211','12/28/15',NULL,'111',NULL,NULL,NULL,NULL,NULL,'00625',NULL);
INSERT INTO tblorder VALUES('300221','1/26/16','03','231','Baron Mancos','251 Western Avenue Suite 1a','08776','USA','2109003005','07831','567123');
INSERT INTO tblorder VALUES('781206','2/15/16','06','231','Carrington-Smythe','231 Dulwich St. Wellington','TA21 0AB','UK','2088887009','38817',NULL);
INSERT INTO tblorder VALUES('675990','12/28/15',NULL,'111','Karen Nelson','601 Comet View Ct.','90056','USA','7018902330','00625','892211');

INSERT INTO tblOrderLine VALUES('123000','A23441','8','29.95');
INSERT INTO tblOrderLine VALUES('123000','A34665','30','37.95');
INSERT INTO tblOrderLine VALUES('123000','B67123','5','389.99');
INSERT INTO tblOrderLine VALUES('200335','A23441','1','29.95');
INSERT INTO tblOrderLine VALUES('200335','A34665','1','34.95');
INSERT INTO tblOrderLine VALUES('200335','B67123','1','39.99');
INSERT INTO tblOrderLine VALUES('200335','B67466','1','43.95');
INSERT INTO tblOrderLine VALUES('223344','A23441','55','29.95');
INSERT INTO tblOrderLine VALUES('223344','A23771','15','122.99');
INSERT INTO tblOrderLine VALUES('223344','A34665','100','23.95');
INSERT INTO tblOrderLine VALUES('223344','A34882','35','7.95');
INSERT INTO tblOrderLine VALUES('223344','B67123','25','34.95');
INSERT INTO tblOrderLine VALUES('223344','B67466','15','40.95');
INSERT INTO tblOrderLine VALUES('300221','A23771','1','145.99');
INSERT INTO tblOrderLine VALUES('300221','A34665','1','35.95');
INSERT INTO tblOrderLine VALUES('300221','A34882','1','10.95');
INSERT INTO tblOrderLine VALUES('300221','B67123','1','39.99');
INSERT INTO tblOrderLine VALUES('300221','B78244','1','19.95');
INSERT INTO tblOrderLine VALUES('400001','C26133','1','395.95');
INSERT INTO tblOrderLine VALUES('445511','C34122','3','269.95');
INSERT INTO tblOrderLine VALUES('450137','A23771','16','135.99');
INSERT INTO tblOrderLine VALUES('450137','A34665','10','31');
INSERT INTO tblOrderLine VALUES('450137','A34882','50','9.95');
INSERT INTO tblOrderLine VALUES('450137','B67123','21','14.95');
INSERT INTO tblOrderLine VALUES('450137','B67466','9','41.95');
INSERT INTO tblOrderLine VALUES('450137','C26133','4','398.95');
INSERT INTO tblOrderLine VALUES('450137','C34122','6','167.95');
INSERT INTO tblOrderLine VALUES('567123','C26133','1','395.95');
INSERT INTO tblOrderLine VALUES('651222','A34665','5','37.95');
INSERT INTO tblOrderLine VALUES('651222','A34882','16','11.95');
INSERT INTO tblOrderLine VALUES('651222','B78244','21','17.99');
INSERT INTO tblOrderLine VALUES('671100','C29179','1','259.95');
INSERT INTO tblOrderLine VALUES('781206','B67466','1','43.95');
INSERT INTO tblOrderLine VALUES('781206','C29179','2','280');
INSERT INTO tblOrderLine VALUES('892211','C26133','15','380');
INSERT INTO tblOrderLine VALUES('892211','C29179','10','259.95');
INSERT INTO tblOrderLine VALUES('892211','C34122','8','200');
INSERT INTO tblOrderLine VALUES('980001','C29179','3','275.99');
INSERT INTO tblOrderLine VALUES('980001','C34122','2','169.95');
INSERT INTO tblOrderLine VALUES('983983','A23771','1','135.99');
INSERT INTO tblOrderLine VALUES('983983','B78244','18','18.95');

INSERT INTO TblItemLocation VALUES('A23441','10','11');
INSERT INTO TblItemLocation VALUES('A23441','20','23');
INSERT INTO TblItemLocation VALUES('A23441','30','25');
INSERT INTO TblItemLocation VALUES('A23771','10','6');
INSERT INTO TblItemLocation VALUES('A23771','20','4');
INSERT INTO TblItemLocation VALUES('A23771','30','5');
INSERT INTO TblItemLocation VALUES('A34665','10','141');
INSERT INTO TblItemLocation VALUES('A34882','10','40');
INSERT INTO TblItemLocation VALUES('A34882','30','55');
INSERT INTO TblItemLocation VALUES('A45111','10','2');
INSERT INTO TblItemLocation VALUES('A45111','20','3');
INSERT INTO TblItemLocation VALUES('A45111','30','2');
INSERT INTO TblItemLocation VALUES('B67123','10','22');
INSERT INTO TblItemLocation VALUES('B67123','20','28');
INSERT INTO TblItemLocation VALUES('B67123','30','6');
INSERT INTO TblItemLocation VALUES('B67123','40','4');
INSERT INTO TblItemLocation VALUES('B67466','10','0');
INSERT INTO TblItemLocation VALUES('B67466','20','3');
INSERT INTO TblItemLocation VALUES('B67466','30','4');
INSERT INTO TblItemLocation VALUES('B78244','20','22');
INSERT INTO TblItemLocation VALUES('B78500','20','8');
INSERT INTO TblItemLocation VALUES('B78500','30','1');
INSERT INTO TblItemLocation VALUES('C29179','10','15');
INSERT INTO TblItemLocation VALUES('C29179','20','15');
INSERT INTO TblItemLocation VALUES('C34122','10','16');
INSERT INTO TblItemLocation VALUES('C34122','20','21');

INSERT INTO tblShipLine VALUES('1/19/2016','450137','B67123','20','8','ups')
INSERT INTO tblShipLine VALUES('1/23/2016','892211','C29179','10','6','UPS')
INSERT INTO tblShipLine VALUES('1/23/2016','892211','C34122','10','2','UPS')
INSERT INTO tblShipLine VALUES('1/23/2016','892211','C34122','20','3','UPS')
INSERT INTO tblShipLine VALUES('1/27/2016','450137','B67123','20','3','UPS')
INSERT INTO tblShipLine VALUES('1/27/2016','450137','B67123','30','14','Ups')
INSERT INTO tblShipLine VALUES('1/27/2016','450137','B67123','40','4','ups')
INSERT INTO tblShipLine VALUES('2/5/2016','300221','A23771','20','1','Ups')
INSERT INTO tblShipLine VALUES('2/5/2016','300221','B78244','20','1','UPS')
INSERT INTO tblShipLine VALUES('2/5/2016','980001','C34122','10','2','FEDEX')
INSERT INTO tblShipLine VALUES('2/5/2016','980001','C29179','10','3','FEDex')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','A23441','10','3','UPS')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','A23441','20','20','UPS')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','A23771','10','8','ups')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','A23771','20','2','UPS')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','A34665','10','45','UPs')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','A34882','10','15','fedEX')
INSERT INTO tblShipLine VALUES('2/10/2016','223344','B67123','10','13','UPS')
INSERT INTO tblShipLine VALUES('2/10/2016','300221','A34665','10','1','UPS')
INSERT INTO tblShipLine VALUES('2/11/2016','223344','A23771','30','5','UPS')
INSERT INTO tblShipLine VALUES('2/12/2016','223344','A23441','20','5','Ups')
INSERT INTO tblShipLine VALUES('2/12/2016','223344','A34665','10','65','ups')
INSERT INTO tblShipLine VALUES('2/12/2016','223344','A34882','10','20','UPS')
INSERT INTO tblShipLine VALUES('2/12/2016','300221','A34882','10','1','UPs')
INSERT INTO tblShipLine VALUES('2/15/2016','123000','A23441','20','8','UPS')
INSERT INTO tblShipLine VALUES('2/15/2016','123000','A34665','10','32','UPS')
INSERT INTO tblShipLine VALUES('2/16/2016','445511','C34122','10','3','FeDEX')
INSERT INTO tblShipLine VALUES('2/19/2016','200335','A23441','20','6','UPS')
INSERT INTO tblShipLine VALUES('2/19/2016','781206','B67466','30','4','Delta Freight')
INSERT INTO tblShipLine VALUES('2/20/2016','300221','B67123','10','1','UpS')
INSERT INTO tblShipLine VALUES('2/20/2016','200335','B67466','10','1','Delta Freight')
INSERT INTO tblShipLine VALUES('2/21/2016','450137','A34665','10','10','FeDeX')
INSERT INTO tblShipLine VALUES('2/22/2016','223344','B67123','10','12','UPS')
INSERT INTO tblShipLine VALUES('2/22/2016','651222','A34882','30','32','UPS')
INSERT INTO tblShipLine VALUES('2/22/2016','892211','C29179','10','4','UPS')
INSERT INTO tblShipLine VALUES('2/25/2016','123000','B67123','10','5','UPS')
INSERT INTO tblShipLine VALUES('2/25/2016','671100','C29179','10','1','UPS')
INSERT INTO tblShipLine VALUES('2/29/2016','651222','A34882','30','10','UPS')
INSERT INTO tblShipLine VALUES('3/1/2016','223344','A23771','30','30','UPS')
INSERT INTO tblShipLine VALUES('3/1/2016','450137','B67466','20','9','FedEx')
INSERT INTO tblShipLine VALUES('3/1/2016','651222','A34882','30','10','UPS')
INSERT INTO tblShipLine VALUES('3/2/2016','450137','A34882','30','15','UpS')
INSERT INTO tblShipLine VALUES('3/2/2016','651222','A34665','10','2','UPS')
INSERT INTO tblShipLine VALUES('3/2/2016','651222','A34882','10','5','UPS')
INSERT INTO tblShipLine VALUES('3/4/2016','651222','A34665','10','3','UPS')
INSERT INTO tblShipLine VALUES('3/5/2016','651222','A34882','10','10','FedEX')
INSERT INTO tblShipLine VALUES('3/6/2016','651222','B78244','20','21','ups')
INSERT INTO tblShipLine VALUES('3/19/2016','651222','A34882','10','1','UPS')

INSERT INTO tblReview  VALUES('000000','2/12/16','1','This is the worst company I''ve ever dealt with. They still have not shipped my order and it was placed on January 26. I will never buy anything from them again. Ever.','200335','A34665');
INSERT INTO tblReview  VALUES('000001','2/14/16','1','I don''t know how this company stays in business. They can''t ship anything on time, and their game selection isn''t all that great','450137','C34122');
INSERT INTO tblReview  VALUES('000002','2/18/16','5','Shipping was fast, the game was in great shape, and I will order from them again. Highly recommend','300221','A23771');
INSERT INTO tblReview  VALUES('000003','2/16/16','4','This is one of the few companies that will ship internationally fairly cost effectively. They are slow, but at least shipping isn''t a ridiculous amount.','223344','A23771');
INSERT INTO tblReview  VALUES('000004','1/15/16','3','They are slow. They overship. They undership. They have the best shipping internationally, but nothing spectacular if you are shipping to the U.S. Buyer beware.','445511','C34122');

INSERT INTO tblItemCostHistory VALUES('A23441','1/6/13','10.25');
INSERT INTO tblItemCostHistory VALUES('A23441','5/12/13','10.5');
INSERT INTO tblItemCostHistory VALUES('A23441','9/23/14','10.88');
INSERT INTO tblItemCostHistory VALUES('A23441','7/7/15','11.15');
INSERT INTO tblItemCostHistory VALUES('A23441','1/5/16','10.35');
INSERT INTO tblItemCostHistory VALUES('A23441','2/2/16','12.5');
INSERT INTO tblItemCostHistory VALUES('A23771','7/23/13','8.5');
INSERT INTO tblItemCostHistory VALUES('A34665','1/12/15','15');
INSERT INTO tblItemCostHistory VALUES('A34665','7/15/15','14.5');
INSERT INTO tblItemCostHistory VALUES('A34665','12/28/15','14.35');
INSERT INTO tblItemCostHistory VALUES('A34882','2/19/14','6.5');
INSERT INTO tblItemCostHistory VALUES('A34882','2/5/16','12.5');
INSERT INTO tblItemCostHistory VALUES('B67123','8/8/15','14.5');
INSERT INTO tblItemCostHistory VALUES('B67123','10/21/15','18.8');
INSERT INTO tblItemCostHistory VALUES('B67123','1/10/16','14.5');
INSERT INTO tblItemCostHistory VALUES('B67123','2/02/16','21.8');
INSERT INTO tblItemCostHistory VALUES('B67466','7/07/14','22.5');
INSERT INTO tblItemCostHistory VALUES('B67466','6/28/15','28.9');
INSERT INTO tblItemCostHistory VALUES('B67466','9/12/15','31');
INSERT INTO tblItemCostHistory VALUES('B78244','7/15/15','14.5');
INSERT INTO tblItemCostHistory VALUES('B78500','3/21/15','18.95');
INSERT INTO tblItemCostHistory VALUES('B78500','7/15/15','18');
INSERT INTO tblItemCostHistory VALUES('B78500','11/25/15','21');
INSERT INTO tblItemCostHistory VALUES('B78500','2/10/16','22.35');
INSERT INTO tblItemCostHistory VALUES('C26133','7/13/14','200');
INSERT INTO tblItemCostHistory VALUES('C26133','7/23/15','225');
INSERT INTO tblItemCostHistory VALUES('C26133','9/18/15','215');
INSERT INTO tblItemCostHistory VALUES('C26133','2/15/16','212.25');
INSERT INTO tblItemCostHistory VALUES('C29179','8/7/15','160');
INSERT INTO tblItemCostHistory VALUES('C29179','1/17/16','158.85');
INSERT INTO tblItemCostHistory VALUES('C34122','2/6/13','45');
INSERT INTO tblItemCostHistory VALUES('C34122','2/6/14','48');
INSERT INTO tblItemCostHistory VALUES('C34122','2/6/15','51');
INSERT INTO tblItemCostHistory VALUES('C34122','2/2/16','58.5');
