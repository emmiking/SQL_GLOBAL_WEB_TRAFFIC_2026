/*
    Question
    Find the top 5 domains in the 'Finance' category that have a 
    better (lower) bounce rate than the overall average bounce rate of the 'Social' category.
*/

-- initial query

SELECT
    domain,
    category,
    avg(bounce_rate_pct) AS avg_bounce_rate
FROM
    global_web_traffic_2026
where avg_bounce_rate > 50
group by domain
order by 
    avg_bounce_rate desc
limit 5;

-- correct solution

SELECT
    domain,
    category,
    bounce_rate_pct
FROM
    global_web_traffic_2026
WHERE
    category ='Finance'
    AND bounce_rate_pct < (
        select avg(bounce_rate_pct)
        from global_web_traffic_2026
        where category = 'Social'
    )
ORDER BY
    bounce_rate_pct asc
LIMIT 5;