create database zepto_sql;
use zepto_sql;
drop table if exists zepto;
create table zepto(
sku_id int auto_increment Primary Key,
category varchar(120),
name varchar(150) Not Null,
mrp decimal(8,2),
discountPercent decimal(5,2),
availableQuantity int,
discountedSelllingPrice decimal(8,2),
weightInGms int,
outOfStock boolean,
quantity int
);

alter table zepto rename column discountedSelllingPrice to discountedSellingPrice;

-- Data Exploration


-- Count of Rows
select count(*) from zepto;

-- sample data
select * from zepto limit 10;

-- null values
select * from zepto
where name is null
or
sku_id is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null
;
-- Disable safe mode
SET SQL_SAFE_UPDATES = 0;
-- enable safe mode
SET SQL_SAFE_UPDATES = 1;

-- Removing Null Values
delete from zepto
where name is null
or
sku_id is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null
;

-- Different product categories
SELECT distinct category from zepto order by category;

-- Products in stock vs Out of stock
SELECT outOfStock, count(sku_id)
from zepto
group by outOfStock;

-- Product names present multiple times
SELECT name,count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

-- data cleaning

-- Products with price 0
select * from zepto where mrp=0 or discountedSellingPrice=0;
Delete from zepto where mrp=0;

-- Convert Paise to Rupees
update zepto SET mrp=mrp/100.0,discountedSellingPrice=discountedSellingPrice/100.0;
select mrp ,discountedSellingPrice from zepto;

-- Q1.Find the top 10 best-value products based on the discount percentage.
select DISTINCT name,mrp,discountPercent from zepto order by discountPercent Desc limit 10;

-- Q2.What are the Products with High MRP but Out of Stock
Select Distinct Name, mrp from zepto where outOfStock=TRUE and mrp>300 order by MRP desc;

-- Q3.Calculate Estimated Revenue for each category
Select category,sum(discountedSellingPrice * availableQuantity) as total_revenue 
from zepto group by category order by total_revenue desc;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
Select DISTINCT name, mrp,discountPercent 
from zepto 
where mrp>500 and discountPercent<10
order by mrp desc , discountPercent desc;

select * from zepto limit 3;
-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, round(AVG(discountPercent),2) as avg_disc
from zepto
group by category
order by avg_disc desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select Distinct name , weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms>=100
order by price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
select Distinct name , weightInGms,
CASE WHEN weightInGms<1000 Then'Low'
	When weightInGms<5000 Then 'Medium'
    ELSE 'Bulk'
    END AS weight_category
from zepto;

-- Q8.What is the Total Inventory Weight Per Category
Select category,
sum(weightInGms*availableQuantity) as total_weight 
from zepto
group by category
order by total_weight desc;
