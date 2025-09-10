{{
    config(
        materialized='incremental',
        unique_key='customer_id',
        incremental_strategy='merge'
    )
}}

select
    s.customer_id,
    s.customer_name,
    s.created_on,
    current_timestamp() as inserted_at
from
    {{ ref('bronze_customer') }} as s

{% if is_incremental() %}
    join (select coalesce(max(created_on),'1900-01-01') as _1 from {{ this }})

    where s.created_on >= _1

{% endif %}