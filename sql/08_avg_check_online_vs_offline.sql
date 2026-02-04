-- Purpose: Compare average order values between online and offline purchases
-- Output: purchase_type, avg_check

select purchase_type, AVG(order_total) as avg_check
from(
select 'online' as purchase_type, osp.order_id, 
SUM(oisp.quantity * psp.product_price) as order_total 
from orders_sql_project osp
join order_items_sql_project oisp on osp.order_id = oisp.order_id
join products_sql_project psp on oisp.product_id = psp.product_id
group by osp.order_id 
union all 
select 'offline' as purchase_type, so.store_order_id as order_id, 
SUM(soi.quantity * psp.product_price) as order_total 
from store_orders so 
join store_order_items soi on so.store_order_id = soi.store_order_id 
join products_sql_project psp on soi.product_id = psp.product_id 
group by so.store_order_id) t
group by purchase_type
order by  avg_check asc;
