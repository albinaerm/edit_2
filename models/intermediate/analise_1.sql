select c.first_name as nome,
c.last_name as apelido,
min(o.order_date) as primeira_encomenda
from dbt-tutorial.jaffle_shop.customers c
inner join dbt-tutorial.jaffle_shop.orders o 
on c.id = o.user_id
group by c.first_name, c.last_name