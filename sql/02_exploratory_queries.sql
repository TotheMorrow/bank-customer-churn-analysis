# overall churn rate
SELECT 
	churn,
    COUNT(*) AS num_customers,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM customers), 1) AS pct
FROM customers
GROUP BY churn;

# churn rate by number of products
SELECT products_number,
	COUNT(*) AS num_customer,
    SUM(churn) AS churned,
    ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY products_number
ORDER BY products_number ASC;

# churn rate by activity status
SELECT active_member,
	COUNT(*) AS num_customer,
    SUM(churn) AS churned,
	ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY active_member;

# churn rate by country and gender
SELECT country, gender,
	COUNT(*) AS num_customer,
    SUM(churn) AS churned,
	ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY country, gender
ORDER BY country, gender;

# churn rate by credit_card
SELECT credit_card,
	COUNT(*) as num_customers,
	SUM(churn) AS churned,
    ROUND(SUM(churn) * 100 / COUNT(*),1) as churn_rate_pct
FROM customers
GROUP BY credit_card;

# churn rate by products number and activity status
SELECT active_member, products_number,
	COUNT(*) AS num_customer,
    SUM(churn) AS churned,
	ROUND(SUM(churn) * 100 / COUNT(*), 1) AS churn_rate_pct
FROM customers
GROUP BY active_member, products_number
ORDER BY active_member, products_number;