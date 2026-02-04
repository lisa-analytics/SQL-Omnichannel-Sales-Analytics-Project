-- Purpose: Find users who made online purchases priced above the average offline product price
-- Output: user_id

with offline_products_avg as (
select AVG(psp.product_price) as avg_offline_price
from (
select distinct soi.product_id 
from store_order_items soi 
) op 
join products_sql_project psp on psp.product_id = op.product_id ),
all_purchases as (
select osp.user_id, oisp.product_id
from orders_sql_project osp 
join order_items_sql_project oisp on osp.order_id = oisp.order_id
where osp.user_id is not null 
union all
select so.user_id, soi.product_id
from store_orders so
join store_order_items soi on so.store_order_id = soi.store_order_id 
where so.user_id is not null)
select distinct ap.user_id
from all_purchases ap 
join products_sql_project psp on psp.product_id = ap.product_id
where psp.product_price  > (
select avg_offline_price 
from offline_products_avg)
order by ap.user_id;
