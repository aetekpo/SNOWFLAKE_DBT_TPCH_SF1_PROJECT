with source as (
    select * from snowflake_sample_data.tpch_sf1.lineitem
),

lineitems_renamed_casted as (
    select
        l_orderkey::number as order_key,
        l_partkey::number as part_key,
        l_linenumber::number as line_number,
        l_quantity::number(3,0) as quantity,
        l_extendedprice::number(15,2) as extended_price,
        l_discount::number(3,2) as discount,
        l_tax::number(3,2) as tax,
        l_returnflag as return_flag,
        l_linestatus as line_status,
        l_shipdate::date as ship_date,
        l_commitdate::date as commit_date,
        l_receiptdate::date as receipt_date,
        
        -- Pre-calculate common monetary metrics (reusable in fact table)
        l_extendedprice * (1 - l_discount) as discounted_price,
        l_extendedprice * (1 - l_discount) * (1 + l_tax) as final_price,
        
        -- Simple flags for analytics
        case when l_shipdate is not null then true else false end as is_shipped

    from source
)

select * from lineitems_renamed_casted