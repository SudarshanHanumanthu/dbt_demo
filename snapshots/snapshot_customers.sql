{% snapshot customers_snapshot %}
{{ config(
    target_schema='dbt_demo_dbt',
    unique_key='customer_id',
    strategy='timestamp',
    updated_at='updated_at'
) }}

SELECT
  customer_id,
  customer_name,
  city,
  updated_at
FROM {{ source('bq_snapshot', 'customers') }}

{% endsnapshot %}
