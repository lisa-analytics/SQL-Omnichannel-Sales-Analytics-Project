-- Purpose: Find users who purchased more than two units of the same product in both online and offline channels
-- Output: user_id

select distinct osp.user_id 
from orders_sql_project osp 
join order_items_sql_project oisp on osp.order_id = oisp.order_id
where osp.user_id is not null
and oisp.quantity > 2
intersect 
select distinct so.user_id
from store_orders so 
join store_order_items soi on so.store_order_id = soi.store_order_id
where so.user_id is not null
and soi.quantity > 2
order by user_id asc;
