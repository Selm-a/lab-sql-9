use sakila;

#Create a table rentals_may to store the data from rental table with information for the month of May.
create table rental_may(
		rental_id int unique not null,
        rental_date int unique not null,
        inventory_id int unique not null,
        customer_id int default null,
        return_date int default null,
        staff_id int default null,
        last_update int default null,
        constraint primary key(rental_id)
		);


#Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

select * from rental;
select *, date_format(convert(substring(return_date, 4, 7), date), "%M") as month from rental;
select *, extract( month from cast(return_date as date)) as month from rental;

create table rentals_may like rental;
insert into rentals_may
select * from rental
where month(rental_date)=5;

select * from rentals_may;

create table rentals_june like rental;
insert into rentals_june
select * from rental
where month(rental_date)=6;

select * from rentals_may;
select count(rental_id) as number_rental, customer_id 
from rentals_may 
group by customer_id;

select * from rentals_june;
select count(rental_id) as number_rental, customer_id 
from rentals_june
group by customer_id;

select count(rental_id) as number_rental, customer_id from rentals_may group by customer_id;




    