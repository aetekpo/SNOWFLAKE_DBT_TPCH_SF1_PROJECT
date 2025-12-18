
    
    

select
    order_key as unique_field,
    count(*) as n_records

from TPCH_SF1_DB.PUBLIC.fct_orders
where order_key is not null
group by order_key
having count(*) > 1


