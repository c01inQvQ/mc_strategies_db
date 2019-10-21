-- Insert single row by specifying all field values
INSERT INTO strategy_daily_accumulated_performance (
    date,
    strategy,
    accumulated_performance
)
VALUES ('2019-05-27', 'strategy_name', 0);


-- Calculate overall daily accumulated performance from TABLE strategy_order_record
-- Insert all rows into TABLE strategy_daily_accumulated_performance
WITH subquery AS (
    SELECT
        CAST(datetime AS DATE) AS date,
        strategy,
        sum(profit) OVER w AS accumulated_performance
    FROM strategy_order_record
    WHERE strategy = 'strategy_name'
    WINDOW w AS (ORDER BY CAST(datetime AS DATE))
)

INSERT INTO strategy_daily_accumulated_performance (
    date,
    strategy,
    accumulated_performance
)
SELECT DISTINCT * FROM subquery;