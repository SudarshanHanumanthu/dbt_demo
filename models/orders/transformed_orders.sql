SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    status,
    EXTRACT(YEAR FROM order_date) AS order_year,  -- simple transformation
    CASE
        WHEN amount >= 200 THEN 'High'
        WHEN amount >= 100 THEN 'Medium'
        ELSE 'Low'
    END AS order_size  -- simple category
FROM {{ source('bq_source', 'orders') }}
WHERE order_date IS NOT NULL
  AND amount IS NOT NULL
