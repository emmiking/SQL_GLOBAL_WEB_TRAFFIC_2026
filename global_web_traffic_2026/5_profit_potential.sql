/*
Create a temporary table (CTE) called MarketMetrics that calculates a 'Profit Score' 
for every domain. The formula is: (monthly_visits * avg_session_duration_s) / 1000. 
Then, join this back to the main table to show the Domain, Category, and Profit Score, 
but only for domains ranked in the Top 50 globally.
*/

--initial query, this is the cte mathematical calculations

WITH Market_metrics AS (
    select
        monthly_visits,
        avg_session_duration_s,
        (monthly_visits * avg_session_duration_s)/ 1000 as profit_score
    from
        global_web_traffic_2026
)
SELECT
    d.domain,
    c.category,
    p.profit_score,
    g.global_rank
FROM
    global_web_traffic_2026 as t
INNER JOIN
    market_metrics as p ON t.monthly_visits = p.monthly_visits
INNER JOIN
    global_web_traffic_2026 as d ON t.domain = d.domain
INNER JOIN
    global_web_traffic_2026 as c ON t.category = c.category;

-- correct solution

WITH market_metrics AS (
    SELECT
        domain,
        (monthly_visits * avg_session_duration_s) / 1000 AS profit_score
    FROM
        global_web_traffic_2026
)
SELECT
    g.domain,
    g.category,
    m.profit_score
FROM global_web_traffic_2026 g
JOIN market_metrics m ON g.domain = m.domain
WHERE g.global_rank <= 50
ORDER BY m.profit_score DESC;