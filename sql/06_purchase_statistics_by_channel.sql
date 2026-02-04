select 'online' as purchase_type, SUM(quantity) as total_quantity,
COUNT(distinct order_id) as total_unique_orders
from order_items_sql_project 
union all
select 'offline' as purchase_type, SUM(quantity),
COUNT (distinct store_order_id)
from store_order_items 
order by purchase_type;
