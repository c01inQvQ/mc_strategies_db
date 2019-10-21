-- Update single row by specifying field values
UPDATE strategy_info
SET
    week_performance = 0,
    month_performance = 0,
    year_performance = 0,
    overall_performance = 0,
    last_updated_datetime = '2019-05-27T20:35:00+08:00'

WHERE strategy = 'strategy_name'