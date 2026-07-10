# churn rate by credit score
SELECT CASE
	WHEN credit_score < 580 THEN 'Poor (<580)'
    WHEN credit_score < 670 THEN 'Fair (580-669)'
    WHEN credit_score < 740 THEN 'Good (670-739)'
    WHEN credit_score < 800 THEN 'Very Good (740-799)'
    ELSE 'Exceptional (800+)'
    END AS credit_bands,
    COUNT(*) as num_customer,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY credit_bands
ORDER BY credit_bands;

# churn rate by estimated salary
SELECT CASE
	WHEN balance = 0 THEN 'Zero balance'
    WHEN balance < 100000 THEN 'Under 100k'
    WHEN balance < 150000 THEN '100k-150k'
    ELSE '150k+'
    END AS balance_bands,
	COUNT(*) as num_customer,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY balance_bands
ORDER BY balance_bands;

# churn rate by balance
SELECT CASE
	WHEN balance = 0 THEN 'Zero balance'
    WHEN balance < 100000 THEN 'Under 100k'
    WHEN balance < 150000 THEN '100k-150k'
    ELSE '150k+'
    END AS balance_bands,
	COUNT(*) as num_customer,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY balance_bands
ORDER BY balance_bands;

# churn rate by age
SELECT CASE
	WHEN age < 30 THEN '<30'
    WHEN age < 40 THEN '30-39'
    WHEN age < 50 THEN '40-49'
    WHEN age < 60 THEN '50-59'
    ELSE '60'
    END AS age_band,
    COUNT(*) AS num_customer,
    SUM(churn) AS churned,
	ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY age_band
ORDER BY age_band;

# churn rate by tenure banding
SELECT CASE 
		WHEN tenure BETWEEN 0 and 2 THEN '0-2 years'
        WHEN tenure BETWEEN 3 and 5 THEN '3-5 years'
        WHEN tenure BETWEEN 6 and 8 THEN '6-8 years'
        ELSE '9+ years'
	END AS tenure_band, 
	COUNT(*) AS num_customer,
    SUM(churn) AS churned,
	ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY tenure_band
ORDER BY tenure_band;