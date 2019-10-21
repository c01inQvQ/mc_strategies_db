-- Select particular strategy info from TABLE strategy_info
SELECT strategy, week_performance, month_performance, year_performance, overall_performance
FROM strategy_info
WHERE strategy = 'strategy_name'


-- Select all strategy info from TABLE strategy_info
SELECT strategy, week_performance, month_performance, year_performance, overall_performance
FROM strategy_info