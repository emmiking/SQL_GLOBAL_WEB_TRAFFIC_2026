/* 
    Question
    Our Q1 data shows some markets have a high volume of visits but people leave 
    immediately (high bounce rate).
*/

--intial query is correct,
SELECT 
    domain,
    bounce_rate_pct,
    monthly_visits
FROM global_web_traffic_2026
WHERE monthly_visits > 100000000 and  bounce_rate_pct > 50
order by bounce_rate_pct desc;
    
-- but you can also add;

SELECT 
    domain, 
    category, 
    monthly_visits, 
    bounce_rate_pct
FROM global_web_traffic_2026
WHERE monthly_visits > 100000000 
  AND bounce_rate_pct > 50
ORDER BY monthly_visits DESC;