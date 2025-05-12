{{ config(materialized='table')}}

with
emp_data as (
    select id,
           name, 
           salary,
           tax_amount,
           ({{calculate_amount('salary','tax_amount')}}) as total_amount
     from 
    {{source('datafeed_shared_schema','employees')}}
)
select * from emp_data
