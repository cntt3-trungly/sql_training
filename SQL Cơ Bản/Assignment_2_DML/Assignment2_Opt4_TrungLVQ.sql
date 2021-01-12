USE AdventureWorks 
Go

-- Write a query that retrieves the columns ProductID, Name, 
--Color and ListPrice from the Production.Product table, with no filter. Your result set should look something like the following.  

SELECT ProductID,Name,Color,ListPrice FROM Production.Product

-- Query 2 

SELECT ProductID,Name,Color,ListPrice FROM Production.Product 
WHERE ListPrice > 0

-- Query 3

SELECT ProductID,Name,Color,ListPrice FROM Production.Product
WHERE Color is null

-- Query 4

SELECT ProductID,Name,Color,ListPrice FROM Production.Product 
WHERE Color is not  null

-- Query 5

SELECT ProductID,Name,Color,ListPrice FROM Production.Product 
WHERE Color is not  null AND ListPrice >0

-- Query 6

SELECT CONCAT(Name,' : ',Color) AS NameAndColor FROM Production.Product 
WHERE Color is not NULL

--Query 7 

SELECT CONCAT('NAME',': ', Name,'--','COLOR',': ',Color) AS NameAndColor FROM Production.Product 
WHERE Color is not NULL;

--Query 8

SELECT ProductID,Name FROM Production.Product 
WHERE ProductID between 400 and 500;

--Query 9

SELECT ProductID,Name,Color FROM Production.Product 
WHERE Color in ('Black','Blue');

--Query 10

SELECT Name,ListPrice From Production.Product 
WHERE Name like 'S%';

--Query 11

SELECT Name,ListPrice From Production.Product 
WHERE Name like ('S%') or Name like ('A%') ORDER BY Name;

--Query 12


SELECT Name,ListPrice From Production.Product 
WHERE Name like ('SPO%') and Name not like ('SPOK%')   ORDER BY Name;

--Query 13 

SELECT DISTINCT color FROM Production.Product;

-- Query 14 

Select Distinct ProductSubcategoryID ,Color FROM Production.Product 
WHERE ProductSubcategoryID  is not null and Color is not null
order by ProductSubcategoryID,Color DESC;

--Query 15
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice
FROM Production.Product
WHERE (Color IN ('Red','Black')  AND ProductSubCategoryID = 1 )
      OR (ListPrice BETWEEN 1000 AND 2000 And ProductSubCategoryID is not null)
ORDER BY ProductID

--Query 16

SELECT name, COALESCE(Color,'UNKNOWN'), ListPrice
FROM Production.Product

----  Exercise 2: Grouping and Summarizing Data

--Query 1

SELECT Count(*) FROM Production.Product;

--Query 2

SELECT Count(ProductSubcategoryID ) as HasSubCategoryID FROM Production.Product  ;

--Query 3

SELECT ProductSubcategoryID , count(*) as CountedProducts  
FROM Production.Product
GROUP BY ProductSubcategoryID;

--Query 4

SELECT count(*) as NoSubCat FROM  Production.Product
where ProductSubcategoryID  is  null;


SELECT count (*)  as NoSubCat FROM
(
SELECT ProductID FROM  Production.Product
EXCEPT
SELECT ProductID FROM  Production.Product pr
join Production.ProductSubcategory ps  ON pr.ProductSubcategoryID = ps.ProductSubcategoryID
) sa ;

--Query 5

SELECT pp.ProductID,Sum(pn.quantity) AS TheSum 
FROM Production.Product pp join Production.ProductInventory pn ON pp.ProductID=pn.ProductID
GROUP BY pp.ProductID;

--Query 6
SELECT pp.ProductID,Sum(pn.quantity) AS TheSum  
FROM Production.Product pp join Production.ProductInventory pn ON pp.ProductID=pn.ProductID
WHERE pn.LocationID=40
GROUP BY pp.ProductID
HAVING Sum(pn.quantity) <100;

--Query 7
SELECT pn.Shelf, pp.ProductID, Sum(pn.quantity) AS TheSum  
FROM Production.Product pp join Production.ProductInventory pn ON pp.ProductID=pn.ProductID
WHERE pn.LocationID=40
GROUP BY pn.Shelf,pp.ProductID
HAVING Sum(pn.quantity) <100;

--Query 8
SELECT AVG(QUANTITY) AS TheAvg
FROM Production.ProductInventory 
WHERE LocationID =10;

--Query 9   ))

SELECT ProductID, Shelf, AVG(QUANTITY) AS TheAvg
FROM Production.ProductInventory 
WHERE LocationID =10 and Shelf !='N/A'
GROUP BY  rollup (Shelf, ProductID)
ORDER BY Shelf;

--Query 10 

SELECT Color, Class, COUNT(*) AS TheCount , AVG(ListPrice) AS AvgPrice
FROM Production.Product 
WHERE Color is not null and Class is not  null
GROUP BY GROUPING SETS (Color, Class)


-- Query 11

SELECT ProductSubcategoryID 
      , COUNT(Name) as Counted 
	  ,GROUPING( ProductSubcategoryID) as IsGrandTotal
FROM Production.Product
GROUP BY ROLLUP (ProductSubcategoryID)
order By ProductSubcategoryID



