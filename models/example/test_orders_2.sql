{{ config(materialized='view') }}

SELECT * 
FROM {{ source('bq_source1', 'orders') }}
where status='Cancelled'