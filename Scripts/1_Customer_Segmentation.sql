with customer_ltv as(
	select
		ca.customerkey,
		ca.fullname,
		sum(ca.total_net_revenue) as total_ltv
	from
		cohort_analysis ca
	group by
		ca.customerkey,
		ca.fullname
),
customer_segments as (
	select
		PERCENTILE_CONT(0.25) within group (order by total_ltv) as ltv_25th_percentile,
		PERCENTILE_CONT(0.75) within group (order by total_ltv) as ltv_75th_percentile
	from
		customer_ltv
),
segment_values as (
	select
		cltv.*,
		case
			when cltv.total_ltv < cs.ltv_25th_percentile then '1 - Low Value'
			when cltv.total_ltv <= cs.ltv_75th_percentile then '2 - Median Value'
			else '3 - High Value'
		end as customer_segment
	from
		customer_ltv cltv,
		customer_segments cs
)
select
	sv.customer_segment,
	sum(sv.total_ltv) as total_ltv,
	count(sv.customerkey) as total_customers,
	cast(sum(sv.total_ltv) / count(sv.customerkey ) as decimal(10,2)) as avg_ltv
from
	segment_values sv
group by
	sv.customer_segment