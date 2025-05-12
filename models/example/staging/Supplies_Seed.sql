{{config(materialized='table')}}

with Pers_products as(

    select sku,
    name
 from {{source('datafeed_shared_schema','products')}}
),

 seed_supplies as (
    select sku,
    name,
    perishable
 from {{ref('raw_supplies')}}
),

final_perisable as (
select 
p.sku as id ,
s.name as name,
s.perishable
from seed_supplies s 
join Pers_products p using (sku) where s.perishable='TRUE'
) 

select * from final_perisable