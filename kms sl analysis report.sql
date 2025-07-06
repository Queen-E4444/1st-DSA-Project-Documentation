-- 1. Product Category with Highest Sales
SELECT [Product Category], SUM(Sales) AS Total_Sales
GROUP BY [Product Category]
ORDER BY Total_Sales DESC;

-- 2. Top 3 and Bottom 3 Regions by Sales
SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 3. Total Sales of Appliances in Ontario
SELECT SUM(Sales) AS Appliance_Sales_Ontario
FROM orders
WHERE [Product Category] = 'Office Supplies'
  AND LOWER([Product Sub-Category]) LIKE '%appliance%'
  AND LOWER(Province) = 'ontario';

-- 4. Bottom 10 Customers by Sales
SELECT [Customer Name], SUM(Sales) AS Total_Sales
FROM orders
GROUP BY [Customer Name]
ORDER BY Total_Sales ASC
LIMIT 10;

-- 5. Shipping Method with Highest Shipping Cost
SELECT [Ship Mode], SUM([Shipping Cost]) AS Total_Shipping_Cost
FROM orders
GROUP BY [Ship Mode]
ORDER BY Total_Shipping_Cost DESC;

-- 6. Most Valuable Customers and their Product Preferences
SELECT [Customer Name], [Product Category], SUM(Sales) AS Total_Sales
FROM orders
WHERE [Customer Name] IN (
    SELECT [Customer Name]
    FROM orders
    GROUP BY [Customer Name]
    ORDER BY SUM(Sales) DESC
    LIMIT 5
)
GROUP BY [Customer Name], [Product Category]
ORDER BY [Customer Name], Total_Sales DESC;

-- 7. Small Business Customer with Highest Sales
SELECT [Customer Name], SUM(Sales) AS Total_Sales
FROM orders
WHERE [Customer Segment] = 'Small Business'
GROUP BY [Customer Name]
ORDER BY Total_Sales DESC
LIMIT 1;

-- 8. Corporate Customer with Most Orders
SELECT [Customer Name], COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM orders
WHERE [Customer Segment] = 'Corporate'
GROUP BY [Customer Name]
ORDER BY Total_Orders DESC
LIMIT 1;

-- 9. Most Profitable Consumer Customer
SELECT [Customer Name], SUM(Profit) AS Total_Profit
FROM orders
WHERE [Customer Segment] = 'Consumer'
GROUP BY [Customer Name]
ORDER BY Total_Profit DESC
LIMIT 1;

-- 10. Return Information (Not Available)
-- Note: No return flag in the dataset. Requires additional data.

-- 11. Shipping Method vs Order Priority
SELECT [Order Priority], [Ship Mode], COUNT(DISTINCT [Order ID]) AS Order_Count
FROM orders
GROUP BY [Order Priority], [Ship Mode]
ORDER BY [Order Priority], Order_Count DESC;
