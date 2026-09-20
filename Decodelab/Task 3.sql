create database ASM_ELECTRONICS;
use ASM_ELECTRONICS;
show tables;
select * from task_3;

select count(*) as `Row Number` from `dataset for data analytics`;

describe `dataset for data analytics`;

ALTER TABLE `dataset for data analytics`
RENAME COLUMN ï»¿OrderID TO OrderID;

ALTER TABLE `dataset for data analytics`
MODIFY COLUMN OrderID INT,
MODIFY COLUMN CustomerID INT;

ALTER TABLE `dataset for data analytics`
MODIFY COLUMN OrderID VARCHAR(50),
MODIFY COLUMN CustomerID VARCHAR(50);

UPDATE `dataset for data analytics`
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

ALTER TABLE `dataset for data analytics`
MODIFY COLUMN Date DATE;

SET SQL_SAFE_UPDATES = 0;
Start transaction;

SET SQL_SAFE_UPDATES = 1;

select distinct OrderID from `dataset for data analytics`;
select distinct Date from `dataset for data analytics`;
select distinct CustomerID from `dataset for data analytics`;
select distinct Product from `dataset for data analytics`;
select distinct Quantity from `dataset for data analytics`;
select distinct UnitPrice from `dataset for data analytics`;
select distinct ShippingAddress from `dataset for data analytics`;
select distinct PaymentMethod from `dataset for data analytics`;
select distinct OrderStatus from `dataset for data analytics`;
select distinct TrackingNumber from `dataset for data analytics`;
select distinct ItemsInCart from `dataset for data analytics`;
select distinct CouponCode from `dataset for data analytics`;
select distinct ReferralSource from `dataset for data analytics`;
select distinct TotalPrice from `dataset for data analytics`;

-- Question 1,what is the total number sold per product , for only shipped orrders
select Product, sum(Quantity) as ttalunitsold
from `dataset for data analytics`
where OrderStatus = 'shipped'
group by Product;

-- question 2 what is the total revenue per payment method, but only for 2024

select PaymentMethod, sum(totalPrice) as ttalrevenue
from `dataset for data analytics`
where Date >= '2024-01-01' AND Date <= '2024-12-31'
Group by PaymentMethod;

select PaymentMethod, round(sum(totalprice), 2) as total_revenue
from `dataset for data analytics`
where Date >= '2024-01-01' and  Date <= '2024-01-01'
Group by PaymentMethod;

-- delivered orders 
Select OrderID, CustomerID, Product, TotalPrice
from `dataset for data analytics`
where OrderStatus = 'delivered'
limit 10;

-- high value orders (above 200)
select OrderID, Product, TotalPrice
from `dataset for data analytics`
where TotalPrice > 2000
order by TotalPrice desc;

-- laptop orders that have been shipped
select OrderID, Product, PaymentMethod, OrderStatus
from `dataset for data analytics`
where Product = 'laptop' and OrderStatus = 'shipped';

-- Top 5 most expensive orders overall
select OrderID, Product, TotalPrice
from `dataset for data analytics`
order by TotalPrice desc;

-- Total number of orders
select count(*) as total_orders
from `dataset for data analytics`;

-- average value of an order
select round(avg(TotalPrice), 2) as avg_order_value
from `dataset for data analytics`;

-- Total revenue grouped by product
select OrderStatus, count(*)  as num_orders
from `dataset for data analytics`
group by OrderStatus
order by num_orders desc;

-- total revenue grouped by product
select Product, sum(TotalPrice) as Total_revenue
from `dataset for data analytics`
group by Product
order by total_revenue DESC;

-- average unit Price grouped by Product
select Product, round(avg(UnitPrice), 2) as Avg_Unit_Price
from `dataset for data analytics`
group by Product
order by avg_Unit_Price DESC;

-- Payment method used in more than 150 orders, with their revenue
Select PaymentMethod, count(*) as num_orders,
sum(TotalPrice) as revenue 
 from`dataset for data analytics`
 Group by PaymentMethod
 having count(*) > 150
 Order by revenue DESC;
 
 -- revenue grouped by referral source
 select ReferralSource, count(*) as orders,
 sum(TotalPrice) as revenue
 from`dataset for data analytics`
 group by ReferralSource
 order by revenue DESC;
 
 -- Average order value grouped by coupon code
 select CouponCode, COUNT(*) as orders,
 round(avg(TotalPrice), 2) as avg_order_value
 from `dataset for data analytics`
 group by CouponCode
 order by orders desc;
 
 -- top 5 customers by total amount spent
 select CustomerID, count(*) as num_orders,
 sum(TotalPrice) as total_spent
 from `dataset for data analytics`
 group by CustomerID
 order by total_spent DESC
 limit 5;
 
 -- Revenue lost to cancelled or returned orders 
 select OrderStatus, count(*) as num_orders,
 sum(TotalPrice) as lost_revenue
 from `dataset for data analytics`
 where OrderStatus in ('cancelled', 'returned,')
 group by OrderStatus;
 
 rename table `dataset for data analytics` to task_3;
 select distinct Date from task_3;