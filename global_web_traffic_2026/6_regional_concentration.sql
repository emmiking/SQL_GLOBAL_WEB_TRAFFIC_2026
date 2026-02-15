

--initial query

SELECT
    primary_market,
    count(*) as market_count
FROM
    global_web_traffic_2026
WHERE global_rank <= 100
GROUP BY 
    primary_market
ORDER BY
    market_count desc;