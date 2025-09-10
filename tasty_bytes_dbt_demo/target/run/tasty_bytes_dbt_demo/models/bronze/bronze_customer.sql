
  create or replace   view tasty_bytes_dbt_db.dev.bronze_customer
  
   as (
    select 2 as customer_id, 'customer 2' as customer_name, '2025-01-02'::date as created_on
union
select 3 as customer_id, 'customer 3' as customer_name, '2025-01-03'::date as created_on
  );

