use walmart

CREATE TABLE walmart
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );



SELECT count(* )FROM walmart
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
    -- Data Exploration

-- How many sales we have?
select count(*) from walmart

-- How many uniuque customers we have ?
SELECT 
    COUNT(customer_id)
FROM
    walmart
SELECT 
    COUNT(DISTINCT customer_id)
FROM
    walmart
select distinct category from walmart

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT 
    *
FROM
    walmart
WHERE
    sale_date = '2022-11-05'
SELECT 
    COUNT(*)
FROM
    walmart
WHERE
    sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing'
-- and the quantity sold is more than 4
SELECT 
    *
FROM
    walmart
WHERE
    category = 'Clothing' AND quantity >= 4

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category, SUM(total_sale) AS sales, COUNT(*) AS total
FROM
    walmart
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    AVG(age) AS avg_age
FROM
    walmart
WHERE
    category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
    *
FROM
    walmart
WHERE
    total_sale > 1000


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category, gender, COUNT(*) AS total_count
FROM
    walmart
GROUP BY category , gender

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select * from
(select year(sale_date) as year, month(sale_date) as month, 
round(avg(total_sale),2) as avg_sale,
rank() over(partition by  year(sale_date) order by round(avg(total_sale),2) desc )  as Rank_m
from walmart 
group by 1,2) as t1
where rank_m = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id, SUM(total_sale)
FROM
    walmart
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category, COUNT(DISTINCT customer_id) AS unique_cus
FROM
    walmart
GROUP BY category






    