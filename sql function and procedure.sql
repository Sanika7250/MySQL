use sales

select * from sales1

DELIMITER $$
create function add_to_col(a INT)
returns INT
DETERMINISTIC
BEGIN
   DECLARE b int;
   set b = a + 10;
   return b;
end $$

select * from sales1

select max(sales) from sales1

select add_to_col(15)

select quantity + 10 from sales1
select add_to_col(quantity+10) from sales1

DELIMITER $$
create function final_profits( profit INT, discount INT)
returns INT 
DETERMINISTIC
BEGIN
declare final_profit int;
set final_profit = profit - discount;
return final_profit;
end$$

select profit,discount from sales1
select profit, discount , final_profits(profit,discount) from sales1

DELIMITER $$
create function final_profits_real( profit decimal(20,6), discount decimal(20,6), sales decimal(20,6))
returns INT 
DETERMINISTIC
BEGIN
declare final_profit int;
set final_profit = profit - sales * discount;
return final_profit;
end$$


DELIMITER $$
create function int_to_str(a INT)
RETURNS varchar(30)
DETERMINISTIC
BEGIN
declare b varchar(30);
set b = a;
return b;
END$$

 DELIMITER &&
create function mark_sales(sales int ) 
returns varchar(30)
DETERMINISTIC
begin 
declare flag_sales varchar(30); 
if sales  <= 100  then 
	set flag_sales = "super affordable product" ;
elseif sales > 100 and sales < 300 then 
	set flag_sales = "affordable" ;
elseif sales >300 and sales < 600 then 
	set flag_sales = "moderate price" ;
else 
	set flag_sales = "expensive" ;
end if ;
return flag_sales;
end &&

select mark_sales(20) 
select mark_sales(300)
select mark_sales(100)

select sales,mark_sales(sales) from sales1
select * from sales1 where mark_sales(sales) = "expensive"


DELIMITER $$
create procedure insert_data()
BEGIN
set @var = 10;
generate_data : loop
insert into loop_table values(@var);
set @var = @var + 1;
if @var = 100 then
 leave generate_data;
end if;
end loop generate_data;
end$$

call insert_data()

select * from loop_table
