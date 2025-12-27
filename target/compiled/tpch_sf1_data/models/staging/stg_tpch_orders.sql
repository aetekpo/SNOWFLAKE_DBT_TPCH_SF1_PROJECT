with source as (
    select * from snowflake_sample_data.tpch_sf1.orders
),

orders_renamed_casted as (
    select
        o_orderkey::number as order_key,
        o_custkey::number as customer_key,
        o_orderstatus as order_status,
        o_totalprice::number(15,2) as total_price,
        o_orderdate::date as order_date,
        o_orderpriority as raw_order_priority,
        o_shippriority::number as ship_priority,
        
        -- Date components for easier analytics
        year(o_orderdate) as order_year,
        month(o_orderdate) as order_month,
        day(o_orderdate) as order_day,
        to_char(o_orderdate, 'YYYYMMDD')::number as order_date_key,
        
        -- Normalized priority (1-5 scale → High/Medium/Low)
        case 
            when o_orderpriority in ('1-URGENT', '2-HIGH') then 'High'
            when o_orderpriority in ('3-MEDIUM') then 'Medium'
            else 'Low'
        end as order_priority

    from source
)

select * from orders_renamed_casted