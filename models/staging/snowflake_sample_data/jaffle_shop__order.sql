{{
  config(
    materialized = 'table',
    )
}}

with source_orders as (

    select * from {{ source('jaffle_shop', 'orders') }}


    {% if  target.name == "dev" %} where id <= 10     -- only 10 records for dev
    {% elif target.name == "qa"  %} where id <= 50    -- only 50 records for qa 
    {% elif target.name == "prod"  %} where id <= 60  -- only 60 records for Prod
    {% else %} --invalid_database
    {% endif %}
),

final as (

    select * from source_orders
)


select * from final