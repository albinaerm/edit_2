select c.customer_id, c.first_name, 
c.last_name, 
min(o.ORDER_DATE) first_order_date, 
max(o.ORDER_DATE) most_recent_order_date, 
count(o.order_id) number_of_orders, 
sum(p.amount) lifetime
from {{ref('stg_jaffle_shop__clientes')}} c
INNER JOIN {{ref('stg_jaffle_shop__orders')}} o on c.customer_id=o.customer_id
INNER JOIN {{ref('stg_stripe_payment')}} p on p.order_id=o.order_id
where p.payment_status='success'
group by c.customer_id, c.first_name, c.last_name