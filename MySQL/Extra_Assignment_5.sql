
use adventureworks ;

-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
select ProductCategoryID from productsubcategory where `Name`= (select  `Name` from productsubcategory  where `Name` = 'Saddles' );

-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.

select  `Name` from product  where `Name` LIKE "Bo%" OR `Name`  LIKE"%Bo%";

/* Question 3:
Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
*/
select `Name` , ListPrice from product where ProductSubcategoryID =3 AND ListPrice= 
(select MIN(ListPrice) from product where ProductSubcategoryID =3 );


/* Exercise 2: JOIN nhiều bảng
Question 1: Viết query lấy danh sách tên country và province được lưu trong
AdventureWorks2008sample database.
*/

select *from CountryRegion ;
select * from StateProvince;

SELECT 
    c.`Name`, s.StateProvinceID, s.`Name`
FROM
    CountryRegion c
        JOIN
    StateProvince s ON c.CountryRegionCode = s.CountryRegionCode;

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
SELECT 
    s.`Name` AS NameProvince, c.`Name` AS NameCountry
FROM
    CountryRegion c
        JOIN
    StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
WHERE
    c.CountryRegionCode IN (SELECT 
            c.CountryRegionCode
        FROM
            CountryRegion c
        WHERE
            c.`Name` = 'Germany'
                OR c.`Name` = 'Canada')
ORDER BY NameCountry ASC , NameProvince ASC;


/*
Question 3:
Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người
sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate
*/

SELECT 
    s.SalesYTD,
    s.Bonus,
    s.SalesPersonID,
    sh.SalesOrderID,
    sh.OrderDate
FROM
    SalesPerson s
        JOIN
    SalesOrderHeader sh ON s.SalesPersonID = sh.SalesPersonID;
    
-- Question 4: Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID. 

SELECT 
    s.SalesYTD, s.Bonus, e.Title, sh.SalesOrderID, sh.OrderDate
FROM
    SalesPerson s
        JOIN
    SalesOrderHeader sh ON s.SalesPersonID = sh.SalesPersonID
        JOIN
    employee e ON s.SalesPersonID = e.EmployeeID;











