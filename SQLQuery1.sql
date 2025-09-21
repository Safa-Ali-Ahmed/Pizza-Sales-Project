use Pizza
select * from pizza_sales

--1--Total_Revenue
select sum(total_price) Total_Revenue
from pizza_sales
--2--Average_Order_Value
select (sum(total_price)/count(distinct order_id)) Average_Order_Value
from pizza_sales
--3--Total_Pizza_Sold
 select sum(quantity) Total_Pizza_Sold
from pizza_sales
--4--Total_Orders
select count(distinct order_id) Total_Orders
from pizza_sales
--5--Average_Pizza_Per_Order round to 2 decimal places
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales
--6--Percent os Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size
--7--Total Pizza Sold by Category
select pizza_category,sum(quantity) Total_Pizza_Sold
from pizza_sales
group by pizza_category
order by pizza_category desc
--8--Top 5 Best Seller by Revenue,Total_Quantity,Total_Order
select top 5 pizza_name,sum(total_price) Total_Revenue,sum(quantity) Total_Quantity,count(distinct order_id) Total_Orders
from pizza_sales
group by pizza_name
order by Total_Revenue desc
--9--Bottom 5 Seller by Revenue,Total_Quantity,Total_Order
select top 5 pizza_name,sum(total_price) Total_Revenue,sum(quantity) Total_Quantity,count(distinct order_id) Total_Orders
from pizza_sales
group by pizza_name
order by Total_Revenue asc
--10--Daily Trend for Total_Order
select DATENAME(WEEKDAY, order_date) order_day,count(distinct order_id) Total_Orders
from pizza_sales
group by DATENAME(WEEKDAY, order_date)
--11--Monthly Trend for Total Orders
select DATENAME(MONTH, order_date) order_Month,count(distinct order_id) Total_Orders
from pizza_sales
group by DATENAME(MONTH, order_date)
--12--Percent os Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category


