-- Cleaned and prepared data using SQL by removing extra spaces, standardizing product names and reporting periods, filtering records by date, and sorting by region.

SELECT
    TRIM(region) AS region,

    CASE
        WHEN TRIM(product) = 'Молоко сире тварин сільськогосподарських всіх видів'
            THEN 'Молоко'
        ELSE TRIM(product)
    END AS product,

    TRIM(type) AS type,

    CASE
        WHEN TRIM(period) = '2026-M09'
            THEN 'Січ.-вер. 2026'
        WHEN TRIM(period) = '2025-M09'
            THEN 'Січ.-вер. 2025'
        ELSE TRIM(period)
    END AS period,

    COALESCE(NULLIF(TRIM(value), ''), '0') AS value

FROM milk4

WHERE TRIM(period) = '2025-M09'

ORDER BY TRIM(region);