-- Purpose: Calculate total online spending per user and rank users by highest spending
-- Output: user_id, total_spent

select osp.user_id, 
SUM (oisp.quantity * psp.product_price) as total_spent
from orders_sql_project osp
join order_items_sql_project oisp on osp.order_id = oisp.order_id
join products_sql_project psp on oisp.product_id = psp.product_id
group by osp.user_id 
order by total_spent desc;
