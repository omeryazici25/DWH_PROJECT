{{ config(
    query_tag = 'dbt_special',
    tags=["special"],
    materialized = "ephemeral"

) }}





with teams as (
    select 'Lakers' as team
    
    union all

    select 'Clippers' as team
    
    union all

    select 'Tigers' as team
    
    union all

    select 'Heat' as team
    
    union all

    select 'Bulls' as team

    union all

    select 'Hells' as team    
                    
),
final as (
    select *, '{{invocation_id }}' as Invocation_ID from teams
)

select * from final
