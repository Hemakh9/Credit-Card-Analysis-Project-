CREATE DATABASE credit_card_analysis;
USE credit_card_analysis;
CREATE TABLE Customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    Occupation VARCHAR(50),
    Annual_Income DECIMAL(12,2),
    Credit_Score INT,
    Join_Date DATE
);
CREATE TABLE Transactions (
    Transaction_ID VARCHAR(15) PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Transaction_Date DATE,
    Category VARCHAR(50),
    Amount DECIMAL(12,2),
    Payment_Method VARCHAR(30),
    Merchant VARCHAR(100),
    City VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID)
);
SELECT COUNT(*) AS Total_Customers
FROM customers;
SELECT COUNT(*) AS Total_Transactions
FROM transactions;
SELECT COUNT(*) AS Total_Customers
FROM customers;
SELECT *
FROM transactions
LIMIT 5;
USE credit_card_analysis;

SELECT *
FROM transactions
LIMIT 5;
DESCRIBE transactions;
SELECT COUNT(*) AS Total_Customers
FROM customers;
SELECT COUNT(*) AS Total_Transactions
FROM transactions;
SELECT COUNT(*) AS Total_Transactions
FROM transactions;
SELECT *
FROM transactions
LIMIT 5;
SELECT COUNT(*) AS Total_Customers
FROM customers;
SELECT
    SUM(Amount) AS Total_Revenue
FROM transactions;
SELECT
    COUNT(*) AS Total_Transactions
FROM transactions;
SELECT
    AVG(Amount) AS Average_Transaction
FROM transactions;
SELECT
    MAX(Amount) AS Highest_Transaction
FROM transactions;
SELECT
    MIN(Amount) AS Lowest_Transaction
FROM transactions;
SELECT
    Category,
    SUM(Amount) AS Total_Revenue
FROM transactions
GROUP BY Category
ORDER BY Total_Revenue DESC;
SELECT
    Category,
    COUNT(*) AS Transaction_Count
FROM transactions
GROUP BY Category
ORDER BY Transaction_Count DESC;
SELECT
    Category,
    COUNT(*) AS Transaction_Count
FROM transactions
GROUP BY Category
ORDER BY Transaction_Count DESC;
SELECT
    Payment_Method,
    COUNT(*) AS Transaction_Count,
    SUM(Amount) AS Total_Revenue
FROM transactions
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;
SELECT
    City,
    SUM(Amount) AS Total_Revenue
FROM transactions
GROUP BY City
ORDER BY Total_Revenue DESC;
SELECT
    City,
    COUNT(*) AS Transaction_Count
FROM transactions
GROUP BY City
ORDER BY Transaction_Count DESC;
SELECT
    Status,
    COUNT(*) AS Transaction_Count
FROM transactions
GROUP BY Status
ORDER BY Transaction_Count DESC;
SELECT
    Status,
    COUNT(*) AS Transaction_Count
FROM transactions
GROUP BY Status
ORDER BY Transaction_Count DESC;
SELECT
    SUM(Amount) AS Completed_Revenue
FROM transactions
WHERE Status = 'Completed';
SELECT
    SUM(Amount) AS Completed_Revenue
FROM transactions
WHERE Status = 'Completed';
SELECT
    COUNT(*) AS Completed_Transactions
FROM transactions
WHERE Status = 'Completed';
SELECT
    c.Customer_ID,
    c.Gender,
    c.Age,
    c.City,
    SUM(t.Amount) AS Total_Spending
FROM customers c
JOIN transactions t
    ON c.Customer_ID = t.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Gender,
    c.Age,
    c.City
ORDER BY Total_Spending DESC;
SELECT
    c.Customer_ID,
    c.Gender,
    c.City,
    SUM(t.Amount) AS Total_Spending
FROM customers c
JOIN transactions t
    ON c.Customer_ID = t.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Gender,
    c.City
ORDER BY Total_Spending DESC
LIMIT 10;
SELECT
    c.Customer_ID,
    c.Annual_Income,
    SUM(t.Amount) AS Total_Spending
FROM customers c
JOIN transactions t
    ON c.Customer_ID = t.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Annual_Income
ORDER BY Total_Spending DESC;
SELECT
    Customer_ID,
    Annual_Income,
    CASE
        WHEN Annual_Income < 300000 THEN 'Low Income'
        WHEN Annual_Income < 700000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Category
FROM customers;
WITH customer_spending AS (
    SELECT
        Customer_ID,
        SUM(Amount) AS Total_Spending
    FROM transactions
    GROUP BY Customer_ID
)

SELECT *
FROM customer_spending
ORDER BY Total_Spending DESC
LIMIT 10;
SELECT
    Customer_ID,
    Total_Spending,
    RANK() OVER (
        ORDER BY Total_Spending DESC
    ) AS Spending_Rank
FROM (
    SELECT
        Customer_ID,
        SUM(Amount) AS Total_Spending
    FROM transactions
    GROUP BY Customer_ID
) AS customer_data;
SELECT
    Category,
    Total_Revenue,
    RANK() OVER (
        ORDER BY Total_Revenue DESC
    ) AS Revenue_Rank
FROM (
    SELECT
        Category,
        SUM(Amount) AS Total_Revenue
    FROM transactions
    GROUP BY Category
) AS category_data;