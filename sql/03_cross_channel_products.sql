select product_id
from order_items_sql_project 
intersect 
select product_id
from store_order_items
order by product_id;
