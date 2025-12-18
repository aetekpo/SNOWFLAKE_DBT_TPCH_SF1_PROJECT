
  create or replace   view TPCH_SF1_DB.PUBLIC.dim_customer
  
  
  
  
  as (
    with customers as (
    select * from TPCH_SF1_DB.PUBLIC.stg_tpch_customers
)

select
    customer_key,
    customer_name,
    address,
    nation_key,
    phone,
    account_balance,
    market_segment,
    customer_tier  -- Use your enhanced staging field!
from customers
  );

