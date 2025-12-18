
    
    

with all_values as (

    select
        market_segment as value_field,
        count(*) as n_records

    from TPCH_SF1_DB.PUBLIC.dim_customer
    group by market_segment

)

select *
from all_values
where value_field not in (
    'Automobile','Building','Furniture','Household','Machinery'
)


