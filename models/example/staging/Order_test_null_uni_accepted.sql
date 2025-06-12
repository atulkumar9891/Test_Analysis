{{config(materialized='table',
pre_hook ="TRUNCATE TABLE{{ this }}",
post_hook="TRUNCATE TABLE {{source('datafeed_shared_schema','stg_customers')}}"
)
}}

with tbl_01 as(
    select * from {{source('datafeed_shared_schema','stg_orders')}}

)
select * from tbl_01