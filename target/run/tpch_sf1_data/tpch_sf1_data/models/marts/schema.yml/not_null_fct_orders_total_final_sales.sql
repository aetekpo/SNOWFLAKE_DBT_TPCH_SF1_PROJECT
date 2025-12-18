
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_final_sales
from TPCH_SF1_DB.PUBLIC.fct_orders
where total_final_sales is null



  
  
      
    ) dbt_internal_test