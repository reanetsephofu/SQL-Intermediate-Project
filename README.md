# Intermediate SQL - Sales Analysis

## OVERVIEW

Analysis of customer behaviour, retention, & lifetime value for e-commerce company to improve customer retention & maximise revenue.

## Business Questions

1. **CUSTOMER SEGMENTATION:** who are the most valuable customers?

2. **COHORT ANALYSIS:** how do different customer groups generate revenue?

3. **RETENTION ANALYSIS:** who hasn't made any recent purchases?

## Analysis Approach

### 1. CUSTOMER SEGMENTATION
- Categorised customers based on total lifetime value (LTV)

- Assigned customers to High, Median, Low value segments

- Calculated key metrics: total revenue

**QUERY:**

[1_Customer_Segmentation.sql](/Scripts/1_Customer_Segmentation.sql)

**VISUALISATION:**

<img src="/Images/1_segmentation_analysis_chart.png" style="width: 50%; height: auto;">

**KEY FINDINGS:**

- High value sect (25% of customer base) drives nearly 66% of revenue ($135.4M).

- Median value sect (50% of customer base) generates 32.3% of total revenue ($66.6M),

- Low value sect (25% of customers) only rakes in 2.1% of total revenue ($4.3M).

**BUSINESS INSIGHTS:**

- **High Value (66% revenue)**: offer premium membership program to 12,372 VIP customers, as losing one customer would significantly impact revenue.

- **Median Value (32% revenue)**: create upgrade paths through personalised promotions, with potential revenue growth.

- **Low Value (2% revenue)**: Re-engagement campaigns & price-sensitive promotions to increase purchase frequency.


### 2. COHORT ANALYSIS

- Tracked revenue & customer count per cohort
- Cohorts were grouped by year of first purchase
- Analysed customer retention at cohort level

**QUERY:**

[2_Cohort_Analysis.sql](/Scripts/2_Cohort_Analysis.sql)

**VISUALISATION:**

<img src="/Images/2_cohort_analysis_chart.png" style="width: 50%; height: auto;">

**Key Findings:**

- Revenue per customer shows  decreasing trend over time.
    - 2022-2024 segments are consistently performing worse than predecessors.
    - **NOTE:** Although net revenue is increasing, this is likely due to larger customer base. It is not reflective of customer value.

**Business Insights**

- Value extracted from customers is decreasing over time & requires further investigation.

- Concerning drop in new number of customers in 2023.

- Company faced with revenue decline due to decrease in LTV & customer acquisition.

### 3. RETENTION ANALYSIS

- Identified customers at risk of churning
- Analysed last purchase patterns
- Calculated customer-specific metrics

**QUERY:**

[3_Retention_Analysis.sql](/Scripts/3_Retention_Analysis.sql)

**VISUALISATION:**

<img src="/Images/3_retention-churn_analysis_chart.png" style="width: 50%; height: auto;">

**Key Findings:**

- Cohort churn stabilises at ~90% after 2-3 years, indicating predictable long-term retention pattern.

- Retention rates are consistently low (8-10%) across all cohorts, suggests retention issues are systemic, not cohort-specific.

- Newer cohorts (2022-2023) show similar churn trajectories, signaling without intervention, future cohort are bound to same fate.

**Business Insights**

- Strengthen early engagement strategies to target first 1-2 years with onboarding incentives, loyalty rewards, personalised offers to improve long-term retention.

- Re-engage high-value churned customers by focusing on targeted win-back campaigns rather than broad retention efforts, reactivating valuable users may yield high ROI.

- Predict & preempt churn risk & use customer-specific warning indicators to proactively intervene with at-risk users before lapsing.


## Strategic Recommendations

1. **Customer Value Optimisation** (Customer Segmentation)
    - Launch VIP program for high value customers.

    - Create personalised upgrade paths for median value sect.

    - Design price-sensitive promotions for low-value sect to increase purchase frequency.

2. **Cohort Performance Strategy** (Revenue by Cohort Year)
    - Target 2022-2024 sects with personalised re-engagement offers.

    - Implement loyalty/subscription programs to stabilise revenue fluctuations.

    - Apply successful strategies from high-spending 2016-2018 sects to newer customers.

3. **Retention & Churn Prevention** (Customer Retention)
    - Strengthen first 1-2 year engagement with onboarding incentives.

    - Focus on targeted win-back campaigns for high-value churned customers.

    - Implement proactive intervention system for at-risk customers before lapsing.

## Technical Details

- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL, DBeaver, PGAdmin
- **Visualisation:** ChatGPT, Power BI
