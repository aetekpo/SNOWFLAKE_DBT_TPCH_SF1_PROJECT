with source as (
    select * from snowflake_sample_data.tpch_sf1.part
),

part_renamed_casted as (
    select
        p_partkey::number as part_key,
        p_name as part_name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as raw_part_type,
        p_size::number as part_size,
        p_retailprice::number(10,2) as retail_price,
        p_container as container,
        
        -- Extract category from part type (simplified)
        case 
            when p_type like '%STANDARD%' then 'Standard'
            when p_type like '%LARGE%' then 'Large'
            when p_type like '%MEDIUM%' then 'Medium'
            when p_type like '%SMALL%' then 'Small'
            else 'Other'
        end as product_category,
        
        -- Price tier
        case 
            when p_retailprice > 1000 then 'Premium'
            when p_retailprice > 500 then 'Mid-range'
            else 'Economy'
        end as price_tier

    from source
)

select * from part_renamed_casted 