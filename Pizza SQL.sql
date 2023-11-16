--Daily Trend for Total Orders:
select * from pizza_sales

select sum(total_price) / count(distinct order_id) as Avg_Order_Values from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id) as Total_Orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_Order from pizza_sales 

select datename(dw, order_date) as Order_Day, 
count(distinct order_id) as Total_Orders 
from pizza_sales group by datename(dw, order_date)


--Monthly Trend for Total Orders:
select datename(month, order_date) as Month_Name, 
count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(month, order_date)
order by Total_Orders desc


--Percentage of Sales by Pizza Category:
select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where month(order_date) = 1) as Percentage_of_Sales
from pizza_sales
where month(order_date) = 1
group by pizza_category


--Percentage of Sales by Pizza Size:
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where datepart(quarter, order_date) = 1) as decimal(10,2))as Percentage_of_Sales
from pizza_sales
where datepart(quarter, order_date) = 1
group by pizza_size
order by Percentage_of_Sales desc


--Top 5 Best Sellers by Revenue, Total Quality and Total Orders:
--Top 5 Best Sellers by Revenue
select top 5 pizza_name, cast(sum(total_price)as decimal(10,2)) as Total_Revenue  
from pizza_sales 
group by pizza_name 
order by Total_Revenue desc

--Bottom 5 by Revenue:
select top 5 pizza_name, cast(sum(total_price)as decimal(10,2)) as Total_Revenue  
from pizza_sales 
group by pizza_name 
order by Total_Revenue asc

--Top 5 Best Sellers by Quantity:
select top 5 pizza_name, cast(sum(quantity)as decimal(10,2)) as Total_Quantity  
from pizza_sales 
group by pizza_name 
order by Total_Quantity desc

--Bottom 5 by Quantity:
select top 5 pizza_name, cast(sum(quantity)as decimal(10,2)) as Total_Quantity  
from pizza_sales 
group by pizza_name 
order by Total_Quantity asc

--Top 5 Best Sellers by Orders:
select top 5 pizza_name, cast(count(distinct order_id) as decimal(10,2)) as Total_Orders  
from pizza_sales 
group by pizza_name 
order by Total_Orders desc

--Bottom 5 by Orders
select top 5 pizza_name, cast(count(distinct order_id) as decimal(10,2)) as Total_Orders  
from pizza_sales 
group by pizza_name 
order by Total_Orders asc

