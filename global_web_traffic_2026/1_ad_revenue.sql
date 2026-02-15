
    /*
    Question 1:
    I need to know which countries have the highest average session 
    duration for 'Social' websites.
    */


-- my initial attempts to answer;

SELECT *
from global_web_traffic_2026
WHERE category = 'Social'
ORDER BY avg_session_duration_s DESC;

SELECT 
    primary_market,
    avg_session_duration_s,
    domain,
    monthly_visits
FROM global_web_traffic_2026
WHERE category = 'Social'
ORDER BY avg_session_duration_s DESC;

SELECT 
    primary_market,
    avg_session_duration_s,
    domain,
    monthly_visits,
    count(avg_session_duration_s) AS session_count
FROM global_web_traffic_2026
WHERE category = 'Social'
GROUP BY session_count
ORDER BY avg_session_duration_s DESC;

-- correct solution;

SELECT
    primary_market,
    avg(avg_session_duration_s) as avg_time_spent
FROM
    global_web_traffic_2026
WHERE category = 'Social'
GROUP BY primary_market
ORDER BY avg_time_spent DESC;