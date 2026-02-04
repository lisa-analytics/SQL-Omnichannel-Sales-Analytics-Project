select osp.user_id 
from orders_sql_project osp 
join order_items_sql_project oisp on osp.order_id = oisp.order_id
where oisp.quantity > 2
and osp.user_id IN(
select so.user_id
from store_orders so 
join store_order_items soi on so.store_order_id = soi.store_order_id )
order by osp.user_id asc;
