-- TABLE strategy_info
CREATE TABLE strategy_info (
    strategy varchar(32),
    week_performance integer NOT NULL,
    month_performance integer NOT NULL,
    year_performance integer NOT NULL,
    overall_performance integer NOT NULL,
    last_updated_datetime timestamp with time zone NOT NULL,

PRIMARY KEY (strategy)
);


-- TABLE strategy_daily_accumulated_performance
CREATE TABLE strategy_daily_accumulated_performance (
    date date,
    strategy varchar(32) REFERENCES strategy_info (strategy),
    accumulated_performance integer NOT NULL,

PRIMARY KEY (date, strategy)
);


-- TABLE strategy_order_record
CREATE TABLE strategy_order_record (
    datetime timestamp with time zone,
    strategy varchar(32) REFERENCES strategy_info (strategy),
    position smallint NOT NULL,
    price smallint NOT NULL,
    profit integer NOT NULL,
    status smallint NOT NULL,

CONSTRAINT position_constraint CHECK (position in (-1, 0, 1)),
CONSTRAINT price_constraint CHECK (price >= 0),
CONSTRAINT status_constraint CHECK (status in (-3, -2, -1, 1, 2, 3)),
PRIMARY KEY (datetime, strategy)
);