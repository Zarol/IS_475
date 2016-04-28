DROP TABLE RegistrationResponse,
       RegistrationAnswer,
       RegistrationQuestion,
       Registration,
       Customer,
       Toy,
       Model,
       Distributor;

CREATE TABLE Distributor(
  DistributorID char(10)  NOT NULL,
  Name   varchar(30)  NOT NULL,
  CONSTRAINT pkDistributor PRIMARY KEY (DistributorID),
);

CREATE TABLE Model(
  ModelNumber char(10)  NOT NULL,
  Description varchar(50)  NOT NULL,
  CONSTRAINT pkModel PRIMARY KEY (ModelNumber),
);

CREATE TABLE Toy(
  SerialNumber char(10)  NOT NULL,
  ModelNumber char(10)  NOT NULL,
  CONSTRAINT pkToy PRIMARY KEY (SerialNumber),
  CONSTRAINT fkModel FOREIGN KEY (ModelNumber) REFERENCES Model(ModelNumber)
);

CREATE TABLE Customer(
  CustomerID   char(10)  NOT NULL,
  FirstName char(30)  NOT NULL,
  LastName char(30)  NOT NULL,
  CONSTRAINT pkCustomer PRIMARY KEY (CustomerID),
);

CREATE TABLE Registration(
  SerialNumber char(10)  NOT NULL,
  CustomerID   char(10)  NOT NULL,
  DistributorID char(10)  NOT NULL,
  DateOfPurchase  datetime NOT NULL,
  SalesPrice    money        NOT NULL,
  CONSTRAINT pkRegistration PRIMARY KEY (SerialNumber),
  CONSTRAINT fkToy FOREIGN KEY (SerialNumber) REFERENCES Toy(SerialNumber),
  CONSTRAINT fkDistributor FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID),
  CONSTRAINT fkCustomer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE RegistrationQuestion(
  RegistrationQuestionID char(10)  NOT NULL,
  Question varchar(100)  NOT NULL,
  CONSTRAINT pkRegistrationQuestion PRIMARY KEY (RegistrationQuestionID)
);

CREATE TABLE RegistrationAnswer(
  RegistrationAnswerID char(10)  NOT NULL,
  RegistrationQuestionID char(10)  NOT NULL,
  Answer varchar(100) NOT NULL,
  CONSTRAINT pkRegistrationAnswer PRIMARY KEY (RegistrationAnswerID),
  CONSTRAINT fkRegistrationQuestion2 FOREIGN KEY (RegistrationQuestionID) REFERENCES RegistrationQuestion(RegistrationQuestionID)
);

CREATE TABLE RegistrationResponse(
  RegistrationResponseID char(10)  NOT NULL,
  SerialNumber char(10)  NOT NULL,
  RegistrationAnswerID char(10)  NOT NULL,
  CONSTRAINT pkRegistrationResponse PRIMARY KEY (RegistrationResponseID),
  CONSTRAINT fkRegistration2 FOREIGN KEY (SerialNumber) REFERENCES Registration(SerialNumber),
  CONSTRAINT fkRegistrationAnswer FOREIGN KEY (RegistrationAnswerID) REFERENCES RegistrationAnswer(RegistrationAnswerID)
);


