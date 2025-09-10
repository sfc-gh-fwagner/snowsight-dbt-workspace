use role accountadmin;
use secondary roles ALL;
use warehouse newton_dbt_wh;
use database tasty_bytes_dbt_db;

execute dbt project from workspace "USER$"."PUBLIC"."gh-dbt-workspace" project_root='tasty_bytes_dbt_demo' args='deps --target dev' external_access_integrations = (dbt_ext_access);


