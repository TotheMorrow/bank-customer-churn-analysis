# compare products number churn rate to overall churn rate
SELECT 
	products_number,
    COUNT(*) AS num_customers,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) as segment_churn_rate,
    ROUND((SELECT SUM(churn) FROM customers) * 100 / (SELECT COUNT(*) FROM customers),1) as overall_churn_rate,
    ROUND(SUM(churn) * 100 / COUNT(*) - (SELECT SUM(churn) FROM customers) * 100 / (SELECT COUNT(*) FROM customers),1) as diff_from_avg
FROM customers
GROUP BY products_number;

# churn rate by country and product number
SELECT country, products_number,
	COUNT(*) AS num_customer,
    SUM(churn) AS churned,
	ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY country, products_number
HAVING COUNT(*) >= 30
ORDER BY country, products_number;

# compare country churn rate to overall churn rate
SELECT 
	country,
    COUNT(*) AS num_customers,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) as segment_churn_rate,
    ROUND((SELECT SUM(churn) FROM customers) * 100 / (SELECT COUNT(*) FROM customers),1) as overall_churn_rate,
    ROUND(SUM(churn) * 100 / COUNT(*) - (SELECT SUM(churn) FROM customers) * 100 / (SELECT COUNT(*) FROM customers),1) as diff_from_avg
FROM customers
GROUP BY country;

# compare tenure band churn rate to overall churn rate
SELECT 
	CASE 
		WHEN tenure BETWEEN 0 and 2 THEN '0-2 years'
        WHEN tenure BETWEEN 3 and 5 THEN '3-5 years'
        WHEN tenure BETWEEN 6 and 8 THEN '6-8 years'
        ELSE '9+ years'
	END AS tenure_band,
    COUNT(*) AS num_customers,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) as segment_churn_rate,
    ROUND((SELECT SUM(churn) FROM customers) * 100 / (SELECT COUNT(*) FROM customers),1) as overall_churn_rate,
    ROUND(SUM(churn) * 100 / COUNT(*) - (SELECT SUM(churn) FROM customers) * 100 / (SELECT COUNT(*) FROM customers),1) as diff_from_avg
FROM customers
GROUP BY tenure_band;

# rank customers by balance within their country
SELECT 
	customer_id,
    country,
    balance,
    churn,
    RANK() OVER (PARTITION BY country ORDER BY balance DESC) AS balance_rank_in_country
FROM customers;