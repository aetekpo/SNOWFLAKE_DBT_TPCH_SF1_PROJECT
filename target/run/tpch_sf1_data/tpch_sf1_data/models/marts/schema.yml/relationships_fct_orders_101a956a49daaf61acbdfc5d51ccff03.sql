
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select customer_key as from_field
    from TPCH_SF1_DB.PUBLIC.fct_orders
    where customer_key is not null
),

parent as (
    select customer_key as to_field
    from TPCH_SF1_DB.PUBLIC.dim_customer
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test