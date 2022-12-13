{{
    config(
        materialized='table'
    )
}}

with source as(

select distinct ID,SUPPLIED_NAME,SUPPLIED_COMPANY,TYPE,STATUS,REASON,PRIORITY,POTENTIAL_LIABILITY_C,
current_timestamp() as case_load_time from {{source('DEVELOPER_DB','CASE') }})

select ID,SUPPLIED_NAME,SUPPLIED_COMPANY,TYPE,STATUS,REASON,PRIORITY,POTENTIAL_LIABILITY_C,case_load_time from source