-- VIEWS --
CREATE VIEW registrationSummary AS
SELECT RegistrationAnswer.Answer RelationshiptoUser,
       COUNT(*) CountofRegistrations,
	   COUNT(DISTINCT Toy.ModelNumber) CountofDistinctModels,
	   SUM(Registration.SalesPrice) SumofPrice,
	   AVG(Registration.SalesPrice) AveragePrice
FROM Registration
INNER JOIN Toy 
ON Registration.SerialNumber = Toy.SerialNumber
INNER JOIN RegistrationResponse
ON Registration.SerialNumber = RegistrationResponse.SerialNumber
INNER JOIN RegistrationAnswer 
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
GROUP BY RegistrationAnswer.RegistrationAnswerID,RegistrationAnswer.Answer, RegistrationAnswer.RegistrationQuestionID 
HAVING  RegistrationAnswer.RegistrationQuestionID = '21';

CREATE VIEW ModelOwnedByGrandParents AS
SELECT Toy.ModelNumber ModelPurchasedMostbyGrandparents,
       COUNT(*) CountOfModels
FROM Registration
INNER JOIN Toy 
ON Registration.SerialNumber = Toy.SerialNumber
INNER JOIN RegistrationResponse
ON Registration.SerialNumber = RegistrationResponse.SerialNumber
INNER JOIN RegistrationAnswer 
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
GROUP BY Toy.ModelNumber, RegistrationAnswer.RegistrationAnswerID 
HAVING RegistrationAnswer.RegistrationAnswerID = '32';

CREATE VIEW GrandParents AS
SELECT Registration.serialNumber
FROM Registration
INNER JOIN Toy 
ON Registration.SerialNumber = Toy.SerialNumber
INNER JOIN RegistrationResponse
ON Registration.SerialNumber = RegistrationResponse.SerialNumber
INNER JOIN RegistrationAnswer 
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
WHERE RegistrationAnswer.RegistrationAnswerID = '32'

CREATE VIEW GrandParentCareFeatures AS
SELECT	Answer "Feature",
		count(*) "Count of Feature mentioned"
FROM RegistrationResponse
INNER JOIN RegistrationAnswer
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
WHERE RegistrationAnswer.RegistrationQuestionID = '83'
      AND RegistrationResponse.serialNumber in (SELECT serialNumber FROM GrandParents)
GROUP BY answer

-- PROBLEM 1
SELECT  Registration.SerialNumber "Serial Number",
		Toy.ModelNumber "Model Number",
		Model.Description "Model Description",
		Customer.LastName + ', ' + Customer.FirstName "Buyer Name",
		CONVERT(VARCHAR(10), Registration.DateOfPurchase, 101) "Purchase Date",
		Registration.SalesPrice "Price",
		Distributor.Name "Distributor",
		RegistrationAnswer.Answer "Relationship of Buyer to User"
FROM Registration
INNER JOIN Toy 
ON Registration.SerialNumber = Toy.SerialNumber
INNER JOIN Model
ON Toy.ModelNumber = Model.ModelNumber
INNER JOIN Customer
ON Registration.CustomerID =  Customer.CustomerID
INNER JOIN Distributor
ON Registration.DistributorID = Distributor.DistributorID
INNER JOIN RegistrationResponse
ON Registration.SerialNumber = RegistrationResponse.SerialNumber
INNER JOIN RegistrationAnswer 
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
WHERE RegistrationAnswer.RegistrationQuestionID = '21';

-- PROBLEM 2
SELECT	RelationshiptoUser "Relationship to User",
		CountofRegistrations "Count of Registrations",
		CountofDistinctModels "Count of Distinct Models",
		SumofPrice "Sum of Price",
		AveragePrice "Average Price"
FROM registrationSummary;

-- PROBLEM 3
SELECT	RelationshiptoUser "Relationship to User",
		CountofRegistrations "Count of Registrations",
		CountofDistinctModels "Count of Distinct Models",
		SumofPrice "Sum of Price",
		AveragePrice "Average Price"
FROM registrationSummary
WHERE CountofRegistrations = (	SELECT MAX(CountofRegistrations) 
								FROM registrationSummary);

-- PROBLEM 4
SELECT Toy.ModelNumber "Model Number",
       COUNT(*) "Number of Toys",
	   SUM(Registration.SalesPrice) "Sum of Price",
	   AVG(Registration.SalesPrice) "Average Price",
	   CONVERT(VARCHAR(10), MIN(Registration.DateOfPurchase), 101) "Earliest Registration Date",
	   CONVERT(VARCHAR(10), MAX(Registration.DateOfPurchase), 101) "Latest Registration Date"
FROM Registration
INNER JOIN Toy 
ON Registration.SerialNumber = Toy.SerialNumber
GROUP BY Toy.ModelNumber;

-- PROBLEM 5
SELECT	ModelPurchasedMostbyGrandParents "Model Purchased Most by Grandparents",
		CountOfModels "Count of Models"
FROM ModelOwnedByGrandParents 
WHERE CountOfModels = (	SELECT MAX(CountOfModels) 
						FROM ModelOwnedByGrandParents);

-- PROBLEM 6
SELECT	RegistrationAnswer.Answer "Feature",
		COUNT(*) "Count of Times Feature is Mentioned",
		CAST(COUNT(*)/CAST((SELECT COUNT(DISTINCT SerialNumber) FROM RegistrationResponse) as decimal(2)) * 100 AS varchar) + '%' "% of Registrations Mentioned"
FROM RegistrationResponse
RIGHT OUTER JOIN RegistrationAnswer
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
GROUP BY RegistrationResponse.RegistrationAnswerID, RegistrationAnswer.RegistrationQuestionID, RegistrationAnswer.Answer
HAVING RegistrationAnswer.RegistrationQuestionID = '83'
ORDER BY COUNT(*) DESC;

-- PROBLEM 7
SELECT	Answer "Feature Mentioned by Grandparents",
		count(*) "Count of Times Feature is Mentioned"
FROM RegistrationResponse
RIGHT OUTER JOIN RegistrationAnswer
ON RegistrationResponse.RegistrationAnswerID = RegistrationAnswer.RegistrationAnswerID
WHERE RegistrationAnswer.RegistrationQuestionID = '83'
      AND RegistrationResponse.serialNumber in (SELECT serialNumber FROM GrandParents)
GROUP BY answer

-- PROBLEM 8
SELECT TOP 3 Feature
FROM GrandParentCareFeatures
ORDER BY  "Count of Feature mentioned" DESC;
