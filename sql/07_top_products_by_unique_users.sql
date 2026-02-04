select product_id, COUNT(distinct user_id) as unique_users
from (
select oisp.product_id, osp.user_id
from orders_sql_project osp 
join order_items_sql_project oisp on osp.order_id = oisp.order_id
where osp.user_id is not null 
union all
select soi.product_id, so.user_id
from store_orders so 
join store_order_items soi on so.store_order_id = soi.store_order_id 
where so.user_id is not null) t
group by product_id 
order by unique_users desc
limit 3;
