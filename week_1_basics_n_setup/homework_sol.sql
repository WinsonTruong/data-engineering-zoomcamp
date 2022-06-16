-- Question 3: trips on jan 15

select count(*)
from yellow_taxi_data
where tpep_pickup_datetime < '2021-01-16' and tpep_pickup_datetime <= '2021-01-15'
-- a better way of doing this nexttime is tpep_pickup_datetime::date

-- Question 4: largest tip for each day
select date(tpep_pickup_datetime), max(tip_amount) as max_tip
from yellow_taxi_data
group by date(tpep_pickup_datetime)
order by max_tip desc
limit 1;


-- Question 5: most popular destination

select "PULocationID", "DOLocationID", count(*)
from yellow_taxi_data
where 
    date(tpep_pickup_datetime) = '2021-01-14'
group by "PULocationID", "DOLocationID"
order by count(*) desc
limit 1
;


-- Question 6: most expensive locations; did not join the other zone location names 
select CONCAT(COALESCE("PULocationID"::VARCHAR, 'UNKNOWN'), '/',COALESCE("DOLocationID"::VARCHAR, 'UNKNOWN')), sum(total_amount)
from yellow_taxi_data
group by CONCAT(COALESCE("PULocationID"::VARCHAR, 'UNKNOWN'), '/', COALESCE("DOLocationID"::VARCHAR, 'UNKNOWN'))
order by sum(total_amount) desc;
