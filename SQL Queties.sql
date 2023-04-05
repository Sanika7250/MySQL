create database sales
use sales

CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1
SET SESSION sql_mode = ''

load data infile "E:\sales_data_final.csv"
into table sales1 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 

select * from sales1

select str_to_date(order_date,'%m/%d/%Y') from sales1

alter table sales1
add column order_date_new date after order_date

select * from sales1

SET SQL_SAFE_UPDATES=0;

update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%Y')

select * from sales1

Alter table sales1
add column ship_date_new date after ship_date

SET SQL_SAFE_UPDATES=0;

update sales1
set ship_date_new = str_to_date(ship_date,'%m/%d/%Y')

select * from sales1

select * from sales1 where order_date_new = '2011-01-17'
select * from sales1 where ship_date_new = '2011-01-05'
select * from sales1 where ship_date_new > '2011-01-05'
select * from sales1 where ship_date_new between  '2011-01-05' and '2011-08-30'

select now()
select current_date()
select current_time()

select * from sales1 where ship_date_new < date_sub(now(),interval 1 week)

select date_sub(now(), interval 1 week)
select date_sub(now(), interval 30 month)
select date_sub(now(), interval 30 year)

select year(now())
select dayname (now())
select hour(now())
select dayname('2023-04-01')

select * from sales1

alter table sales1
add column flag date after order_id

SET SQL_SAFE_UPDATES=0;

update sales1
set flag = now()

select * from sales1


SET SQL_SAFE_UPDATEs = 0;

ALTER TABLE sales1
modify column year datetime;

update sales1
set year = str_to_date(order_date,'%m/%d/%Y')

select * from sales1

alter table sales1
add column Year_New int;

alter table sales1
add column Month_New int;

alter table sales1
add column Day_New int;


update sales1 
set Month_new= month(order_date_new);

select * from sales1

update sales1 
set day_new= day(order_date_new);

select * from sales1

update sales1 
set year_new= year(order_date_new);

select * from sales1 limit 5

select Month_new from sales1
select Month_new, Year_new, Day_new from sales1

select * from sales1

select avg(sales) from sales1 where year_New = 2011
select * from sales1

select avg(sales) from sales1 where year_New  between '2011' and '2012'

select year_New, avg(sales) from sales1 group by year_New 

select year_New, sum(sales) from sales1 group by year_New

select year_New, min(sales) from sales1 group by year_New

select year_New, max(sales) from sales1 group by year_New

select year_New, sum(quantity) from sales1 group by year_New

select * from sales1

select (discount + shipping_cost) as CTC from sales1 

select year_new , (discount + shipping_cost) as CTC from sales1 group by year_New

select (sales*discount + shipping_cost) as CTC from sales1 
select order_id ,discount, if(discount > 0, 'no' , 'yes') as discount_flag from sales1
select order_id ,if(discount > 0, 'no' , 'yes') as discount_flag from sales1

alter table sales1
modify column discount_flag  varchar(20) after discount

select * from sales1

update sales1
set discount_flag =  if(discount > 0, 'no','yes')

select * from sales1
select discount_flag,count(*) from sales1 group by discount_flag

select count(*) from sales1  where discount > 0

