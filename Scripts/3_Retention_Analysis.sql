with customer_last_purchase as (
	select
		ca.customerkey,
		ca.fullname,
		ca.orderdate,
		row_number() over (partition by ca.customerkey order by ca.orderdate desc) as rn,
		ca.first_purchase_date,
		ca.cohort_year
	from
		cohort_analysis ca
	group by
		ca.customerkey,
		ca.fullname,
		ca.orderdate,
		ca.first_purchase_date,
		ca.cohort_year 
),
churned_customers as (
	select
		clp.customerkey,
		clp.fullname,
		clp.orderdate as last_purchase_date,
		case
			when clp.orderdate < (select max(s.orderdate) from sales s) - interval '6 months' then 'Churned'
			else 'Active'
		end as customer_status,
		clp.cohort_year 
	from
		customer_last_purchase clp
	where
		clp.rn = 1 and 
		clp.first_purchase_date < (select max(s.orderdate) from sales s) - interval '6 months'
)
select
	cs.cohort_year,
	cs.customer_status,
	count(cs.customerkey) as number_of_customers,
	sum(count(cs.customerkey)) over(partition by cs.cohort_year) as total_customers,
	cast(count(cs.customerkey) * 100 / sum(count(cs.customerkey)) over(partition by cs.cohort_year) as decimal(10,1)) as percentage_customers
from 
	churned_customers cs
group by
	cs.cohort_year,
	cs.customer_status
	