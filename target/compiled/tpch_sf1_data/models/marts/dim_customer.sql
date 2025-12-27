with customers as (
    select * from TPCH_DEV_DB.DBT_DEV_SCHEMA.stg_tpch_customers
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