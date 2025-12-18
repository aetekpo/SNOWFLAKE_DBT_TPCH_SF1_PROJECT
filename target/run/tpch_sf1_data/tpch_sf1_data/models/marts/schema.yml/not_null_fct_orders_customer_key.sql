
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_key
from TPCH_SF1_DB.PUBLIC.fct_orders
where customer_key is null



  
  
      
    ) dbt_internal_test