/*
Compare the 'News' category against the 'Social' category. For each, 
show me the total monthly_visits and the average stickiness_index. 
Use a CASE statement to label them as 'High Loyalty' if the stickiness is above 10, 
and 'Low Loyalty' if it's below.
*/

--initial query

SELECT
    primary_market,
    sum(monthly_visits) as total_visits,
    stickiness_index,
    case
        when category = 'Social' then 'Social'
        when category = 'News' then 'News'
        else 'Other'
    end as category,

    case
        when
    avg(stickiness_index) > 10 then 'high_loyalty' else 'low_loyalty' 
    end as loyalty_level
FROM 
    global_web_traffic_2026
WHERE category IN ('Social', 'News')

GROUP BY
    primary_market
ORDER BY
    total_visits DESC;

-- correct solution

SELECT
   category,
   sum(monthly_visits) as total_visits,
   avg(stickiness_index) as avg_stickiness,
   CASE
        WHEN avg(stickiness_index) > 10 THEN 'high_loyalty'
        ELSE 'low_loyalty'
    END AS loyalty_level
FROM
    global_web_traffic_2026
WHERE category IN ('Social', 'News')
GROUP BY
    category;

