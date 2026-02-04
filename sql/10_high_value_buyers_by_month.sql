with all_orders as (
select osp.order_id, osp.user_id, osp.order_date, 
SUM(oisp.quantity * psp.product_price) as order_total
from orders_sql_project osp 
join order_items_sql_project oisp on osp.order_id = oisp.order_id
join products_sql_project psp on oisp.product_id = psp.product_id
group by osp.order_id , osp.user_id , osp.order_date 
union all
select so.store_order_id as order_id, so.user_id, so.order_date, 
SUM(soi.quantity * psp.product_price) as order_total
from store_orders so 
join store_order_items soi  on so.store_order_id = soi.store_order_id 
join products_sql_project psp on soi.product_id = psp.product_id 
group by so.store_order_id , so.user_id, so.order_date),
avg_check as (
select AVG(order_total) as avg_total
from all_orders) 
select extract (month from order_date) as month, 
COUNT(distinct user_id) as buyers_count
from all_orders 
where order_total > (select avg_total from avg_check)
and user_id is not null 
group by month
order by month;
