-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into tasty_bytes_dbt_db.dev.silver_customer as DBT_INTERNAL_DEST
        using tasty_bytes_dbt_db.dev.silver_customer__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.customer_id = DBT_INTERNAL_DEST.customer_id))

    
    when matched then update set
        "CUSTOMER_ID" = DBT_INTERNAL_SOURCE."CUSTOMER_ID","CUSTOMER_NAME" = DBT_INTERNAL_SOURCE."CUSTOMER_NAME","CREATED_ON" = DBT_INTERNAL_SOURCE."CREATED_ON","INSERTED_AT" = DBT_INTERNAL_SOURCE."INSERTED_AT"
    

    when not matched then insert
        ("CUSTOMER_ID", "CUSTOMER_NAME", "CREATED_ON", "INSERTED_AT")
    values
        ("CUSTOMER_ID", "CUSTOMER_NAME", "CREATED_ON", "INSERTED_AT")

;
    commit;