-- Purpose: Combine online and offline orders into a unified purchase history for all known users
-- Output: user_id, order_date, order_id

select user_id, order_date, order_id as order_id
from orders_sql_project 
where user_id is not null
union all 
select user_id, order_date, store_order_id as order_id
from store_orders
where user_id is not null
order by user_id, order_date, order_id;
