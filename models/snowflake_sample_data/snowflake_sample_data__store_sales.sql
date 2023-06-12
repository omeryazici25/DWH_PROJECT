{{ config(materialized='table') }}

with source_store_sales as (

    select * from {{ source('snowflake_sample_data', 'store_sales') }}
    limit 100

),

final as (

select *
from source_store_sales
)

select * from final