DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;

DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;
CREATE USER indexed_cars_user WITH ENCRYPTED PASSWORD 'letmein';
CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;



\c indexed_cars

-- Run the provided scripts/car_models.sql script on the indexed_cars database
\i scripts/car_models.sql;
-- Run the provided scripts/car_model_data.sql script on the indexed_cars database 10 times
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;


CREATE INDEX lambo
ON car_models (make_code);

CREATE INDEX nissan
ON car_models (model_code);

CREATE INDEX years
ON car_models (year);

-- --1
EXPLAIN ANALYZE SELECT DISTINCT make_title
FROM car_models
WHERE make_code = 'LAM';
-- Planning time: 0.119 ms
-- Execution time: 37.808 ms

---INDEXED time---
-- Planning time: 0.122 ms
-- Execution time: 1.276 ms


-- --2
EXPLAIN ANALYZE SELECT DISTINCT model_title
FROM car_models
WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
-- Planning time: 0.134 ms
-- Execution time: 33.005 ms

---INDEXED time---
-- Planning time: 0.225 ms
-- Execution time: 1.291 ms

-- --3
EXPLAIN ANALYZE SELECT make_code, model_code, model_title, year
FROM car_models
WHERE make_code = 'LAM';
--Planning time: 0.094 ms
--Execution time: 32.782 ms

---INDEXED time---
-- Planning time: 0.109 ms
-- Execution time: 0.962 ms

--4
EXPLAIN ANALYZE SELECT *
FROM car_models
WHERE year >= 2010 AND year <= 2015;
-- Planning time: 0.079 ms
-- Execution time: 49.990 ms

---INDEXED time---
--Planning time: 0.111 ms
--Execution time: 29.212 ms

-- --5
EXPLAIN ANALYZE SELECT *
FROM car_models
WHERE year = 2010;
-- Planning time: 0.084 ms
-- Execution time: 37.861 ms

---INDEXED time---
--Planning time: 0.353 ms
--Execution time: 10.167 ms



