-- 1. Total revenue by customer
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM online_retail
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;

-- 2. Order frequency by customer
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Orders
FROM online_retail
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0
GROUP BY CustomerID
ORDER BY Orders DESC;

-- 3. Average order value by customer
WITH order_totals AS (
    SELECT
        CustomerID,
        InvoiceNo,
        SUM(Quantity * UnitPrice) AS OrderValue
    FROM online_retail
    WHERE
        CustomerID IS NOT NULL
        AND Quantity > 0
        AND UnitPrice > 0
    GROUP BY CustomerID, InvoiceNo
)

SELECT
    CustomerID,
    COUNT(*) AS Orders,
    AVG(OrderValue) AS AverageOrderValue,
    SUM(OrderValue) AS TotalRevenue
FROM order_totals
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;

-- 4. Product breadth by customer
SELECT
    CustomerID,
    COUNT(DISTINCT StockCode) AS UniqueProducts
FROM online_retail
WHERE
    CustomerID IS NOT NULL
    AND Quantity > 0
    AND UnitPrice > 0
GROUP BY CustomerID
ORDER BY UniqueProducts DESC;

-- 5. Top products by revenue
SELECT
    StockCode,
    Description,
    SUM(Quantity) AS UnitsSold,
    SUM(Quantity * UnitPrice) AS Revenue
FROM online_retail
WHERE
    Quantity > 0
    AND UnitPrice > 0
GROUP BY StockCode, Description
ORDER BY Revenue DESC
LIMIT 20;
