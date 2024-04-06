with daily_amount as (
	select 
	date(transaction_time) as date_value,
	sum(transaction_amount) as total_transaction_amount
	from transactions
	group by date(transaction_time)
	order by date_value
)
select date_value as date,
total_transaction_amount,
avg(total_transaction_amount) over (order by date_value rows between 2 preceding and current row) as rolling_three_day_avg
from daily_amount;
