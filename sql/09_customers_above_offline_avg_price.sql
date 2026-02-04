select distinct osp.user_id
from orders_sql_project osp 
join order_items_sql_project oisp on osp.order_id = oisp.order_id
join products_sql_project psp on oisp.product_id = psp.product_id
where osp.user_id is not null 
and psp.product_price > (
select AVG(psp2.product_price) 
from store_order_items soi 
join products_sql_project psp2 on soi.product_id = psp2.product_id )
order by osp.user_id asc;
