/*
select * from walmart;

SELECT payment_method,count(*)
from walmart
group by 1;

select count(DISTINCT Branch) from walmart;

-- BUSINESS QUESTIONS/ANALYSIS:-
Q1:
select payment_method as method, count(*) as payment_count, sum(quantity)
from walmart
GROUP By payment_method;

Q2:
select * from (
SELECT  Branch,category, AVG(rating), RANK() over(PARTITION BY Branch ORDER BY AVG(rating) desc) as rank
FROM walmart
GROUP BY Branch,category
) as ranked_table
    where rank = 1

Q3:
select * from (
SELECT 
    Branch, 
    DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%y'), '%a') AS day_name, COUNT(*),RANK() OVER(PARTITION BY Branch ORDER BY count(*) DESC) as rank
FROM walmart
GROUP BY Branch, day_name)
as updated 
where rank =1;

Q4:
select payment_method,count(*) as total_count
from walmart
GROUP BY payment_method

Q5:
SELECT City,category,min(rating),MAX(rating),AVG(rating)
from walmart
GROUP BY 1,2

Q6:
select category,sum(total*profit_margin) as profit
FROM walmart
GROUP BY category
order BY profit DESC;

Q7:
select * from (
select Branch, payment_method,count(*),rank() over(PARTITION by Branch order by count(*)  desc) as rank
from walmart
GROUP BY Branch,payment_method
    ) as updated
    where rank=1;

Q8:
SELECT Branch,
    CASE 
        WHEN TIME(time) BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN TIME(time) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
       ELSE 'Evening'
       
    END AS shift, 
    COUNT(*) AS transaction_count
FROM walmart
GROUP BY Branch,shift;

Q9:
SELECT 
    Branch, 
    SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2022 THEN total ELSE 0 END) AS revenue_2022,
    SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2023 THEN total ELSE 0 END) AS revenue_2023,
    ROUND(
        (SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2022 THEN total ELSE 0 END) - 
         SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2023 THEN total ELSE 0 END)) / 
         SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2022 THEN total ELSE NULL END) * 100, 2
    ) AS decline_percentage
FROM walmart
GROUP BY Branch
ORDER BY decline_percentage desc
limit 5;
*/

    

