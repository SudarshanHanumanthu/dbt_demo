-- models/incremental_orders.sql
{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

SELECT
  order_id,
  amount,
  status,
  update_date
FROM {{ source('bq_source1', 'test_orders_mege') }}

{% if is_incremental() %}
  -- Only include rows that changed since last run
  WHERE update_date > (SELECT MAX(update_date) FROM {{ this }})
{% endif %}