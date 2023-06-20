{{ config(
    tags=["omer"]
) }}
with 
teams as (
 
    select * from {{ ref('teams') }}

),


team_locations as (

    select * from {{ref('team_locations')}}
),

final as (

    select 
          teams.team,
          team_locations.city,
          team_locations.state,
          case when team_locations.name = '{{ var('current_champion') }}' then True else False end  as champion,
          '{{invocation_id }}' as Invocation_ID         
     from teams 
     left join team_locations 
        on team_locations.name=teams.team
     
)

select * from final