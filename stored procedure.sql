use bank
select * from bank_details
DELIMITER &&
create procedure sanu()
BEGIN
select * from bank_details;
END &&

call sanu()
DELIMITER &&
create procedure bal_min()
BEGIN
select * from bank_details where balance = (select min(balance) from bank_details);
END &&
bal_min
call bal_min()

deLIMITER &&
create procedure job_admin()
BEGIN
select avg(baljob_adminance) from bank_details where job = 'admin.';
END &&

call job_admin()

DELIMITER &&
create procedure job_admin1(IN sanu varchar(30))
BEGIN
	select  avg(balance) from bank_details where job = sanu;
END &&

call job_admin1('admin.')
call job_admin1('retired')

DELIMITER &&
create procedure education_job()
BEGIN
select * from bank_details where education = 'primary' and job = 'unknown';
END &&

call education_job()

DELIMITER &&
create procedure education_job1(in V1 varchar(30), in V2 varchar(30))
BEGIN
select * from bank_details where education = V1 and job = V2;
END &&

call education_job1('tertiary' , 'retired')

DELIMITER &&
create procedure max_bal()
BEGIN
select* from bank_details where balance in(select max(balance) from bank_details);
END &&

call max_bal()





 