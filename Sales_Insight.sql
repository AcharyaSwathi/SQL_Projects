create database sales;
use sales;

-- Retriving the data from different tables
SELECT * FROM customers;
SELECT * FROM date;
SELECT * FROM markets;
SELECT * FROM products;
SELECT * FROM transactions;

-- Retriving the total number of data from different tables
select count(*) from customers;
select count(*) from date;
select count(*) from markets;
select count(*) from products;
select count(*) from transactions;


-- Retriving the top 6 customers 
select * from customers limit 6;
select * from products limit 6;

-- Retriving the transaction record from Chennai, total count and top 5
select * from transactions where market_code="Mark001";
select count(*) from transactions where market_code="Mark001";
select * from transactions where market_code="Mark001" limit 5;

-- Retrive the distint product from chennai
select distinct product_code from transactions where market_code="Mark001";

-- Retriving the currency which is in USD
select * from transactions where currency="USD";

-- Retriving the 'Brick & Mortar' customer_type from customer table
select * from customers where customer_type="Brick & Mortar";

-- Retriving the transactions in the year 2020
select * from transactions inner join date on transactions.order_date=date.date where year=2020;

-- Retriving the Total revenue, Average revenue
select sum(transactions.sales_amount) from transactions inner join date on transactions.order_date=date.date;
select avg(transactions.sales_amount) from transactions inner join date on transactions.order_date=date.date;


-- Retriving the total revenue in 2020
select sum(transactions.sales_amount) from transactions inner join date on transactions.order_date=date.date
where date.year=2020;

-- Retriving the total revenue in year 2020 in chennai
select sum(transactions.sales_amount) from transactions inner join date on transactions.order_date=date.date
where date.year=2020 and transactions.market_code="Mark001";


