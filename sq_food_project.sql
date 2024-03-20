CREATE DATABASE projects;
use projects;
select * from food_project;

SET SQL_SAFE_UPDATES = 0;

-- Q1	Online food order decision based on customer Age

WITH cte AS (
    SELECT *, 
        CASE 
            WHEN Age < 18 THEN 'teenage'
            WHEN Age BETWEEN 18 AND 30 THEN 'younger'
            WHEN Age BETWEEN 31 AND 45 THEN 'Adult'
            ELSE 'senior_citizen'
        END AS age_group
    FROM food_project
)
SELECT age_group, COUNT(age_group) 
FROM cte 
GROUP BY age_group 
ORDER BY COUNT(age_group) DESC;

-- Q2	Online food order decision based on size of the family
WITH cte AS (
    SELECT *, 
        CASE 
            WHEN Family_size =1 THEN 'Single'
            WHEN Family_size > 2 AND Family_size<= 4 THEN 'Orthodox_family'
            WHEN Family_size > 4 THEN 'Joint_family'
            ELSE 'Unknown'
        END AS family_group
    FROM food_project
)  
SELECT family_group, COUNT(family_group) 
FROM cte 
GROUP BY family_group 
ORDER BY COUNT(family_group) DESC;

select * from food_project;

-- Q3	Who orders more Male or Female??

SELECT  Gender, count(*) as total_order_gender_wise from food_project group by Gender order by total_order_gender_wise desc;

-- Q4	Who orders more Married or unmarried??

select marital_status, count(*) as total_orders from food_project group by marital_status order by total_orders desc;

-- Q5	Analyze food ordering behaviour across income level
select * from food_project;
select monthly_income, count(*) as income_wise_orders, round(count(*)*100.0/ (select count(*) from food_project)) as percentage_wise_orders from food_project group by monthly_income  order by  income_wise_orders desc;

-- Q6	Food ordering pattern based on qualification

select educational_qualifications, count(*)as total_orders from food_project group by educational_qualifications order by total_orders desc;

-- Q7	Food ordering pattern based on occupation
select occupation, count(*)as total_orders from food_project group by occupation order by total_orders desc;

-- Q8	Check the feedback
select feedback, count(*)as total_feedback from food_project group by feedback order by total_feedback desc;

--  updating the table adding new columns

alter table food_project

add column age_group varchar(50);
select * from food_project;

update food_project
set age_group =
CASE 
            WHEN Age < 18 THEN 'teenage'
            WHEN Age BETWEEN 18 AND 30 THEN 'younger'
            WHEN Age BETWEEN 31 AND 45 THEN 'Adult'
            ELSE 'senior_citizen'
END ;

alter table food_project
add column family_group varchar(50);

update food_project
set family_group=
CASE    
WHEN Family_size =1 THEN 'Single'
WHEN Family_size =2 THEN 'married_couple'
WHEN Family_size > 2 AND Family_size<= 4 THEN 'Orthodox_family'
WHEN Family_size > 4 THEN 'Joint_family'
ELSE 'Unknown'
END ;
Select * from food_project;
alter table food_project
add column blank_group varchar(70);





