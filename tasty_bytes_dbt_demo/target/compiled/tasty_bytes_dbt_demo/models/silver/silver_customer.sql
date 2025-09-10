

select
    s.customer_id,
    s.customer_name,
    s.created_on,
    current_timestamp() as inserted_at
from
    tasty_bytes_dbt_db.dev.bronze_customer as s


    join (select coalesce(max(created_on),'1900-01-01') as _1 from tasty_bytes_dbt_db.dev.silver_customer)

    where s.created_on >= _1

