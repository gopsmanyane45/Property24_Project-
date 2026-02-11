------Questions and code /syntax 
----1.	Display all properties in the database
SELECT * FROM dbo.[property24 CSV]

---TOP N used to Execute th query fast by limiting it to x numbers e.g 5 
--This allows you to know the exact column s that are needed when asnwering queations 
SELECT TOP 5 * FROM dbo.[property24 CSV]

 ----2.	Show only the CITY, PROVINCE, and PROPERTY_PRICE columns

SELECT CITY, PROVINCE, CITY,PROPERTY_PRICE    FROM dbo.[property24 CSV]

 ---3.	List all distinct provinces in the table.
SELECT DISTINCT PROVINCE FROM dbo.[property24 CSV]

----4.	Find all properties located in Gauteng
SELECT * FROM dbo.[property24 CSV] WHERE PROVINCE = 'Gauteng' 


----5.	Show properties priced under R1,500,000--- takes time to run 

SELECT TOP 5 *   FROM dbo.[property24 CSV] WHERE PROPERTY_PRICE < 1500000

---6.	List properties with more than 3 bedrooms
SELECT TOP 5 *   FROM dbo.[property24 CSV] WHERE BEDROOMS > 3

----7.	Find properties with parking for at least 2 cars.
SELECT TOP 5 *  FROM dbo.[property24 CSV] WHERE PARKING >= 2

---8.	Show properties where the monthly repayment is greater than R25,000.
SELECT TOP 5 *   FROM dbo.[property24 CSV] WHERE Monthly_Repayment >= 25000

---9.	Show all properties ordered by property price from highest to lowest
SELECT TOP 5 *  FROM dbo.[property24 CSV] ORDER BY PROPERTY_PRICE DESC 

--10.	List properties ordered by floor size from smallest to largest
SELECT TOP 5000 *  FROM dbo.[property24 CSV] ORDER BY FLOOR_SIZE ASC 

--11.	Show Gauteng properties ordered by monthly repayment
SELECT TOP 10 *  FROM dbo.[property24 CSV] WHERE PROVINCE = 'Gauteng' ORDER BY Monthly_Repayment

--12.	Find Western Cape properties priced below R3,000,000
SELECT TOP 10 *  FROM dbo.[property24 CSV] WHERE PROVINCE = 'Western Cape' AND  PROPERTY_PRICE < 3000000

--13.	Show KwaZulu-Natal properties with 3 or more bedrooms
SELECT TOP 10 *  FROM dbo.[property24 CSV] WHERE PROVINCE = 'KwaZulu-Natal' AND  BEDROOMS >= 3

--14.	Find properties in Limpopo or Free State ordered by property price.
SELECT TOP 10 *  FROM dbo.[property24 CSV] WHERE PROVINCE = 'Limpopo' OR  PROVINCE = 'Free State'ORDER BY PROPERTY_PRICE 

--15.	Show the 10 most expensive properties
SELECT TOP 10 *  FROM dbo.[property24 CSV] ORDER BY PROPERTY_PRICE DESC

--16.	Show the 5 cheapest properties.
SELECT TOP 10 *  FROM dbo.[property24 CSV] ORDER BY PROPERTY_PRICE ASC

--17.	Show the top 10 properties with the largest floor size
SELECT TOP 10 *  FROM dbo.[property24 CSV] ORDER BY FLOOR_SIZE DESC

--18.	Which province appears to have the highest priced properties
----Shows disticnt provinces by highest price MAX and MIN = HIGHEST AND LOWEST - NEED TO BE AGGREGATED AND GROUPED 
SELECT  PROVINCE FROM dbo.[property24 CSV] GROUP BY PROVINCE ORDER BY MAX(PROPERTY_PRICE) ---NC
SELECT  PROVINCE FROM dbo.[property24 CSV] GROUP BY PROVINCE ORDER BY MIN(PROPERTY_PRICE) ----LP

--Which province appears to have the highest priced properties ?// Created My own question 
----MAX(price) — Finds the highest property price in each province.
----GROUP BY province — Groups results by province.
----ORDER BY highest_price DESC — Sorts provinces from highest to lowest price.
----TOP 1 = LIMIT 1 — Returns only the province with the single highest price
SELECT TOP 1 PROVINCE,MAX(PROPERTY_PRICE) AS HIGHEST_PRICE  FROM dbo.[property24 CSV] GROUP BY PROVINCE ORDER BY HIGHEST_PRICE

--19.	Which <cities> appear to have the <most affordable> housing
---     Show City ith low prices = meaning this = because they are low people can afford them 
SELECT  CITY FROM dbo.[property24 CSV] GROUP BY CITY ORDER BY MIN(PROPERTY_PRICE) ----Tzaneen 

--20	What minimum income is typically required for properties priced above R4,000,000 
SELECT Min_Gross_Monthly_Income AS MIN_INCOME_REQUIRED FROM dbo.[property24 CSV] WHERE PROPERTY_PRICE > 4000000  

