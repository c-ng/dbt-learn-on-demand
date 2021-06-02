with customers as (

    select * from {{ ref('staged_customers')}}

),


orders as (

    select * from {{ ref('staged_orders') }}

),


payments as (

    select * from {{ ref('staged_payments') }}

),


fact_orders as (

select  orders.customer_id,
        orders.order_id,
        payments.amount

from orders

left join payments using (order_id)
where payment_status = 'success'

)

select * from fact_orders
