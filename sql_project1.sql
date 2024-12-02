use project1;
-- 1.load the data from any database

-- 2.to find the information about the table
describe `hotel bookings`;
desc `hotel bookings`;

-- 3.to display the first 10 records
select * from `hotel bookings`
limit 10;

-- 4.to display the last 10 records(doubt)
select * from `hotel bookings`
limit 49990,10;

-- 5.to find the total no.of records
select count(hotel) as total_count from `hotel bookings`;

-- 6.to find the null values count from the table.
select sum(hotel is null),
sum(is_canceled is null),
sum(lead_time is null),
sum(arrival_date_year is null) from `hotel bookings`;

-- 7.to find all the unique records from the table
select * from `hotel bookings`
union 
select * from `hotel bookings`;

-- 8.Find the total count of the unique records from the table.
select count(*) from(select * from `hotel bookings`
union 
select * from `hotel bookings`) as uniquecounts;

-- 9.to find the average lead_time based on the country
select country,avg(lead_time) from `hotel bookings`
group by country;

-- 10.What is the most common market segment in the hotel bookings dataset, and how many bookings belong to this segment?
select market_segment,count(*) as count from `hotel bookings`
group by market_segment
order by count desc
limit 1;

-- 11.What is the total number of bookings that were canceled and that were not canceled in the hotel bookings dataset?
select is_canceled,count(*) as count from `hotel bookings`
group by is_canceled;

-- 12.Which hotel has the highest number of bookings in the dataset, and how many bookings were made for this hotel?
select hotel,count(*) as count from `hotel bookings`
group by hotel 
order by count desc
limit 1;

-- 13.What is the distribution of hotel bookings between cancellations and non-cancellations?

-- 14.display the records from all the hotel bookings made through the direct market segment? 
select * from `hotel bookings`
where market_segment='Direct';

-- 15.display the records where the lead_time is above 250 and below 500? 
select * from `hotel bookings`
where lead_time >250 and lead_time <500;
