CREATE TABLE global_web_traffic_2026 (
    global_rank INT primary key,
    domain VARCHAR(255),
    category VARCHAR(255),
    primary_market VARCHAR(255),
    monthly_visits FLOAT,
    bounce_rate_pct INT,
    avg_session_duration_s INT,
    stickiness_index FLOAT,
    last_crawled DATE
);

ALTER TABLE global_web_traffic_2026
    ALTER COLUMN bounce_rate_pct TYPE float,
    ALTER COLUMN avg_session_duration_s TYPE float;


--\copy global_web_traffic_2026 FROM 'C:\Users\HP\OneDrive\Documentos\data_sets\global_web_traffic_2026\global_web_traffic_2026.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT * 
FROM 
    global_web_traffic_2026;