-- Select the latest order record from TABLE strategy_order_record
SELECT datetime, position, price, profit, status
FROM strategy_order_record
WHERE strategy = 'strategy_name'
ORDER BY datetime DESC
LIMIT 1


-- Select order records from TABLE strategy_order_record
SELECT datetime, position, price, profit, status
FROM strategy_order_record
WHERE strategy = 'strategy_name' AND (datetime BETWEEN '2019-01-01T00:00:00+08:00' AND '2019-01-31T00:00:00+08:00')
ORDER BY datetime
