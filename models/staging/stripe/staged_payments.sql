WITH payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status as payment_status,
        amount / 100.0 as amount,
        created as payment_date

    from DEMO_DB.stripe.payment

)

SELECT * FROM payments