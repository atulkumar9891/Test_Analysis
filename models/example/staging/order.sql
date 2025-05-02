{{ config(materialized='table') }}

WITH tb1  as(
 select
        id,
        order_id,
        payment_method
        
     from {{source('datafeed_shared_schema','stg_payments')}})
     select * from tb1
