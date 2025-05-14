{% snapshot snap_order_check %}

{{config(
target_schema='snapshots',
strategy='check',
unique_key='id',
check_cols=['user_id','order_date', 'status'],
invalidate_hard_delete=True

)}}

select * from {{ source('datafeed_shared_schema', 'stg_orders') }} 

{%endsnapshot%}