-- Select overall performance for particular time interval from TABLE strategy_order_record
SELECT sum(profit)
FROM strategy_order_record
WHERE strategy = 'strategy_name' AND (datetime BETWEEN '2018-01-01T00:00:00+08:00' AND '2019-10-22T00:00:00+08:00')


-- Select performance grouped by particular time interval from TABLE strategy_order_record
-- Field in date_trunc() can be 'year', 'month', 'week', 'day' ...etc
SELECT date_trunc('month', datetime) AS trunc_datetime, sum(profit) AS performance
FROM strategy_order_record
WHERE strategy = 'strategy_name' AND (datetime BETWEEN '2018-01-01T00:00:00+08:00' AND '2019-10-22T00:00:00+08:00')
GROUP BY trunc_datetime
ORDER BY trunc_datetime


-- Select performance order by order from TABLE strategy_order_record
SELECT datetime, profit
FROM strategy_order_record
WHERE strategy = 'strategy_name' AND (datetime BETWEEN '2019-01-01T00:00:00+08:00' AND '2019-10-22T00:00:00+08:00')
ORDER BY datetime


-- Select daily accumulated performance from TABLE strategy_daily_accumulated_performance
SELECT date, accumulated_performance
FROM strategy_daily_accumulated_performance
WHERE strategy = 'strategy_name' AND (date BETWEEN '2019-01-01' AND '2019-10-22')
ORDER BY date;


-- Select daily accumulated performance from TABLE strategy_order_record
WITH subquery AS (
    SELECT
        CAST(datetime AS DATE) AS date,
        strategy,
        sum(profit) OVER w AS accumulated_performance
    FROM strategy_order_record
    WHERE strategy = 'strategy_name'
    WINDOW w AS (ORDER BY CAST(datetime AS DATE))
)

SELECT DISTINCT date, accumulated_performance
FROM subquery
WHERE date BETWEEN '2019-01-01' AND '2019-10-22'
ORDER BY date;