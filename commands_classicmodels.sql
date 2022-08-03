select * from offices;

select count(*) from offices;

select * from payments order by paymentDate;

select distinct(customerNumber)
	from payments order by paymentDate;

select * from payments order by customerNumber;

select curdate();

update payments set paymentDate = '2022-08-02' 
	where customernumber = 242;

update payments set paymentDate = curdate()
	where customerNumber = 242;