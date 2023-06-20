{% snapshot orders_snapshot %}

{{
    config(
      
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='_etl_loaded_at',
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}