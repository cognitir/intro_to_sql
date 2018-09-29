SELECT

FROM

WHERE

AND

-- operators for WHERE
=, <>, >=, <=, !=, BETWEEN number1 AND number2

-- checking for nulls
IS NOT NULL, IS NULL

LIKE, ILIKE, '_searchterm', '%search%'

AVG(column), MAX(column), MIN(column), COUNT(column), SUM(column) DISTINCT column

-- rounding
ROUND(column::numeric, 2)

-- aliasing
AS

-- analytics functions
PERCENTILE_CONT(0.25) WITHIN group (ORDER BY duration ASC)
CORR()