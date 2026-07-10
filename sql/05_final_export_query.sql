# summary export table
SELECT customer_id,
	CASE
		WHEN credit_score < 580 THEN 'Poor (<580)'
		WHEN credit_score < 670 THEN 'Fair (580-669)'
		WHEN credit_score < 740 THEN 'Good (670-739)'
		WHEN credit_score < 800 THEN 'Very Good (740-799)'
		ELSE 'Exceptional (800+)'
    END AS credit_band,
    country,
    gender,
    CASE
		WHEN age < 30 THEN '<30'
		WHEN age < 40 THEN '30-39'
		WHEN age < 50 THEN '40-49'
		WHEN age < 60 THEN '50-59'
		ELSE '60'
    END AS age_band,
    CASE 
		WHEN tenure BETWEEN 0 and 2 THEN '0-2 years'
        WHEN tenure BETWEEN 3 and 5 THEN '3-5 years'
        WHEN tenure BETWEEN 6 and 8 THEN '6-8 years'
        ELSE '9+ years'
	END AS tenure_band,
    CASE
		WHEN balance = 0 THEN 'Zero balance'
		WHEN balance < 100000 THEN 'Under 100k'
		WHEN balance < 150000 THEN '100k-150k'
		ELSE '150k+'
    END AS balance_band,
    products_number,
    credit_card,
    active_member,
    CASE 
		WHEN estimated_salary < 50000 THEN 'Under 50K'
		WHEN estimated_salary < 100000 THEN '50K-100K'
		WHEN estimated_salary < 150000 THEN '100K-150K'
		ELSE '150K+'
	END AS salary_band,
    churn
FROM customers;