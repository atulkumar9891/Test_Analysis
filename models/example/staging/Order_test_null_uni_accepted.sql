{{config(materialized='table')}}

with tbl_01 as(
    select * from {{source('datafeed_shared_schema','stg_orders')}}

)
select * from tbl_01