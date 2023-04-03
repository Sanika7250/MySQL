call sanu()
create view bank_view as select age,job,marital,balance,education from bank_details;

select avg(balance) from bank_view where job = 'admin.'

select age from bank_view

select job from bank_view

select marital from bank_view

select education from bank_view



