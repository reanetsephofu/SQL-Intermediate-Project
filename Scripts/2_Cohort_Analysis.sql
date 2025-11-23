select
	cohort_year,
	count(distinct ca.customerkey) as total_customers,
	sum(ca.total_net_revenue) as total_revenue,
	cast(sum(ca.total_net_revenue ) / count(distinct ca.customerkey) as decimal(10,2)) as customer_revenue
from
	cohort_analysis ca
where
	ca.orderdate = ca.first_purchase_date 
group by
	ca.cohort_year