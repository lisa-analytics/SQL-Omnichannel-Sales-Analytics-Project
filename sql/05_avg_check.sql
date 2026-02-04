select AVG(order_total) as avg_check
from (
select osp.order_id, 
SUM(oisp.quantity * psp.product_price) as order_total
from orders_sql_project osp
join payments_sql_project pay on osp.order_id = pay.order_id
join order_items_sql_project oisp on osp.order_id = oisp.order_id
join products_sql_project psp on oisp.product_id = psp.product_id
where pay.payment_status = 'Оплачено'
group by osp.order_id) t;
