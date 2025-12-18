
  create or replace   view TPCH_SF1_DB.PUBLIC.fct_orders
  
  
  
  
  as (
    with orders as (
    select * from TPCH_SF1_DB.PUBLIC.stg_tpch_orders
),
lineitems as (
    select * from TPCH_SF1_DB.PUBLIC.stg_tpch_lineitems
),
order_summary as (
    select
        order_key,
        count(*) as line_item_count,
        sum(quantity) as total_quantity,
        sum(discounted_price) as total_discounted_sales,  -- Use staging pre-calc!
        sum(final_price) as total_final_sales             -- Use staging pre-calc!
    from lineitems
    group by order_key
)

select
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    orders.order_year,
    orders.order_month,
    orders.order_status,
    orders.order_priority,
    orders.total_price as order_total,
    order_summary.line_item_count,
    order_summary.total_quantity,
    order_summary.total_discounted_sales,
    order_summary.total_final_sales
from orders
left join order_summary using (order_key)
  );

