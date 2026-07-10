CREATE TABLE customers (
	customer_id int,
    credit_score int,
    country VARCHAR(10),
    gender VARCHAR(10),
    age int,
    tenure int,
    balance decimal(15,2),
    products_number int,
    credit_card tinyint,
    active_member tinyint,
    estimated_salary decimal(15,2),
    churn tinyint
);

LOAD DATA LOCAL INFILE 'C:/Users/jiand/Downloads/Bank Customer Churn Prediction.csv'
INTO TABLE customers 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM customers;
SELECT * FROM customers LIMIT 10;