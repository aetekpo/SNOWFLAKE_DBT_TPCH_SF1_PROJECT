with parts as (
    select * from TPCH_SF1_DB.PUBLIC.stg_tpch_parts
)

select
    part_key as product_key,
    part_name as product_name,
    manufacturer,
    brand,
    product_category,  -- Use your enhanced staging field!
    price_tier,        -- Use your enhanced staging field!
    retail_price
from parts