with source as (
    select * from snowflake_sample_data.tpch_sf1.customer
),

customer_renamed_casted as (
    select
        c_custkey::number as customer_key, 
        c_name as customer_name,
        c_address as address,
        c_nationkey::number as nation_key,
        c_phone as phone,
        c_acctbal::number(15,2) as account_balance,
        c_mktsegment as raw_market_segment,
        
        -- Standardize market segment labels
        case 
            when upper(c_mktsegment) like '%AUTOMOBILE%' then 'Automobile'
            when upper(c_mktsegment) like '%MACHINERY%' then 'Machinery' 
            when upper(c_mktsegment) like '%BUILDING%' then 'Building'
            else initcap(c_mktsegment)
        end as market_segment,
        
        -- Account balance tier for analytics
        case 
            when c_acctbal > 100000 then 'High Value'
            when c_acctbal > 50000 then 'Medium Value'
            else 'Low Value'
        end as customer_tier

    from source
)

select * from customer_renamed_casted