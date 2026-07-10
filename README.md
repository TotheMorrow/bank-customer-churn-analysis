# Bank Customer Churn & Segmentation Analysis

## Objective

This project analyzes ~10,000 bank customer records to identify which member profiles carry the highest churn risk. The goal is to surface actionable segments a business intelligence team could use to target retention efforts, using SQL for data modeling and segmentation, Excel for exploratory analysis, and Tableau for an interactive dashboard.

## Approach

- **SQL (MySQL)**: Loaded and cleaned raw customer data, built derived segmentation fields (age, tenure, balance, salary, and credit score bands), used aggregate queries and window functions to compare segment-level churn rates against the overall baseline.
- **Excel**: Built pivot tables cross-referencing multiple segmentation dimensions (e.g. credit score band x balance band) with conditional formatting to flag high-risk cells.
- **Tableau**: Built an interactive dashboard, a KPI summary row, a segment-level bar chart, an age/activity breakdown, and a credit score x balance heatmap, connected by cross-dashboard filters.

## Key Findings

- **Germany has the highest churn rates.** Germany had a churn rate of 32.4%, roughly double that of Spain (16.7%) and France (16.2%).
- **The highest-risk segment: customers aged 60+ who are inactive members have a 85.6% churn rate.** Risk is further concentrated in members who have poor credit scores and low tenure. 
- **Germany’s overall churn rate appears to be driven substantially by its balance distribution.** Approximately 65% of German customers fall in the 100k-150k balance range compared to roughly 29% of French and Spanish customers. German customers within the 100k-150k band also churn at higher rates (39%) than their French (16%) and Spanish (14%) counterparts. 
- **Age shows a non-linear relationship with churn.** Younger customers had the lowest churn rates. Churn rises with age and peaks in the 50-59 band, then dips slightly for customers 60+.
- **Product count shows an inverse relationship compared to common assumptions.** Other analyses conducted on bank customer churn have shown that owning more products lowers churn. This dataset shows the opposite trend: a higher number of products is associated with higher churn rates. Further discussion in the caveats section. 
- **Active members churn less.** Engagement status is a consistent predictor of retention across nearly every segment examined.

## Business Implications & Recommendations

These findings point towards three targeted strategies:

**1. Prioritize outreach to older, inactive members.** 
This segment is large enough to matter and narrow enough to target directly. Actionable goals include a dedicated relationship-manager check-in program or a re-engagement offer (e.g. waived fees or a rate incentive) for members who haven’t transacted in a defined recent window. 

**2. Investigate the multi-product churn pattern before continuing to cross-sell as a retention lever.** 
The finding that more products correlates to higher churn suggests that product bundling isn’t matching what customers need, or product count is a downstream symptom rather than a cause. Before expanding programs, it’s worth a follow-up analysis on which product combinations are riskiest and whether sequencing (product added before vs. after signs of disengagement) clarifies cause vs. effect.

**3. Treat Germany as a distinct market requiring its own retention strategy.** 
Germany’s elevated churn appears especially concentrated in its unusually large 100k-150k balance segment. This points to a market-specific issue possibly competitive pressure from other German banks targeting this balance range, or a service gap unique to that market. A focused root-cause review (e.g. customer surveys or competitive rate benchmarking) would be a reasonable next step.

This dataset shows churn risk is concentrated in identifiable, addressable segments rather than spread evenly across the customer base. Retention rates will go further if efforts are aimed at specific segments rather than applied uniformly.

## Tools Used

- **SQL(MySQL)**: Data modeling, CASE-based segmentation, aggregate queries, window functions.
- **Excel**: Pivot tables, calculated fields, conditional formatting.
- **Tableau**: Interactive dashboard design, calculated fields, dashboard filters. 

## Caveats

Certain product-count or credit-score/balance cross-sections have small sample sizes. Findings involving small segments should be interpreted with appropriate caution rather than treated as broadly generalizable conclusions. 

<img width="993" height="796" alt="Screenshot 2026-07-09 172140" src="https://github.com/user-attachments/assets/5944c752-3b73-4cca-9465-73cc92657dfd" />
